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
    String? name,
    String? surname,
    String? confirmPassword,
    @Default(false) bool isNameFilled,
    @Default(false) bool isSurnameFilled,
    @Default(false) bool isConfirmPasswordFilled,
  }) = _AuthorizationState;

  bool get isLoginVerified {
    final result = isEmailFilled && isPasswordFilled;
    return result;
  }

  bool get isSignUpVerified {
    final result = isEmailFilled &&
        isEmailValid &&
        isPasswordFilled &&
        isPhoneNumberFilled &&
        isNameFilled &&
        isSurnameFilled &&
        isConfirmPasswordFilled &&
        isPasswordMatch &&
        isPhoneCodeFilled;

    log('  ✅ Final result: $result', name: 'SignUp');
    return result;
  }

  bool get isEmailValid {
    if (email == null || email!.isEmpty) return false;
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email!);
  }

  bool get isPasswordMatch {
    if (password == null || confirmPassword == null) return false;
    if (password!.isEmpty || confirmPassword!.isEmpty) return false;
    return password == confirmPassword;
  }
}
