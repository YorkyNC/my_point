import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../main.dart';
import '../../../../exceptions/domain_exception.dart';
import '../../../../services/auth/models/refresh_token_response.dart';
import '../../../../services/storage/storage_service_impl.dart';
import '../../endpoints.dart';
import 'curl_logger_interceptor.dart';
import 'dio_exceptions.dart';

part 'dio_config.dart';
part 'dio_interceptor.dart';

@Singleton()
class DioRestClient {
  late final Dio _dio;

  DioRestClient() {
    _dio = Dio();
  }

  final StorageServiceImpl st = StorageServiceImpl();

  // Dio Client configurations
  @PostConstruct(preResolve: true)
  Future<void> init() async {
    BaseOptions options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: DioConfigurations.connectTimeout,
      receiveTimeout: DioConfigurations.receiveTimeout,
    );
    _dio.options = options;

    // Add curl logger interceptor first to log the raw request
    _dio.interceptors.add(CurlLoggerInterceptor());

    // Add custom DioInterceptor for authentication
    _dio.interceptors.add(DioInterceptor(dio: _dio));
  }

  Dio get dio => _dio;

  //Get:-----------------------------------------------------------------------
  Future<Either<DomainException, Response>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(response);
    } on DioException catch (e, s) {
      if (e.response?.statusCode == 401) {
        return Left(AuthenticationException.invalidCredentials());
      }
      return Left(_handleDioException(e, s));
    } catch (e, s) {
      return Left(_handleError(e, s));
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Either<DomainException, Response>> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(response);
    } on DioException catch (e, s) {
      if (e.response?.statusCode == 401) {
        return Left(AuthenticationException.invalidCredentials());
      }
      return Left(_handleDioException(e, s));
    } catch (e, s) {
      return Left(_handleError(e, s));
    }
  }

  // Patch:----------------------------------------------------------------------
  Future<Either<DomainException, Response>> patch(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(response);
    } on DioException catch (e, s) {
      if (e.response?.statusCode == 401) {
        return Left(AuthenticationException.invalidCredentials());
      }
      return Left(_handleDioException(e, s));
    } catch (e, s) {
      return Left(_handleError(e, s));
    }
  }

// Put:-----------------------------------------------------------------------
  Future<Either<DomainException, Response>> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(response);
    } catch (e, s) {
      return Left(_handleError(e, s));
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<Either<DomainException, Response>> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return Right(response.data);
    } catch (e, s) {
      return Left(_handleError(e, s));
    }
  }

  // Upload:--------------------------------------------------------------------
  Future<Either<DomainException, Response>> upload(
    String url, {
    required String filePath,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: FormData.fromMap({
          'file': await MultipartFile.fromFile(filePath),
        }),
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(response);
    } catch (e, s) {
      return Left(_handleError(e, s));
    }
  }

  // Upload multiple files:-----------------------------------------------------
  Future<Either<DomainException, Response>> uploadMultipleFiles(
    String url, {
    required List<String> filePaths,
    List<String>? filenames,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: FormData.fromMap({
          'files': filePaths
              .map(
                (file) => MultipartFile.fromFileSync(
                  file,
                  filename: filenames?[filePaths.indexOf(file)],
                ),
              )
              .toList(),
        }),
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(response);
    } catch (e, s) {
      return Left(_handleError(e, s));
    }
  }

  // Download:------------------------------------------------------------------
  Future<Either<DomainException, Response>> download(
    String url,
    String savePath, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.download(
        url,
        savePath,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(response);
    } catch (e, s) {
      return Left(_handleError(e, s));
    }
  }

  DomainException _handleError(e, StackTrace s) {
    if (e is DioException) {
      return _handleDioException(e, s);
    }
    return UnknownException();
  }

  DomainException _handleDioException(
    DioException e,
    StackTrace s,
  ) {
    final errorMessage = DioExceptions.fromDioError(e).toString();
    return NetworkException(message: errorMessage, stackTrace: s);
  }
}
