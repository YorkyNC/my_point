import 'package:fpdart/fpdart.dart';
import 'package:my_point/src/features/login/domain/entities/sign_in_entity.dart';
import 'package:my_point/src/features/login/domain/entities/sign_up_entity.dart';
import 'package:my_point/src/features/login/domain/request/sign_in_request.dart';
import 'package:my_point/src/features/login/domain/request/sign_up_request.dart';

import '../../../../core/exceptions/domain_exception.dart';

abstract class IAuthRepository {
  Future<Either<DomainException, SignInEntity>> signIn(
    SignInRequest body,
  );
  Future<Either<DomainException, SignUpEntity>> signUp(
    SignUpRequest body,
  );
  // Future<Either<DomainException, VerifyResponse>> verifyUser(
  //   VerifyRequest body,
  // );

  // Future<Either<DomainException, UserEntity>> getUser();

  // Future<Either<DomainException, ForgotPasswordResponses>> forgotPassword(
  //   ForgotPasswordRequest body,
  // );

  // Future<Either<DomainException, UpdatePasswordResponse>> changeTemporaryPassword(
  //   UpdatePasswordRequest body,
  // );

  // Future<Either<DomainException, UpdatePasswordResponse>> changePermanentPassword(
  //   UpdatePasswordRequest body,
  // );

  // Future<Either<DomainException, RefreshTokenResponse>> refreshToken();

  // /// Verifies the OTP code and resets the password in the password reset flow
  // ///
  // /// First call: Verify the OTP code only with passwordResetId in the URL
  // /// Second call: Reset password with new password and confirm password, with passwordResetId in URL
  // Future<Either<DomainException, VerifyResponse>> verifyPasswordReset(
  //   VerifyRequest body,
  //   int passwordResetId,
  // );
}
