import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/core/base/base_bloc/bloc/base_bloc.dart';
import 'package:my_point/src/core/router/router.dart';
import 'package:my_point/src/features/login/domain/enum/auth_status_type.dart';
import 'package:my_point/src/features/login/domain/request/request_otp_code.dart';
import 'package:my_point/src/features/login/domain/request/sign_in_request.dart';
import 'package:my_point/src/features/login/domain/request/sign_up_request.dart';
import 'package:my_point/src/features/login/domain/request/verify_otp_request.dart';
import 'package:my_point/src/features/login/domain/usecases/request_otp_code_use_case.dart';
import 'package:my_point/src/features/login/domain/usecases/sign_in_use_case.dart';
import 'package:my_point/src/features/login/domain/usecases/sing_up_use_case.dart';
import 'package:my_point/src/features/login/domain/usecases/verify_otp_use_case.dart';

part 'authorization_bloc.freezed.dart';
part 'authorization_event.dart';
part 'authorization_state.dart';

@injectable
class AuthorizationBloc extends BaseBloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc(this._signInUseCase, this._signUpUseCase, this._requestOtpCodeUseCase, this._verifyOtpUseCase)
      : super(AuthorizationState()) {
    setUpHandlers();
  }

  Timer? _timer;
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final RequestOtpCodeUseCase _requestOtpCodeUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
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
    on<NameChanged>(_onNameChanged);
    on<SurnameChanged>(_onSurnameChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ClearError>(_onClearError);
    on<OtpCodeRequested>(_onOtpCodeRequested);
    on<VerifyOtpRequested>(_onVerifyOtpRequested);
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

  Future<void> _onNameChanged(NameChanged event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      name: event.name,
      isNameFilled: event.name.isNotEmpty,
      error: null,
    ));
  }

  Future<void> _onSurnameChanged(SurnameChanged event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      surname: event.surname,
      isSurnameFilled: event.surname.isNotEmpty,
      error: null,
    ));
  }

  Future<void> _onConfirmPasswordChanged(ConfirmPasswordChanged event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      confirmPassword: event.confirmPassword,
      isConfirmPasswordFilled: event.confirmPassword.isNotEmpty,
      error: null,
    ));
  }

  Future<void> _onClearError(ClearError event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      error: null,
      success: false,
      isVerifyOtpError: false,
      isOtpError: false,
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
      error: null,
    ));
  }

  Future<void> _onPhoneNumberChanged(PhoneNumberChanged event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      phoneNumber: event.phoneNumber,
      isPhoneNumberFilled: event.phoneNumber.isNotEmpty,
      error: null,
    ));
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
      authStatus: null,
      token: null,
      error: null,
    ));
    final result = await _signUpUseCase.execute(SignUpRequest(
      email: event.request.email,
      password: event.request.password,
      phoneNumber: event.request.phoneNumber,
      name: event.request.name,
      surname: event.request.surname,
    ));
    await result.fold((l) async {
      emit(state.copyWith(
        authStatus: null,
        token: null,
        isLoading: false,
        error: l.message,
      ));
    }, (r) async {
      await st.setToken(r.accessToken);
      await st.setAuthStatus(r.authStatus.name.toUpperCase());
      emit(state.copyWith(
        authStatus: r.authStatus,
        token: r.accessToken,
        error: null,
        isLoading: false,
        success: true,
      ));
    });
  }

  Future<void> _onVerifyOtpRequested(VerifyOtpRequested event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      isVerifyOtpSuccess: false,
      isVerifyOtpLoading: true,
      isVerifyOtpError: false,
      error: null,
    ));

    log('⏳ Calling Verify OTP use case...');
    final result = await _verifyOtpUseCase.execute(event.request);

    log('📦 Verify OTP use case returned result');

    await result.fold((l) async {
      log('❌ Verify OTP Request Failed (Network Error): ${l.message}');
      emit(state.copyWith(
        isVerifyOtpSuccess: false,
        isVerifyOtpError: true,
        isVerifyOtpLoading: false,
        error: l.message,
      ));
    }, (r) async {
      log('📦 Response received - verified: ${r.verified}, pinError: ${r.pinError}');

      if (r.verified) {
        log('✅ OTP Verification Success!');
        emit(state.copyWith(
          isVerifyOtpSuccess: true,
          isVerifyOtpError: false,
          isVerifyOtpLoading: false,
          error: null,
        ));
      } else {
        log('❌ OTP Verification Failed: ${r.pinError ?? "Unknown error"}');
        emit(state.copyWith(
          isVerifyOtpSuccess: false,
          isVerifyOtpError: true,
          isVerifyOtpLoading: false,
          error: r.pinError ?? 'Неверный код',
        ));
      }
    });
  }

  Future<void> _onSignIn(SignIn event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      success: false,
      isLoading: true,
      authStatus: null,
      token: null,
      error: null,
    ));
    final result = await _signInUseCase.execute(SignInRequest(
      email: event.email,
      password: event.password,
    ));
    await result.fold(
      (l) async {
        emit(state.copyWith(
          authStatus: null,
          token: null,
          isLoading: false,
          error: l.message,
        ));
      },
      (r) async {
        log('Token saved: ${r.accessToken}');
        await st.setToken(r.accessToken);
        await st.setAuthStatus(r.authStatus.name.toUpperCase());
        emit(
          state.copyWith(
            authStatus: r.authStatus,
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

  Future<void> _onOtpCodeRequested(OtpCodeRequested event, Emitter<AuthorizationState> emit) async {
    log('🎯 OtpCodeRequested event received for: ${event.request.phoneNumber}');

    emit(state.copyWith(
      isOtpSuccess: false,
      isOtpLoading: true,
      error: null,
      isOtpError: false,
      isOtpFilled: false,
      pinId: null,
    ));

    log('⏳ Calling OTP use case...');
    final result = await _requestOtpCodeUseCase.execute(event.request);

    log('📦 Use case returned result');

    await result.fold((l) async {
      log('❌ OTP Request Failed: ${l.message}');
      emit(state.copyWith(
        isOtpSuccess: false,
        isOtpLoading: false,
        pinId: null,
        error: l.message,
        isOtpError: true,
        isOtpFilled: false,
      ));
    }, (r) async {
      log('✅ OTP Request Success! pinId: ${r.pinId}');
      emit(state.copyWith(
        pinId: r.pinId,
        error: null,
        isOtpError: false,
        isOtpLoading: false,
        isOtpSuccess: true,
        isOtpFilled: true,
      ));
    });
  }
}
