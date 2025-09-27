import 'package:fpdart/fpdart.dart';
import 'entities/user_entity.dart';
import 'models/sign_in_response.dart';
import 'models/update_password_request.dart';
import 'models/update_password_response.dart';

import '../../exceptions/domain_exception.dart';
import 'models/forgot_password_request.dart';
import 'models/forgot_password_response.dart';
import 'models/refresh_token_response.dart';
import 'models/sign_in_request.dart';
import 'models/verify_request.dart';
import 'models/verify_response.dart';

abstract class IAuthService {
  Future<Either<DomainException, SignInResponse>> loginUser(SignInRequest body);
  Future<Either<DomainException, VerifyResponse>> verifyUser(
      VerifyRequest request);

  Future<Either<DomainException, UserEntity>> getUser();

  Future<Either<DomainException, RefreshTokenResponse>> refreshToken();

  Future<Either<DomainException, ForgotPasswordResponses>> forgotPassword(
      ForgotPasswordRequest request);

  Future<Either<DomainException, UpdatePasswordResponse>>
      changeTemporaryPassword(UpdatePasswordRequest request);

  Future<Either<DomainException, UpdatePasswordResponse>>
      changePermanentPassword(UpdatePasswordRequest request);

  /// Verifies OTP and/or resets password with passwordResetId
  ///
  /// First call verifies only OTP code
  /// Second call sends new password and confirm password
  Future<Either<DomainException, VerifyResponse>> verifyPasswordReset(
      VerifyRequest request, int passwordResetId);

  Stream<String> get tokenAuthStream;
}
