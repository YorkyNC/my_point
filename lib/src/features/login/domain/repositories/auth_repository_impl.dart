// import 'package:fpdart/fpdart.dart';
// import 'package:injectable/injectable.dart';
// import '../../../../../main.dart';
// import '../../../../core/services/auth/entities/user_entity.dart';
// import '../../../../core/services/auth/models/sign_in_response.dart';
// import '../../../../core/services/auth/models/update_password_request.dart';
// import '../../../../core/services/auth/models/update_password_response.dart';

// import '../../../../core/exceptions/domain_exception.dart';
// import '../../../../core/services/auth/auth_service_impl.dart';
// import '../../../../core/services/auth/i_auth_service.dart';
// import '../../../../core/services/auth/models/forgot_password_response.dart';
// import '../../../../core/services/auth/models/models.dart';
// import '../../../../core/services/auth/models/refresh_token_response.dart';
// import '../../data/repositories/i_auth_repository.dart';

// @named
// @LazySingleton(as: IAuthRepository)
// class AuthRepositoryImpl implements IAuthRepository {
//   final IAuthService _authService;

//   AuthRepositoryImpl(@Named.from(AuthServiceImpl) this._authService);

//   @override
//   Future<Either<DomainException, SignInResponse>> loginUser(
//       SignInRequest body) async {
//     try {
//       final requests = await _authService.loginUser(body);
//       return requests.fold(
//         (error) {
//           return Left(error);
//         },
//         (response) => Right(response),
//       );
//     } catch (e) {
//       log.e(e.toString());
//       return Left(UnknownException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<DomainException, UserEntity>> getUser() async {
//     try {
//       final requests = await _authService.getUser();
//       return requests.fold(
//         (error) => Left(error),
//         (response) {
//           final UserEntity result = response;

//           return Right(result);
//         },
//       );
//     } catch (e) {
//       log.e(e.toString());
//       return Left(UnknownException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<DomainException, VerifyResponse>> verifyUser(
//       VerifyRequest body) async {
//     try {
//       final requests = await _authService.verifyUser(body);
//       return requests.fold(
//         (error) => Left(error),
//         (response) {
//           final VerifyResponse result = response;
//           return Right(result);
//         },
//       );
//     } catch (e) {
//       log.e(e.toString());
//       return Left(UnknownException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<DomainException, ForgotPasswordResponses>> forgotPassword(
//       ForgotPasswordRequest body) async {
//     try {
//       final requests = await _authService.forgotPassword(body);
//       return requests.fold(
//         (error) => Left(error),
//         (response) {
//           final ForgotPasswordResponses result = ForgotPasswordResponses(
//             data: response.data,
//             status: response.status,
//           );
//           return Right(result);
//         },
//       );
//     } catch (e) {
//       log.e(e.toString());
//       return Left(UnknownException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<DomainException, RefreshTokenResponse>> refreshToken() async {
//     try {
//       final requests = await _authService.refreshToken();
//       return requests.fold(
//         (error) => Left(error),
//         (response) {
//           return Right(response);
//         },
//       );
//     } catch (e) {
//       log.e(e.toString());
//       return Left(UnknownException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<DomainException, UpdatePasswordResponse>>
//       changeTemporaryPassword(UpdatePasswordRequest body) async {
//     try {
//       final requests = await _authService.changeTemporaryPassword(body);
//       return requests.fold(
//         (error) => Left(error),
//         (response) {
//           log.e(response.toString());
//           final UpdatePasswordResponse result = UpdatePasswordResponse(
//             message: response.message,
//           );
//           return Right(result);
//         },
//       );
//     } catch (e) {
//       log.e(e.toString());
//       return Left(UnknownException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<DomainException, UpdatePasswordResponse>>
//       changePermanentPassword(UpdatePasswordRequest body) async {
//     try {
//       final requests = await _authService.changePermanentPassword(body);
//       return requests.fold(
//         (error) => Left(error),
//         (response) {
//           return Right(response);
//         },
//       );
//     } catch (e) {
//       log.e(e.toString());
//       return Left(UnknownException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<DomainException, VerifyResponse>> verifyPasswordReset(
//       VerifyRequest body, int passwordResetId) async {
//     try {
//       final requests =
//           await _authService.verifyPasswordReset(body, passwordResetId);
//       return requests.fold(
//         (error) => Left(error),
//         (response) {
//           final VerifyResponse result = response;
//           return Right(result);
//         },
//       );
//     } catch (e) {
//       log.e(e.toString());
//       return Left(UnknownException(message: e.toString()));
//     }
//   }
// }
