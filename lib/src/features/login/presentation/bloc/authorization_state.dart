part of 'authorization_bloc.dart';

@freezed
abstract class AuthorizationState with _$AuthorizationState {
  const AuthorizationState._();
  const factory AuthorizationState({
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
  }) = _AuthorizationState;
}
