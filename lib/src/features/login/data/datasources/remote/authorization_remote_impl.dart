import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/features/login/domain/entities/request_otp_code_entity.dart';
import 'package:my_point/src/features/login/domain/entities/sign_in_entity.dart';
import 'package:my_point/src/features/login/domain/entities/sign_up_entity.dart';
import 'package:my_point/src/features/login/domain/entities/verify_otp_entity.dart';
import 'package:my_point/src/features/login/domain/request/request_otp_code.dart';
import 'package:my_point/src/features/login/domain/request/sign_in_request.dart';
import 'package:my_point/src/features/login/domain/request/sign_up_request.dart';
import 'package:my_point/src/features/login/domain/request/verify_otp_request.dart';

import '../../../../../../main.dart';
import '../../../../../core/api/client/endpoints.dart';
import '../../../../../core/api/client/rest/dio/dio_client.dart';
import '../../../../../core/exceptions/domain_exception.dart';
import '../../../../../core/services/storage/storage_service_impl.dart';
import 'i_authorization_remote.dart';

@named
@LazySingleton(as: IAuthorizationRemote)
class AuthorizationRemoteImpl implements IAuthorizationRemote {
  final client = DioRestClient();
  StorageServiceImpl st = StorageServiceImpl();
  Map<String, String> headers = {
    'accept': 'application/json',
    'Authorization': 'Bearer ${StorageServiceImpl().getToken()}',
  };
  @override
  Future<Either<DomainException, SignInEntity>> signIn(SignInRequest request) async {
    final Either<DomainException, Response<dynamic>> response = await client.post(
      '${EndPoints.baseUrl}${EndPoints.signIn}',
      data: request.toJson(),
      options: Options(
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ${StorageServiceImpl().getToken()}',
        },
      ),
    );
    return response.fold(
      (error) {
        log.d(request.email.toString());
        return Left(error);
      },
      (result) async {
        final data = result.data;
        if (data == null) {
          return Left(UnknownException(message: 'Response data is null'));
        }
        return Right(SignInEntity.fromJson(data));
      },
    );
  }

  @override
  Future<Either<DomainException, SignUpEntity>> signUp(SignUpRequest request) async {
    final Either<DomainException, Response<dynamic>> response = await client.post(
      '${EndPoints.baseUrl}${EndPoints.signUp}',
      data: request.toJson(),
      options: Options(
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ${StorageServiceImpl().getToken()}',
        },
      ),
    );
    return response.fold(
      (error) {
        return Left(error);
      },
      (result) async {
        final data = result.data;

        if (data == null) {
          return Left(UnknownException(message: 'Response data is null'));
        }

        if (data is Map && data.containsKey('data')) {
          return Right(SignUpEntity.fromJson(data['data']));
        } else {
          return Right(SignUpEntity.fromJson(data));
        }
      },
    );
  }

  @override
  Future<Either<DomainException, VerifyOtpEntity>> verifyOtp(VerifyOtpRequest request) async {
    final Either<DomainException, Response<dynamic>> response = await client.post(
      '${EndPoints.baseUrl}${EndPoints.verifyOtp}',
      data: request.toJson(),
      options: Options(
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${StorageServiceImpl().getToken()}',
        },
      ),
    );
    return response.fold(
      (error) {
        return Left(error);
      },
      (result) async {
        final data = result.data;

        if (data == null) {
          return Left(UnknownException(message: 'Response data is null'));
        }

        if (data is Map && data.containsKey('data')) {
          return Right(VerifyOtpEntity.fromJson(data['data']));
        } else {
          return Right(VerifyOtpEntity.fromJson(data));
        }
      },
    );
  }

  @override
  Future<Either<DomainException, RequestOtpCodeEntity>> requestOtpCode(RequestOtpCode request) async {
    final Either<DomainException, Response<dynamic>> response = await client.get(
      '${EndPoints.baseUrl}${EndPoints.requestOtpCode}',
      queryParameters: {
        'phoneNumber': request.phoneNumber,
      },
      options: Options(
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${StorageServiceImpl().getToken()}',
        },
      ),
    );

    return response.fold(
      (error) {
        return Left(error);
      },
      (result) async {
        final data = result.data;

        if (data == null) {
          return Left(UnknownException(message: 'Response data is null'));
        }
        if (data is Map && data.containsKey('data')) {
          if (data['data'] == null) {
            return Left(UnknownException(message: 'Response data[\'data\'] is null'));
          }
          return Right(RequestOtpCodeEntity.fromJson(data['data']));
        } else {
          return Right(RequestOtpCodeEntity.fromJson(data));
        }
      },
    );
  }
}
