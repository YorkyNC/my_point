part of 'authorization_bloc.dart';

sealed class AuthorizationEvent {
  const AuthorizationEvent();
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
  PhoneCodeChanged(this.phoneCode);
}

class TimerTicked extends AuthorizationEvent {
  final int remainingSeconds;
  TimerTicked(this.remainingSeconds);
}
