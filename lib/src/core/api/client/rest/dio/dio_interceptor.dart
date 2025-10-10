part of 'dio_client.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor({Dio? dio}) : dio = dio ?? Dio();

  final StorageServiceImpl st = StorageServiceImpl();
  final Dio dio;

  bool _isRefreshing = false;
  Completer<String>? _refreshCompleter;
  final _queue = <QueueItem>[];

  /// Clear any cached data in the interceptor
  static void clearCache() {
    log.d('DioInterceptor: Clearing all cached data');
    // If there were any static caches, we'd clear them here
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? accessToken = st.getToken();

    log.d(
      'DioInterceptor: Retrieved token from storage: ${accessToken?.substring(0, accessToken.length > 20 ? 20 : accessToken.length)}...',
    );

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
      log.d('DioInterceptor: Added Authorization header to request');
      // log.d('Full Headers After Setting: ${options.headers}'); // Check full headers
    } else {
      log.w('No token available in storage');
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log.d('Response: ${response.statusCode} ${response.statusMessage}');
    return handler.next(response);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    log.e('Error Status Code: ${err.response?.statusCode}');
    log.e('Error Response: ${err.response?.data}');

    // Token refresh temporarily disabled for testing
    return handler.next(err);

    // if (err.response?.statusCode != 401) {
    //   return handler.next(err);
    // }

    // log.w('Received 401 error. Attempting to refresh token...');
    // final requestOptions = err.requestOptions;

    // try {
    //   final token = await _refreshTokenAndGetNew(requestOptions);
    //   if (token == null) {
    //     await _handleRefreshFailure(handler, err);
    //     return;
    //   }

    //   final response = await _retryRequest(requestOptions, token);
    //   return handler.resolve(response);
    // } catch (e) {
    //   log.e('Error during refresh and retry: $e');
    //   await _handleRefreshFailure(handler, err);
    // }
  }

  Future<String?> _refreshTokenAndGetNew(RequestOptions requestOptions) async {
    // Add request to queue
    final completer = Completer<Response>();
    _queue.add(QueueItem(requestOptions, completer));

    try {
      if (!_isRefreshing) {
        _isRefreshing = true;
        _refreshCompleter = Completer<String>();

        final refreshed = await _refreshToken();
        if (refreshed) {
          final newToken = st.getToken();
          _refreshCompleter?.complete(newToken);
          return newToken;
        } else {
          _refreshCompleter?.completeError('Refresh failed');
          return null;
        }
      } else {
        return await _refreshCompleter?.future;
      }
    } catch (e) {
      _refreshCompleter?.completeError(e);
      rethrow;
    } finally {
      if (_isRefreshing) {
        _isRefreshing = false;
        await _processQueue();
      }
    }
  }

  Future<bool> _refreshToken() async {
    final String? refreshToken = st.getRefreshToken();
    if (refreshToken == null) {
      log.e('No refresh token available.');
      return false;
    }

    try {
      log.i('Attempting token refresh');
      final response = await dio.post(
        EndPoints.baseUrl + EndPoints.refreshToken,
        data: {"refreshToken": refreshToken},
        options: Options(
          headers: {'Content-Type': 'application/json'},
          sendTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = RefreshTokenResponse.fromJson(response.data);
        if (data.data.accessToken.isNotEmpty && data.data.refreshToken.isNotEmpty) {
          await st.setToken(data.data.accessToken);
          await st.setRefreshToken(data.data.refreshToken);
          // roleNotifier.notify();
          log.i('Token refresh successful');
          return true;
        }
      }

      log.e('Invalid response during token refresh: ${response.statusCode}');
      return false;
    } catch (e) {
      log.e('Token refresh failed with error: $e');
      return false;
    }
  }

  Future<void> _processQueue() async {
    final token = st.getToken();
    if (token == null) {
      _clearQueue();
      return;
    }

    final requests = List<QueueItem>.from(_queue);
    _queue.clear();

    for (final item in requests) {
      try {
        final response = await _retryRequest(item.options, token);
        item.completer.complete(response);
      } catch (e) {
        item.completer.completeError(e);
      }
    }
  }

  void _clearQueue() {
    for (final item in _queue) {
      item.completer.completeError('Authentication failed');
    }
    _queue.clear();
  }

  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions, String token) async {
    final options = Options(
      method: requestOptions.method,
      headers: {...requestOptions.headers, 'Authorization': 'Bearer $token'},
      validateStatus: (status) => status != null && status < 500,
    );

    final retryDio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    return retryDio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<void> _handleRefreshFailure(ErrorInterceptorHandler handler, DioException originalError) async {
    log.w('Token refresh failed, logging out user');
    await logoutUser();
    _clearQueue();

    handler.reject(
      DioException(
        requestOptions: originalError.requestOptions,
        error: 'Authentication failed. Please log in again.',
        type: DioExceptionType.unknown,
        response: originalError.response,
      ),
    );
  }

  Future<void> logoutUser() async {
    log.i('Logging out user - starting token deletion process');

    // Delete tokens first - this is critical for the GoRouter redirect
    await st.deleteToken();
    log.d('Access token deleted');

    await st.deleteRefreshToken();
    log.d('Refresh token deleted');

    // Clear auth box
    await st.clear();
    log.d('Auth storage cleared');

    // Clear all storage
    await st.clearAll();
    log.d('All storage cleared, notifying listeners');

    // This single call is crucial for GoRouter to detect the change and redirect
    st.notify();

    log.d('Listeners notified, redirection to login should occur');
  }
}

class QueueItem {
  final RequestOptions options;
  final Completer<Response> completer;

  QueueItem(this.options, this.completer);
}
