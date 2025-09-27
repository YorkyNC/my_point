part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.loaded({
    required AuthStateViewModel viewModel,
  }) = _Loaded;
  const factory AuthState.verified({
    required AuthStateViewModel viewModel,
  }) = _Verified;
  const factory AuthState.error(String error) = _Error;
  const factory AuthState.errorVerify(String error) = _ErrorVerify;
  const factory AuthState.passwordReset() = _PasswordReset;
}

@freezed
class AuthStateViewModel with _$AuthStateViewModel {
  const factory AuthStateViewModel({
    @Default(0) int userId,
    @Default('') String token,
    @Default('') String refreshToken,
    @Default({}) Map<String, dynamic> tokenPayload,
    @Default(false) bool hasTempPassword,
    @Default(UserEntity(
      id: '',
      email: 'email',
      firstName: 'firstName',
      lastName: 'lastName',
    ))
    UserEntity user,
    int? passwordResetId,
  }) = _AuthStateViewModel;
}
