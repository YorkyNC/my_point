part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required String username,
    required String password,
  }) = _Login;

  const factory AuthEvent.getUser() = _GetUser;

  const factory AuthEvent.refreshToken() = _RefreshToken;

  const factory AuthEvent.forgotPassword({
    required String email,
  }) = _ForgotPassword;

  const factory AuthEvent.changeTemporaryPassword({
    required String password,
    required String confirmPassword,
  }) = _ChangeTemporaryPassword;

  const factory AuthEvent.changePermanentPassword({
    required String password,
    required String confirmPassword,
  }) = _ChangePermanentPassword;

  // First step: Verify OTP code only
  const factory AuthEvent.verifyOtp({
    required String code,
    required int passwordResetId,
  }) = _VerifyOtp;

  // Second step: Reset password with new credentials
  const factory AuthEvent.resetPassword({
    required String password,
    required String confirmPassword,
    required int passwordResetId,
  }) = _ResetPassword;

  const factory AuthEvent.verify({
    String? code,
    String? password,
    String? confirmPassword,
  }) = _Verify;

  const factory AuthEvent.setPasswordResetId({
    int? passwordResetId,
  }) = _SetPasswordResetId;
}
