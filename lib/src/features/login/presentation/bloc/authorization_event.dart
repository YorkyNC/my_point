part of 'authorization_bloc.dart';

sealed class AuthorizationEvent {
  const AuthorizationEvent();
}

class SavePassword extends AuthorizationEvent {
  final bool isSavedPassword;
  SavePassword(this.isSavedPassword);
}

class SignIn extends AuthorizationEvent {
  final String email;
  final String password;
  SignIn(this.email, this.password);
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

class ValidateForm extends AuthorizationEvent {}

class SignUp extends AuthorizationEvent {
  SignUpRequest request;
  SignUp(this.request);
}

class StartTimer extends AuthorizationEvent {}

class ResetTimer extends AuthorizationEvent {}

class ClearOtpError extends AuthorizationEvent {}

class EmailChanged extends AuthorizationEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends AuthorizationEvent {
  final String password;
  PasswordChanged(this.password);
}

class PasswordVisibilityChanged extends AuthorizationEvent {
  final bool isVisible;
  PasswordVisibilityChanged(this.isVisible);
}

class NameChanged extends AuthorizationEvent {
  final String name;
  NameChanged(this.name);
}

class SurnameChanged extends AuthorizationEvent {
  final String surname;
  SurnameChanged(this.surname);
}

class ConfirmPasswordChanged extends AuthorizationEvent {
  final String confirmPassword;
  ConfirmPasswordChanged(this.confirmPassword);
}

class ClearError extends AuthorizationEvent {
  ClearError();
}

class OtpCodeRequested extends AuthorizationEvent {
  final RequestOtpCode request;
  OtpCodeRequested(this.request);
}

class VerifyOtpRequested extends AuthorizationEvent {
  final VerifyOtpRequest request;
  VerifyOtpRequested(this.request);
}
