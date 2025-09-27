import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/core/base/base_bloc/bloc/base_bloc.dart';

part 'authorization_bloc.freezed.dart';
part 'authorization_event.dart';
part 'authorization_state.dart';

@injectable
class AuthorizationBloc extends BaseBloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc() : super(AuthorizationState()) {
    setUpHandlers();
  }

  void setUpHandlers() {
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<OtpChanged>(_onOtpChanged);
    on<OtpDigitChanged>(_onOtpDigitChanged);
    on<Submit>(_onSubmit);
    on<ResendOtp>(_onResendOtp);
    on<VerifyOtp>(_onVerifyOtp);
    on<TimerTicked>(_onTimerTicked);
    on<PhoneCodeChanged>(_onPhoneCodeChanged);
  }

  @override
  void onEventHandler(AuthorizationEvent event, Emitter emit) {
    // This method is required by BaseBloc but we're using the specific handlers
    // The actual event handling is done in the specific methods below
  }

  Future<void> _onPhoneNumberChanged(PhoneNumberChanged event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(phoneNumber: event.phoneNumber, isPhoneNumberFilled: event.phoneNumber.length > 1));
  }

  Future<void> _onOtpChanged(OtpChanged event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(otp: event.otp));
  }

  Future<void> _onSubmit(Submit event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(isPhoneNumberFilled: true, isOtpFilled: false));
  }

  Future<void> _onResendOtp(ResendOtp event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(isPhoneNumberFilled: true));
  }

  Future<void> _onOtpDigitChanged(OtpDigitChanged event, Emitter<AuthorizationState> emit) async {
    final newDigits = List<String>.from(state.otpDigits);
    if (event.index < newDigits.length) {
      newDigits[event.index] = event.digit;
      final newOtp = newDigits.join();
      emit(state.copyWith(
        otpDigits: newDigits,
        otp: newOtp,
        isOtpFilled: newOtp.length == 4,
      ));
    }
  }

  Future<void> _onVerifyOtp(VerifyOtp event, Emitter<AuthorizationState> emit) async {
    if (state.otp?.length == 4) {
      emit(state.copyWith(isVerifying: true));

      try {
        // TODO: Implement actual OTP verification logic here
        // For now, we'll simulate a successful verification
        await Future.delayed(Duration(seconds: 2)); // Simulate API call

        emit(state.copyWith(
          isVerifying: false,
          isOtpVerified: true,
          errorMessage: null,
        ));
      } catch (e) {
        emit(state.copyWith(
          isVerifying: false,
          errorMessage: 'OTP verification failed: $e',
        ));
      }
    } else {
      emit(state.copyWith(
        errorMessage: 'Please enter a valid 4-digit code',
        isVerifying: false,
      ));
    }
  }

  Future<void> _onTimerTicked(TimerTicked event, Emitter<AuthorizationState> emit) async {
    final canRequestCode = event.remainingSeconds <= 0;
    emit(state.copyWith(
      remainingSeconds: event.remainingSeconds,
      canRequestCode: canRequestCode,
    ));
  }

  Future<void> _onPhoneCodeChanged(PhoneCodeChanged event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(phoneCode: event.phoneCode));
  }
}
