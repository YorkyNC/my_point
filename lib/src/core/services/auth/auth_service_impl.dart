import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../main.dart';
import '../../api/client/endpoints.dart';
import '../../api/client/rest/dio/dio_client.dart';
import '../../exceptions/domain_exception.dart';
import '../storage/storage_service_impl.dart';
import 'entities/user_entity.dart';
import 'i_auth_service.dart';
import 'models/forgot_password_request.dart';
import 'models/forgot_password_response.dart';
import 'models/refresh_token_response.dart';
import 'models/sign_in_request.dart';
import 'models/sign_in_response.dart';
import 'models/update_password_request.dart';
import 'models/update_password_response.dart';
import 'models/verify_request.dart';
import 'models/verify_response.dart';

@named
@LazySingleton(as: IAuthService)
class AuthServiceImpl implements IAuthService {
  AuthServiceImpl(this.client);

  final DioRestClient client;
  final StorageServiceImpl st = StorageServiceImpl();
  final Map<String, String> headers = {'Content-Type': 'application/json'};

  final _tokenAuthStreamController = StreamController<String>.broadcast();

  @override
  Stream<String> get tokenAuthStream => _tokenAuthStreamController.stream;

  @override
  Future<Either<DomainException, SignInResponse>> loginUser(
      SignInRequest request) async {
    log.i('AuthService: Starting login process, clearing all auth data');

    // Clear all auth data before new login
    await st.deleteToken();
    await st.deleteRefreshToken();
    await st.clear();

    // Additional wait to ensure storage is flushed
    await Future.delayed(const Duration(milliseconds: 50));

    // Verify tokens are actually cleared
    final tokenAfterClear = st.getToken();
    final refreshAfterClear = st.getRefreshToken();
    log.d(
        'AuthService: After clear - Token: $tokenAfterClear, Refresh: $refreshAfterClear');

    final Either<DomainException, Response<dynamic>> response =
        await client.post(
      EndPoints.login,
      data: request,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
    );

    return response.fold(
      (error) => Left(error),
      (result) async {
        log.d('AuthService: Login response status: ${result.statusCode}');
        if (result.statusCode == 200) {
          final response = SignInResponse.fromJson(result.data);
          await st.setToken(response.data.accessToken);
          await st.setRefreshToken(response.data.refreshToken);
          _tokenAuthStreamController.add(response.data.accessToken);
          log.i('AuthService: Login successful, new token added to stream');
          return Right(response);
        } else {
          return Left(UnknownException(message: result.statusMessage));
        }
      },
    );
  }

  @override
  Future<Either<DomainException, UserEntity>> getUser() async {
    final Either<DomainException, Response<dynamic>> response =
        await client.get(
      EndPoints.getUser,
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    return response.fold(
      (error) => Left(error),
      (response) async {
        if (response.statusCode == 200) {
          return Right(UserEntity.fromJson(response.data));
        } else {
          return Left(UnknownException(message: response.statusMessage));
        }
      },
    );
  }

  @override
  Future<Either<DomainException, VerifyResponse>> verifyUser(
      VerifyRequest request) async {
    try {
      final Either<DomainException, Response<dynamic>> response =
          await client.patch(
        EndPoints.passwordReset,
        data: VerifyRequest(
          code: request.code,
          password: request.password,
          confirmPassword: request.confirmPassword,
        ),
        options: Options(
          method: 'PATCH',
          headers: headers,
        ),
      );

      return response.fold(
        (error) => Left(error),
        (response) async {
          if (response.statusCode == 200) {
            await st.deleteToken();
            final String token =
                VerifyResponse.fromJson(response.data).toString();
            await st.setToken(token);
            return Right(VerifyResponse.fromJson(response.data));
          } else {
            return Left(UnknownException(message: response.statusMessage));
          }
        },
      );
    } catch (e) {
      log.e('Exception caught during verification: $e');
      return Left(
          e is DomainException ? e : UnknownException(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainException, VerifyResponse>> verifyPasswordReset(
      VerifyRequest request, int passwordResetId) async {
    try {
      final String endpoint = "${EndPoints.passwordReset}/$passwordResetId";
      log.d('Verifying password reset with endpoint: $endpoint');
      log.d('Request data: ${request.toJson()}');

      Map<String, dynamic> requestData;
      if (request.password != null && request.confirmPassword != null) {
        requestData = {
          'password': request.password,
          'confirmPassword': request.confirmPassword
        };
      } else {
        requestData = {'code': request.code};
      }

      final Either<DomainException, Response<dynamic>> response =
          await client.patch(
        endpoint,
        data: requestData,
        options: Options(
          method: 'PATCH',
          headers: headers,
        ),
      );

      return response.fold(
        (error) {
          log.e('Error in password reset verification: $error');
          return Left(error);
        },
        (response) async {
          log.d('Password reset verification response: ${response.statusCode}');
          if (response.statusCode == 200) {
            if (request.password != null) {
              await st.deleteToken();
              log.i('Password reset successful, token cleared for login');
            }
            return Right(VerifyResponse.fromJson(response.data));
          } else {
            log.e('Error response: ${response.statusMessage}');
            return Left(UnknownException(
                message: response.statusMessage ?? 'Unknown error'));
          }
        },
      );
    } catch (e) {
      log.e('Exception caught during password reset verification: $e');
      return Left(
        e is DomainException ? e : UnknownException(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<DomainException, UpdatePasswordResponse>>
      changeTemporaryPassword(UpdatePasswordRequest request) async {
    try {
      log.d('Sending set password request: ${request.toJson()}');

      final Either<DomainException, Response<dynamic>> response =
          await client.patch(
        EndPoints.temporaryPassword,
        options: Options(
          method: 'PATCH',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${st.getToken()}',
          },
        ),
        data: request.toJson(),
      );

      return response.fold(
        (error) {
          log.e('Error updating password: $error');
          return Left(error);
        },
        (response) async {
          log.d('Password update response status: ${response.statusCode}');
          if (response.statusCode == 200) {
            return Right(UpdatePasswordResponse.fromJson(response.data));
          } else {
            log.e('Error response data: ${response.data}');
            return Left(UnknownException(
                message: response.statusMessage ?? "Unknown error"));
          }
        },
      );
    } catch (e) {
      log.e('Exception during password update: $e');
      return Left(
          e is DomainException ? e : UnknownException(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainException, UpdatePasswordResponse>>
      changePermanentPassword(UpdatePasswordRequest request) async {
    try {
      log.d('Sending set password request: ${request.toJson()}');

      final Either<DomainException, Response<dynamic>> response =
          await client.patch(
        EndPoints.permanentPassword,
        options: Options(
          method: 'PATCH',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${st.getToken()}',
          },
        ),
        data: request.toJson(),
      );

      return response.fold(
        (error) {
          log.e('Error updating password: $error');
          return Left(error);
        },
        (response) async {
          log.d('Password update response status: ${response.statusCode}');
          if (response.statusCode == 200) {
            return Right(UpdatePasswordResponse.fromJson(response.data));
          } else {
            log.e('Error response data: ${response.data}');
            return Left(UnknownException(
                message: response.statusMessage ?? "Unknown error"));
          }
        },
      );
    } catch (e) {
      log.e('Exception during password update: $e');
      return Left(
          e is DomainException ? e : UnknownException(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainException, ForgotPasswordResponses>> forgotPassword(
      ForgotPasswordRequest request) async {
    st.deleteToken();
    final Either<DomainException, Response<dynamic>> response =
        await client.post(
      EndPoints.forgotPassword,
      data: request,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
    );
    return response.fold(
      (error) => Left(error),
      (response) async {
        if (response.statusCode == 200) {
          return Right(
            ForgotPasswordResponses.fromJson(
              response.data,
              (json) =>
                  ForgotPasswordResponse.fromJson(json as Map<String, dynamic>),
            ),
          );
        } else {
          return Left(UnknownException(message: response.statusMessage));
        }
      },
    );
  }

  @override
  Future<Either<DomainException, RefreshTokenResponse>> refreshToken() async {
    String? refreshToken = st.getRefreshToken();
    if (refreshToken == null) {
      return Left(UnknownException(message: "No refresh token found"));
    }

    try {
      final response = await client.post(
        EndPoints.refreshToken,
        data: {'refreshToken': refreshToken},
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      return response.fold(
        (error) => Left(error),
        (response) async {
          if (response.statusCode == 200) {
            await st.deleteToken();
            await st.deleteRefreshToken();

            await st.setToken(response.data['accessToken']);
            await st.setRefreshToken(response.data['refreshToken']);
            return Right(RefreshTokenResponse.fromJson(response.data));
          } else {
            return Left(UnknownException(message: response.statusMessage));
          }
        },
      );
    } on DioException catch (e) {
      log.e('DioException caught during refreshing token: $e');
      return Left(NetworkException(message: e.message!));
    } catch (e) {
      log.e('Exception caught during refreshing token: $e');
      return Left(
          e is DomainException ? e : UnknownException(message: e.toString()));
    }
  }
}
