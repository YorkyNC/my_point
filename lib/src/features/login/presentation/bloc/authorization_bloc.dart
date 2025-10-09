import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/core/base/base_bloc/bloc/base_bloc.dart';
import 'package:my_point/src/core/router/router.dart';
import 'package:my_point/src/features/login/domain/request/sign_in_request.dart';
import 'package:my_point/src/features/login/domain/usecases/sign_in_use_case.dart';

part 'authorization_bloc.freezed.dart';
part 'authorization_event.dart';
part 'authorization_state.dart';

@injectable
class AuthorizationBloc extends BaseBloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc(this._signInUseCase) : super(AuthorizationState()) {
    setUpHandlers();
  }

  Timer? _timer;
  final SignInUseCase _signInUseCase;
  void setUpHandlers() {
    on<PhoneCodeChanged>(_onPhoneCodeChanged);
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<SignIn>(_onSignIn);
    on<StartTimer>(_onStartTimer);
    on<TimerTicked>(_onTimerTicked);
    on<ResetTimer>(_onResetTimer);
    on<ResendOtp>(_onResendOtp);
    on<OtpChanged>(_onOtpChanged);
    on<SignUp>(_onSignUp);
    on<ValidateForm>(_onValidateForm);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<PasswordVisibilityChanged>(_onPasswordVisibilityChanged);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  Future<void> _onEmailChanged(EmailChanged event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      email: event.email,
      isEmailFilled: event.email.isNotEmpty,
      error: null,
    ));
  }

  Future<void> _onPasswordChanged(PasswordChanged event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      password: event.password,
      isPasswordFilled: event.password.isNotEmpty,
      error: null,
    ));
  }

  Future<void> _onPasswordVisibilityChanged(PasswordVisibilityChanged event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      isObscurePassword: event.isVisible,
    ));
  }

  @override
  void onEventHandler(AuthorizationEvent event, Emitter emit) {
    // This method is required by BaseBloc but we're using the specific handlers
    // The actual event handling is done in the specific methods below
  }

  Future<void> _onPhoneCodeChanged(PhoneCodeChanged event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      phoneCode: event.phoneCode,
      flag: event.flag,
      isPhoneCodeFilled: event.phoneCode.isNotEmpty,
    ));
  }

  Future<void> _onPhoneNumberChanged(PhoneNumberChanged event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      phoneNumber: event.phoneNumber,
      isPhoneNumberFilled: event.phoneNumber.isNotEmpty,
    ));
  }

  Future<void> _onSignIn(SignIn event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      success: false,
      isLoading: true,
      error: null,
    ));
    final result = await _signInUseCase.execute(SignInRequest(
      email: event.email,
      password: event.password,
    ));
    await result.fold(
      (l) async {
        emit(state.copyWith(
          isLoading: false,
          error: l.message,
        ));
      },
      (r) async {
        log('Token saved: ${r.accessToken}');
        await st.setToken(r.accessToken);
        emit(
          state.copyWith(
            error: null,
            password: null,
            email: null,
            isPasswordFilled: false,
            isEmailFilled: false,
            token: r.accessToken,
            isLoading: false,
            success: true,
          ),
        );
      },
    );
  }

  Future<void> _onOtpChanged(OtpChanged event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      isOtpSuccess: false,
      isOtpLoading: true,
    ));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(
      otp: event.otp,
      isOtpFilled: event.otp.isNotEmpty,
      isOtpLoading: false,
      isOtpSuccess: true,
    ));
  }

  Future<void> _onStartTimer(StartTimer event, Emitter<AuthorizationState> emit) async {
    _timer?.cancel();
    emit(state.copyWith(
      remainingSeconds: 60,
      canRequestCode: false,
      isTimerRunning: true,
    ));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final newSeconds = state.remainingSeconds - 1;
      add(TimerTicked(newSeconds));

      if (newSeconds <= 0) {
        timer.cancel();
      }
    });
  }

  Future<void> _onTimerTicked(TimerTicked event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      remainingSeconds: event.remainingSeconds,
      canRequestCode: event.remainingSeconds <= 0,
      isTimerRunning: event.remainingSeconds > 0,
    ));
  }

  Future<void> _onResetTimer(ResetTimer event, Emitter<AuthorizationState> emit) async {
    _timer?.cancel();
    emit(state.copyWith(
      remainingSeconds: 60,
      canRequestCode: false,
      isTimerRunning: false,
    ));
  }

  Future<void> _onResendOtp(ResendOtp event, Emitter<AuthorizationState> emit) async {
    if (state.canRequestCode) {
      // Here you would typically make an API call to resend OTP
      // For now, just restart the timer
      add(StartTimer());
    }
  }

  Future<void> _onValidateForm(ValidateForm event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      isValidate: true,
    ));
  }

  Future<void> _onSignUp(SignUp event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      success: false,
      isLoading: true,
    ));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(
      isLoading: false,
      success: true,
    ));
  }
}
