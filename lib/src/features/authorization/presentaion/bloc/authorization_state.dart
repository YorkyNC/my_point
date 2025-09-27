part of 'authorization_bloc.dart';

@freezed
abstract class AuthorizationState with _$AuthorizationState {
  const AuthorizationState._();
  const factory AuthorizationState({
    String? phoneNumber,
    String? otp,
    String? phoneCode,
    @Default([]) List<String> otpDigits,
    @Default(60) int remainingSeconds,
    @Default(false) bool canRequestCode,
    @Default(false) bool isPhoneNumberFilled,
    @Default(false) bool isOtpFilled,
    @Default(false) bool isPhoneCodeFilled,
    @Default(false) bool isVerifying,
    @Default(false) bool isOtpVerified,
    String? errorMessage,
  }) = _AuthorizationState;
}
