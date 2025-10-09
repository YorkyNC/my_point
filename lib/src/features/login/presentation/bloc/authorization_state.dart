part of 'authorization_bloc.dart';

@freezed
abstract class AuthorizationState with _$AuthorizationState {
  const AuthorizationState._();
  const factory AuthorizationState({
    @Default(false) bool isValidate,
    String? otp,
    @Default(false) bool isOtpFilled,
    @Default(false) bool isOtpError,
    @Default(false) bool isOtpLoading,
    @Default(false) bool isOtpSuccess,
    String? phoneCode,
    @Default(false) bool isPhoneCodeFilled,
    String? flag,
    String? phoneNumber,
    @Default(false) bool isPhoneNumberFilled,
    @Default(false) bool isLoading,
    @Default(false) bool success,
    @Default(60) int remainingSeconds,
    @Default(false) bool canRequestCode,
    @Default(false) bool isTimerRunning,
    @Default(false) bool isEmailFilled,
    String? password,
    String? email,
    @Default(false) bool isPasswordFilled,
    @Default(true) bool isObscurePassword,
    String? error,
    String? token,
  }) = _AuthorizationState;

  bool get isLoginVerified {
    final result = isEmailFilled && isPasswordFilled;
    return result;
  }
}
