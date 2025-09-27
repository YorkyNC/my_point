import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = 'cancelRequest';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'connectionTimeout';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'receiveTimeout';
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = 'sendTimeout';
        break;
      case DioExceptionType.unknown:
        if (dioError.message == null) {
          message = 'unexpectedError';
          break;
        }

        if (dioError.message!.contains('SocketException')) {
          message = 'noInternetConnection';
          break;
        }

        message = 'unexpectedError';
        break;
      default:
        message = 'unexpectedError';
        break;
    }
  }

  String _handleError(int? statusCode, error) {
    switch (statusCode) {
      case 400:
        return 'badRequest';
      case 401:
        return '401';
      case 403:
        return 'forbidden';
      case 404:
        return error['detail'];
      case 500:
        return 'internalServerError';
      case 502:
        return 'badGateway';
      default:
        return 'unexpectedError';
    }
  }

  @override
  String toString() => message;
}
