part of 'authorization_bloc.dart';

sealed class AuthorizationEvent {
  const AuthorizationEvent();
}

class SavePassword extends AuthorizationEvent {
  final bool isSavedPassword;
  SavePassword(this.isSavedPassword);
}

class SignIn extends AuthorizationEvent {
  final String phoneCode;
  final String phoneNumber;
  final String password;
  SignIn(this.phoneCode, this.phoneNumber, this.password);
}

class CheckPasswordsMatch extends AuthorizationEvent {
  final String password;
  final String confirmPassword;
  CheckPasswordsMatch(this.password, this.confirmPassword);
}

class SetNewPassword extends AuthorizationEvent {
  final String password;
  final String phoneNumber;
  SetNewPassword(this.password, this.phoneNumber);
}

class RequestCode extends AuthorizationEvent {
  final String phoneNumber;
  RequestCode(this.phoneNumber);
}

class VerifyCode extends AuthorizationEvent {
  final String phoneNumber;
  final String verificationCode;
  VerifyCode(this.phoneNumber, this.verificationCode);
}

class PhoneNumberChanged extends AuthorizationEvent {
  final String phoneNumber;
  PhoneNumberChanged(this.phoneNumber);
}

class OtpChanged extends AuthorizationEvent {
  final String otp;
  OtpChanged(this.otp);
}

class OtpDigitChanged extends AuthorizationEvent {
  final int index;
  final String digit;
  OtpDigitChanged(this.index, this.digit);
}

class Submit extends AuthorizationEvent {}

class ResendOtp extends AuthorizationEvent {}

class VerifyOtp extends AuthorizationEvent {}

class PhoneCodeChanged extends AuthorizationEvent {
  final String phoneCode;
  final String flag;
  PhoneCodeChanged(this.phoneCode, this.flag);
}

class TimerTicked extends AuthorizationEvent {
  final int remainingSeconds;
  TimerTicked(this.remainingSeconds);
}

class StartTimer extends AuthorizationEvent {}

class ResetTimer extends AuthorizationEvent {}

class ClearOtpError extends AuthorizationEvent {}
