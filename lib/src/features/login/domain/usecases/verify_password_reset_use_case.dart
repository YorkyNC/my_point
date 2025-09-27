import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/domain_exception.dart';
import '../../../../core/services/auth/models/models.dart';
import '../../data/repositories/i_auth_repository.dart';
import '../repositories/auth_repository_impl.dart';

/// Use case for verifying OTP and resetting password in the password reset flow
///
/// This use case handles:
/// 1. Verifying the OTP code with passwordResetId
/// 2. Setting the new password with password and confirm password
@lazySingleton
class VerifyPasswordResetUseCase {
  final IAuthRepository _authRepository;

  VerifyPasswordResetUseCase(
      @Named.from(AuthRepositoryImpl) this._authRepository);

  /// Executes the verification for password reset flow
  ///
  /// For the password reset flow, this method is called twice:
  /// 1. First to verify the OTP code only (with passwordResetId)
  /// 2. Then to reset the password with the new password and confirm password (with same passwordResetId)
  Future<Either<DomainException, VerifyResponse>> execute(
          VerifyRequest requestModel, int passwordResetId) async =>
      _authRepository.verifyPasswordReset(requestModel, passwordResetId);
}
