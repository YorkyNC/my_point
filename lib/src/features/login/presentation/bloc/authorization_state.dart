part of 'authorization_bloc.dart';

@freezed
abstract class AuthorizationState with _$AuthorizationState {
  const AuthorizationState._();
  const factory AuthorizationState({
    String? phoneCode,
    @Default(false) bool isPhoneCodeFilled,
    String? flag,
    String? phoneNumber,
    @Default(false) bool isPhoneNumberFilled,
    @Default(false) bool isLoading,
  }) = _AuthorizationState;
}
