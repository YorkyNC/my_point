// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function() getUser,
    required TResult Function() refreshToken,
    required TResult Function(String email) forgotPassword,
    required TResult Function(String password, String confirmPassword)
        changeTemporaryPassword,
    required TResult Function(String password, String confirmPassword)
        changePermanentPassword,
    required TResult Function(String code, int passwordResetId) verifyOtp,
    required TResult Function(
            String password, String confirmPassword, int passwordResetId)
        resetPassword,
    required TResult Function(
            String? code, String? password, String? confirmPassword)
        verify,
    required TResult Function(int? passwordResetId) setPasswordResetId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function()? getUser,
    TResult? Function()? refreshToken,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult? Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult? Function(String code, int passwordResetId)? verifyOtp,
    TResult? Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult? Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult? Function(int? passwordResetId)? setPasswordResetId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function()? getUser,
    TResult Function()? refreshToken,
    TResult Function(String email)? forgotPassword,
    TResult Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult Function(String code, int passwordResetId)? verifyOtp,
    TResult Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult Function(int? passwordResetId)? setPasswordResetId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_RefreshToken value) refreshToken,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ChangeTemporaryPassword value)
        changeTemporaryPassword,
    required TResult Function(_ChangePermanentPassword value)
        changePermanentPassword,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetPasswordResetId value) setPasswordResetId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_RefreshToken value)? refreshToken,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult? Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_SetPasswordResetId value)? setPasswordResetId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_RefreshToken value)? refreshToken,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetPasswordResetId value)? setPasswordResetId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$LoginImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginImpl with DiagnosticableTreeMixin implements _Login {
  const _$LoginImpl({required this.username, required this.password});

  @override
  final String username;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.login(username: $username, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.login'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function() getUser,
    required TResult Function() refreshToken,
    required TResult Function(String email) forgotPassword,
    required TResult Function(String password, String confirmPassword)
        changeTemporaryPassword,
    required TResult Function(String password, String confirmPassword)
        changePermanentPassword,
    required TResult Function(String code, int passwordResetId) verifyOtp,
    required TResult Function(
            String password, String confirmPassword, int passwordResetId)
        resetPassword,
    required TResult Function(
            String? code, String? password, String? confirmPassword)
        verify,
    required TResult Function(int? passwordResetId) setPasswordResetId,
  }) {
    return login(username, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function()? getUser,
    TResult? Function()? refreshToken,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult? Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult? Function(String code, int passwordResetId)? verifyOtp,
    TResult? Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult? Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult? Function(int? passwordResetId)? setPasswordResetId,
  }) {
    return login?.call(username, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function()? getUser,
    TResult Function()? refreshToken,
    TResult Function(String email)? forgotPassword,
    TResult Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult Function(String code, int passwordResetId)? verifyOtp,
    TResult Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult Function(int? passwordResetId)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(username, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_RefreshToken value) refreshToken,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ChangeTemporaryPassword value)
        changeTemporaryPassword,
    required TResult Function(_ChangePermanentPassword value)
        changePermanentPassword,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetPasswordResetId value) setPasswordResetId,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_RefreshToken value)? refreshToken,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult? Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_SetPasswordResetId value)? setPasswordResetId,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_RefreshToken value)? refreshToken,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetPasswordResetId value)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements AuthEvent {
  const factory _Login(
      {required final String username,
      required final String password}) = _$LoginImpl;

  String get username;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetUserImplCopyWith<$Res> {
  factory _$$GetUserImplCopyWith(
          _$GetUserImpl value, $Res Function(_$GetUserImpl) then) =
      __$$GetUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$GetUserImpl>
    implements _$$GetUserImplCopyWith<$Res> {
  __$$GetUserImplCopyWithImpl(
      _$GetUserImpl _value, $Res Function(_$GetUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetUserImpl with DiagnosticableTreeMixin implements _GetUser {
  const _$GetUserImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.getUser()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthEvent.getUser'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function() getUser,
    required TResult Function() refreshToken,
    required TResult Function(String email) forgotPassword,
    required TResult Function(String password, String confirmPassword)
        changeTemporaryPassword,
    required TResult Function(String password, String confirmPassword)
        changePermanentPassword,
    required TResult Function(String code, int passwordResetId) verifyOtp,
    required TResult Function(
            String password, String confirmPassword, int passwordResetId)
        resetPassword,
    required TResult Function(
            String? code, String? password, String? confirmPassword)
        verify,
    required TResult Function(int? passwordResetId) setPasswordResetId,
  }) {
    return getUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function()? getUser,
    TResult? Function()? refreshToken,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult? Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult? Function(String code, int passwordResetId)? verifyOtp,
    TResult? Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult? Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult? Function(int? passwordResetId)? setPasswordResetId,
  }) {
    return getUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function()? getUser,
    TResult Function()? refreshToken,
    TResult Function(String email)? forgotPassword,
    TResult Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult Function(String code, int passwordResetId)? verifyOtp,
    TResult Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult Function(int? passwordResetId)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_RefreshToken value) refreshToken,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ChangeTemporaryPassword value)
        changeTemporaryPassword,
    required TResult Function(_ChangePermanentPassword value)
        changePermanentPassword,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetPasswordResetId value) setPasswordResetId,
  }) {
    return getUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_RefreshToken value)? refreshToken,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult? Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_SetPasswordResetId value)? setPasswordResetId,
  }) {
    return getUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_RefreshToken value)? refreshToken,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetPasswordResetId value)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(this);
    }
    return orElse();
  }
}

abstract class _GetUser implements AuthEvent {
  const factory _GetUser() = _$GetUserImpl;
}

/// @nodoc
abstract class _$$RefreshTokenImplCopyWith<$Res> {
  factory _$$RefreshTokenImplCopyWith(
          _$RefreshTokenImpl value, $Res Function(_$RefreshTokenImpl) then) =
      __$$RefreshTokenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshTokenImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RefreshTokenImpl>
    implements _$$RefreshTokenImplCopyWith<$Res> {
  __$$RefreshTokenImplCopyWithImpl(
      _$RefreshTokenImpl _value, $Res Function(_$RefreshTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshTokenImpl with DiagnosticableTreeMixin implements _RefreshToken {
  const _$RefreshTokenImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.refreshToken()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthEvent.refreshToken'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshTokenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function() getUser,
    required TResult Function() refreshToken,
    required TResult Function(String email) forgotPassword,
    required TResult Function(String password, String confirmPassword)
        changeTemporaryPassword,
    required TResult Function(String password, String confirmPassword)
        changePermanentPassword,
    required TResult Function(String code, int passwordResetId) verifyOtp,
    required TResult Function(
            String password, String confirmPassword, int passwordResetId)
        resetPassword,
    required TResult Function(
            String? code, String? password, String? confirmPassword)
        verify,
    required TResult Function(int? passwordResetId) setPasswordResetId,
  }) {
    return refreshToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function()? getUser,
    TResult? Function()? refreshToken,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult? Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult? Function(String code, int passwordResetId)? verifyOtp,
    TResult? Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult? Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult? Function(int? passwordResetId)? setPasswordResetId,
  }) {
    return refreshToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function()? getUser,
    TResult Function()? refreshToken,
    TResult Function(String email)? forgotPassword,
    TResult Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult Function(String code, int passwordResetId)? verifyOtp,
    TResult Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult Function(int? passwordResetId)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (refreshToken != null) {
      return refreshToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_RefreshToken value) refreshToken,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ChangeTemporaryPassword value)
        changeTemporaryPassword,
    required TResult Function(_ChangePermanentPassword value)
        changePermanentPassword,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetPasswordResetId value) setPasswordResetId,
  }) {
    return refreshToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_RefreshToken value)? refreshToken,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult? Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_SetPasswordResetId value)? setPasswordResetId,
  }) {
    return refreshToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_RefreshToken value)? refreshToken,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetPasswordResetId value)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (refreshToken != null) {
      return refreshToken(this);
    }
    return orElse();
  }
}

abstract class _RefreshToken implements AuthEvent {
  const factory _RefreshToken() = _$RefreshTokenImpl;
}

/// @nodoc
abstract class _$$ForgotPasswordImplCopyWith<$Res> {
  factory _$$ForgotPasswordImplCopyWith(_$ForgotPasswordImpl value,
          $Res Function(_$ForgotPasswordImpl) then) =
      __$$ForgotPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotPasswordImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ForgotPasswordImpl>
    implements _$$ForgotPasswordImplCopyWith<$Res> {
  __$$ForgotPasswordImplCopyWithImpl(
      _$ForgotPasswordImpl _value, $Res Function(_$ForgotPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ForgotPasswordImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordImpl
    with DiagnosticableTreeMixin
    implements _ForgotPassword {
  const _$ForgotPasswordImpl({required this.email});

  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.forgotPassword(email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.forgotPassword'))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordImplCopyWith<_$ForgotPasswordImpl> get copyWith =>
      __$$ForgotPasswordImplCopyWithImpl<_$ForgotPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function() getUser,
    required TResult Function() refreshToken,
    required TResult Function(String email) forgotPassword,
    required TResult Function(String password, String confirmPassword)
        changeTemporaryPassword,
    required TResult Function(String password, String confirmPassword)
        changePermanentPassword,
    required TResult Function(String code, int passwordResetId) verifyOtp,
    required TResult Function(
            String password, String confirmPassword, int passwordResetId)
        resetPassword,
    required TResult Function(
            String? code, String? password, String? confirmPassword)
        verify,
    required TResult Function(int? passwordResetId) setPasswordResetId,
  }) {
    return forgotPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function()? getUser,
    TResult? Function()? refreshToken,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult? Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult? Function(String code, int passwordResetId)? verifyOtp,
    TResult? Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult? Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult? Function(int? passwordResetId)? setPasswordResetId,
  }) {
    return forgotPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function()? getUser,
    TResult Function()? refreshToken,
    TResult Function(String email)? forgotPassword,
    TResult Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult Function(String code, int passwordResetId)? verifyOtp,
    TResult Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult Function(int? passwordResetId)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_RefreshToken value) refreshToken,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ChangeTemporaryPassword value)
        changeTemporaryPassword,
    required TResult Function(_ChangePermanentPassword value)
        changePermanentPassword,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetPasswordResetId value) setPasswordResetId,
  }) {
    return forgotPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_RefreshToken value)? refreshToken,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult? Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_SetPasswordResetId value)? setPasswordResetId,
  }) {
    return forgotPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_RefreshToken value)? refreshToken,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetPasswordResetId value)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(this);
    }
    return orElse();
  }
}

abstract class _ForgotPassword implements AuthEvent {
  const factory _ForgotPassword({required final String email}) =
      _$ForgotPasswordImpl;

  String get email;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordImplCopyWith<_$ForgotPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeTemporaryPasswordImplCopyWith<$Res> {
  factory _$$ChangeTemporaryPasswordImplCopyWith(
          _$ChangeTemporaryPasswordImpl value,
          $Res Function(_$ChangeTemporaryPasswordImpl) then) =
      __$$ChangeTemporaryPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password, String confirmPassword});
}

/// @nodoc
class __$$ChangeTemporaryPasswordImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ChangeTemporaryPasswordImpl>
    implements _$$ChangeTemporaryPasswordImplCopyWith<$Res> {
  __$$ChangeTemporaryPasswordImplCopyWithImpl(
      _$ChangeTemporaryPasswordImpl _value,
      $Res Function(_$ChangeTemporaryPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$ChangeTemporaryPasswordImpl(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeTemporaryPasswordImpl
    with DiagnosticableTreeMixin
    implements _ChangeTemporaryPassword {
  const _$ChangeTemporaryPasswordImpl(
      {required this.password, required this.confirmPassword});

  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.changeTemporaryPassword(password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.changeTemporaryPassword'))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('confirmPassword', confirmPassword));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeTemporaryPasswordImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password, confirmPassword);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeTemporaryPasswordImplCopyWith<_$ChangeTemporaryPasswordImpl>
      get copyWith => __$$ChangeTemporaryPasswordImplCopyWithImpl<
          _$ChangeTemporaryPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function() getUser,
    required TResult Function() refreshToken,
    required TResult Function(String email) forgotPassword,
    required TResult Function(String password, String confirmPassword)
        changeTemporaryPassword,
    required TResult Function(String password, String confirmPassword)
        changePermanentPassword,
    required TResult Function(String code, int passwordResetId) verifyOtp,
    required TResult Function(
            String password, String confirmPassword, int passwordResetId)
        resetPassword,
    required TResult Function(
            String? code, String? password, String? confirmPassword)
        verify,
    required TResult Function(int? passwordResetId) setPasswordResetId,
  }) {
    return changeTemporaryPassword(password, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function()? getUser,
    TResult? Function()? refreshToken,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult? Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult? Function(String code, int passwordResetId)? verifyOtp,
    TResult? Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult? Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult? Function(int? passwordResetId)? setPasswordResetId,
  }) {
    return changeTemporaryPassword?.call(password, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function()? getUser,
    TResult Function()? refreshToken,
    TResult Function(String email)? forgotPassword,
    TResult Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult Function(String code, int passwordResetId)? verifyOtp,
    TResult Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult Function(int? passwordResetId)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (changeTemporaryPassword != null) {
      return changeTemporaryPassword(password, confirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_RefreshToken value) refreshToken,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ChangeTemporaryPassword value)
        changeTemporaryPassword,
    required TResult Function(_ChangePermanentPassword value)
        changePermanentPassword,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetPasswordResetId value) setPasswordResetId,
  }) {
    return changeTemporaryPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_RefreshToken value)? refreshToken,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult? Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_SetPasswordResetId value)? setPasswordResetId,
  }) {
    return changeTemporaryPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_RefreshToken value)? refreshToken,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetPasswordResetId value)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (changeTemporaryPassword != null) {
      return changeTemporaryPassword(this);
    }
    return orElse();
  }
}

abstract class _ChangeTemporaryPassword implements AuthEvent {
  const factory _ChangeTemporaryPassword(
      {required final String password,
      required final String confirmPassword}) = _$ChangeTemporaryPasswordImpl;

  String get password;
  String get confirmPassword;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeTemporaryPasswordImplCopyWith<_$ChangeTemporaryPasswordImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangePermanentPasswordImplCopyWith<$Res> {
  factory _$$ChangePermanentPasswordImplCopyWith(
          _$ChangePermanentPasswordImpl value,
          $Res Function(_$ChangePermanentPasswordImpl) then) =
      __$$ChangePermanentPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password, String confirmPassword});
}

/// @nodoc
class __$$ChangePermanentPasswordImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ChangePermanentPasswordImpl>
    implements _$$ChangePermanentPasswordImplCopyWith<$Res> {
  __$$ChangePermanentPasswordImplCopyWithImpl(
      _$ChangePermanentPasswordImpl _value,
      $Res Function(_$ChangePermanentPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$ChangePermanentPasswordImpl(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangePermanentPasswordImpl
    with DiagnosticableTreeMixin
    implements _ChangePermanentPassword {
  const _$ChangePermanentPasswordImpl(
      {required this.password, required this.confirmPassword});

  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.changePermanentPassword(password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.changePermanentPassword'))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('confirmPassword', confirmPassword));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePermanentPasswordImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password, confirmPassword);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePermanentPasswordImplCopyWith<_$ChangePermanentPasswordImpl>
      get copyWith => __$$ChangePermanentPasswordImplCopyWithImpl<
          _$ChangePermanentPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function() getUser,
    required TResult Function() refreshToken,
    required TResult Function(String email) forgotPassword,
    required TResult Function(String password, String confirmPassword)
        changeTemporaryPassword,
    required TResult Function(String password, String confirmPassword)
        changePermanentPassword,
    required TResult Function(String code, int passwordResetId) verifyOtp,
    required TResult Function(
            String password, String confirmPassword, int passwordResetId)
        resetPassword,
    required TResult Function(
            String? code, String? password, String? confirmPassword)
        verify,
    required TResult Function(int? passwordResetId) setPasswordResetId,
  }) {
    return changePermanentPassword(password, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function()? getUser,
    TResult? Function()? refreshToken,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult? Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult? Function(String code, int passwordResetId)? verifyOtp,
    TResult? Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult? Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult? Function(int? passwordResetId)? setPasswordResetId,
  }) {
    return changePermanentPassword?.call(password, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function()? getUser,
    TResult Function()? refreshToken,
    TResult Function(String email)? forgotPassword,
    TResult Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult Function(String code, int passwordResetId)? verifyOtp,
    TResult Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult Function(int? passwordResetId)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (changePermanentPassword != null) {
      return changePermanentPassword(password, confirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_RefreshToken value) refreshToken,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ChangeTemporaryPassword value)
        changeTemporaryPassword,
    required TResult Function(_ChangePermanentPassword value)
        changePermanentPassword,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetPasswordResetId value) setPasswordResetId,
  }) {
    return changePermanentPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_RefreshToken value)? refreshToken,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult? Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_SetPasswordResetId value)? setPasswordResetId,
  }) {
    return changePermanentPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_RefreshToken value)? refreshToken,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetPasswordResetId value)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (changePermanentPassword != null) {
      return changePermanentPassword(this);
    }
    return orElse();
  }
}

abstract class _ChangePermanentPassword implements AuthEvent {
  const factory _ChangePermanentPassword(
      {required final String password,
      required final String confirmPassword}) = _$ChangePermanentPasswordImpl;

  String get password;
  String get confirmPassword;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePermanentPasswordImplCopyWith<_$ChangePermanentPasswordImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOtpImplCopyWith<$Res> {
  factory _$$VerifyOtpImplCopyWith(
          _$VerifyOtpImpl value, $Res Function(_$VerifyOtpImpl) then) =
      __$$VerifyOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code, int passwordResetId});
}

/// @nodoc
class __$$VerifyOtpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$VerifyOtpImpl>
    implements _$$VerifyOtpImplCopyWith<$Res> {
  __$$VerifyOtpImplCopyWithImpl(
      _$VerifyOtpImpl _value, $Res Function(_$VerifyOtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? passwordResetId = null,
  }) {
    return _then(_$VerifyOtpImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      passwordResetId: null == passwordResetId
          ? _value.passwordResetId
          : passwordResetId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$VerifyOtpImpl with DiagnosticableTreeMixin implements _VerifyOtp {
  const _$VerifyOtpImpl({required this.code, required this.passwordResetId});

  @override
  final String code;
  @override
  final int passwordResetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.verifyOtp(code: $code, passwordResetId: $passwordResetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.verifyOtp'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('passwordResetId', passwordResetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.passwordResetId, passwordResetId) ||
                other.passwordResetId == passwordResetId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, passwordResetId);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      __$$VerifyOtpImplCopyWithImpl<_$VerifyOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function() getUser,
    required TResult Function() refreshToken,
    required TResult Function(String email) forgotPassword,
    required TResult Function(String password, String confirmPassword)
        changeTemporaryPassword,
    required TResult Function(String password, String confirmPassword)
        changePermanentPassword,
    required TResult Function(String code, int passwordResetId) verifyOtp,
    required TResult Function(
            String password, String confirmPassword, int passwordResetId)
        resetPassword,
    required TResult Function(
            String? code, String? password, String? confirmPassword)
        verify,
    required TResult Function(int? passwordResetId) setPasswordResetId,
  }) {
    return verifyOtp(code, passwordResetId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function()? getUser,
    TResult? Function()? refreshToken,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult? Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult? Function(String code, int passwordResetId)? verifyOtp,
    TResult? Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult? Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult? Function(int? passwordResetId)? setPasswordResetId,
  }) {
    return verifyOtp?.call(code, passwordResetId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function()? getUser,
    TResult Function()? refreshToken,
    TResult Function(String email)? forgotPassword,
    TResult Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult Function(String code, int passwordResetId)? verifyOtp,
    TResult Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult Function(int? passwordResetId)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(code, passwordResetId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_RefreshToken value) refreshToken,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ChangeTemporaryPassword value)
        changeTemporaryPassword,
    required TResult Function(_ChangePermanentPassword value)
        changePermanentPassword,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetPasswordResetId value) setPasswordResetId,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_RefreshToken value)? refreshToken,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult? Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_SetPasswordResetId value)? setPasswordResetId,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_RefreshToken value)? refreshToken,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetPasswordResetId value)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyOtp implements AuthEvent {
  const factory _VerifyOtp(
      {required final String code,
      required final int passwordResetId}) = _$VerifyOtpImpl;

  String get code;
  int get passwordResetId;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordImplCopyWith<$Res> {
  factory _$$ResetPasswordImplCopyWith(
          _$ResetPasswordImpl value, $Res Function(_$ResetPasswordImpl) then) =
      __$$ResetPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password, String confirmPassword, int passwordResetId});
}

/// @nodoc
class __$$ResetPasswordImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ResetPasswordImpl>
    implements _$$ResetPasswordImplCopyWith<$Res> {
  __$$ResetPasswordImplCopyWithImpl(
      _$ResetPasswordImpl _value, $Res Function(_$ResetPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? confirmPassword = null,
    Object? passwordResetId = null,
  }) {
    return _then(_$ResetPasswordImpl(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      passwordResetId: null == passwordResetId
          ? _value.passwordResetId
          : passwordResetId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ResetPasswordImpl
    with DiagnosticableTreeMixin
    implements _ResetPassword {
  const _$ResetPasswordImpl(
      {required this.password,
      required this.confirmPassword,
      required this.passwordResetId});

  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final int passwordResetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.resetPassword(password: $password, confirmPassword: $confirmPassword, passwordResetId: $passwordResetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.resetPassword'))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('confirmPassword', confirmPassword))
      ..add(DiagnosticsProperty('passwordResetId', passwordResetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.passwordResetId, passwordResetId) ||
                other.passwordResetId == passwordResetId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, password, confirmPassword, passwordResetId);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordImplCopyWith<_$ResetPasswordImpl> get copyWith =>
      __$$ResetPasswordImplCopyWithImpl<_$ResetPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function() getUser,
    required TResult Function() refreshToken,
    required TResult Function(String email) forgotPassword,
    required TResult Function(String password, String confirmPassword)
        changeTemporaryPassword,
    required TResult Function(String password, String confirmPassword)
        changePermanentPassword,
    required TResult Function(String code, int passwordResetId) verifyOtp,
    required TResult Function(
            String password, String confirmPassword, int passwordResetId)
        resetPassword,
    required TResult Function(
            String? code, String? password, String? confirmPassword)
        verify,
    required TResult Function(int? passwordResetId) setPasswordResetId,
  }) {
    return resetPassword(password, confirmPassword, passwordResetId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function()? getUser,
    TResult? Function()? refreshToken,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult? Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult? Function(String code, int passwordResetId)? verifyOtp,
    TResult? Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult? Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult? Function(int? passwordResetId)? setPasswordResetId,
  }) {
    return resetPassword?.call(password, confirmPassword, passwordResetId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function()? getUser,
    TResult Function()? refreshToken,
    TResult Function(String email)? forgotPassword,
    TResult Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult Function(String code, int passwordResetId)? verifyOtp,
    TResult Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult Function(int? passwordResetId)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(password, confirmPassword, passwordResetId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_RefreshToken value) refreshToken,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ChangeTemporaryPassword value)
        changeTemporaryPassword,
    required TResult Function(_ChangePermanentPassword value)
        changePermanentPassword,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetPasswordResetId value) setPasswordResetId,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_RefreshToken value)? refreshToken,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult? Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_SetPasswordResetId value)? setPasswordResetId,
  }) {
    return resetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_RefreshToken value)? refreshToken,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetPasswordResetId value)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class _ResetPassword implements AuthEvent {
  const factory _ResetPassword(
      {required final String password,
      required final String confirmPassword,
      required final int passwordResetId}) = _$ResetPasswordImpl;

  String get password;
  String get confirmPassword;
  int get passwordResetId;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordImplCopyWith<_$ResetPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyImplCopyWith<$Res> {
  factory _$$VerifyImplCopyWith(
          _$VerifyImpl value, $Res Function(_$VerifyImpl) then) =
      __$$VerifyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? code, String? password, String? confirmPassword});
}

/// @nodoc
class __$$VerifyImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$VerifyImpl>
    implements _$$VerifyImplCopyWith<$Res> {
  __$$VerifyImplCopyWithImpl(
      _$VerifyImpl _value, $Res Function(_$VerifyImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
  }) {
    return _then(_$VerifyImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$VerifyImpl with DiagnosticableTreeMixin implements _Verify {
  const _$VerifyImpl({this.code, this.password, this.confirmPassword});

  @override
  final String? code;
  @override
  final String? password;
  @override
  final String? confirmPassword;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.verify(code: $code, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.verify'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('confirmPassword', confirmPassword));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, password, confirmPassword);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyImplCopyWith<_$VerifyImpl> get copyWith =>
      __$$VerifyImplCopyWithImpl<_$VerifyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function() getUser,
    required TResult Function() refreshToken,
    required TResult Function(String email) forgotPassword,
    required TResult Function(String password, String confirmPassword)
        changeTemporaryPassword,
    required TResult Function(String password, String confirmPassword)
        changePermanentPassword,
    required TResult Function(String code, int passwordResetId) verifyOtp,
    required TResult Function(
            String password, String confirmPassword, int passwordResetId)
        resetPassword,
    required TResult Function(
            String? code, String? password, String? confirmPassword)
        verify,
    required TResult Function(int? passwordResetId) setPasswordResetId,
  }) {
    return verify(code, password, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function()? getUser,
    TResult? Function()? refreshToken,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult? Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult? Function(String code, int passwordResetId)? verifyOtp,
    TResult? Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult? Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult? Function(int? passwordResetId)? setPasswordResetId,
  }) {
    return verify?.call(code, password, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function()? getUser,
    TResult Function()? refreshToken,
    TResult Function(String email)? forgotPassword,
    TResult Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult Function(String code, int passwordResetId)? verifyOtp,
    TResult Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult Function(int? passwordResetId)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (verify != null) {
      return verify(code, password, confirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_RefreshToken value) refreshToken,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ChangeTemporaryPassword value)
        changeTemporaryPassword,
    required TResult Function(_ChangePermanentPassword value)
        changePermanentPassword,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetPasswordResetId value) setPasswordResetId,
  }) {
    return verify(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_RefreshToken value)? refreshToken,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult? Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_SetPasswordResetId value)? setPasswordResetId,
  }) {
    return verify?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_RefreshToken value)? refreshToken,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetPasswordResetId value)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (verify != null) {
      return verify(this);
    }
    return orElse();
  }
}

abstract class _Verify implements AuthEvent {
  const factory _Verify(
      {final String? code,
      final String? password,
      final String? confirmPassword}) = _$VerifyImpl;

  String? get code;
  String? get password;
  String? get confirmPassword;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyImplCopyWith<_$VerifyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetPasswordResetIdImplCopyWith<$Res> {
  factory _$$SetPasswordResetIdImplCopyWith(_$SetPasswordResetIdImpl value,
          $Res Function(_$SetPasswordResetIdImpl) then) =
      __$$SetPasswordResetIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? passwordResetId});
}

/// @nodoc
class __$$SetPasswordResetIdImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SetPasswordResetIdImpl>
    implements _$$SetPasswordResetIdImplCopyWith<$Res> {
  __$$SetPasswordResetIdImplCopyWithImpl(_$SetPasswordResetIdImpl _value,
      $Res Function(_$SetPasswordResetIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passwordResetId = freezed,
  }) {
    return _then(_$SetPasswordResetIdImpl(
      passwordResetId: freezed == passwordResetId
          ? _value.passwordResetId
          : passwordResetId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SetPasswordResetIdImpl
    with DiagnosticableTreeMixin
    implements _SetPasswordResetId {
  const _$SetPasswordResetIdImpl({this.passwordResetId});

  @override
  final int? passwordResetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.setPasswordResetId(passwordResetId: $passwordResetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.setPasswordResetId'))
      ..add(DiagnosticsProperty('passwordResetId', passwordResetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetPasswordResetIdImpl &&
            (identical(other.passwordResetId, passwordResetId) ||
                other.passwordResetId == passwordResetId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, passwordResetId);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetPasswordResetIdImplCopyWith<_$SetPasswordResetIdImpl> get copyWith =>
      __$$SetPasswordResetIdImplCopyWithImpl<_$SetPasswordResetIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function() getUser,
    required TResult Function() refreshToken,
    required TResult Function(String email) forgotPassword,
    required TResult Function(String password, String confirmPassword)
        changeTemporaryPassword,
    required TResult Function(String password, String confirmPassword)
        changePermanentPassword,
    required TResult Function(String code, int passwordResetId) verifyOtp,
    required TResult Function(
            String password, String confirmPassword, int passwordResetId)
        resetPassword,
    required TResult Function(
            String? code, String? password, String? confirmPassword)
        verify,
    required TResult Function(int? passwordResetId) setPasswordResetId,
  }) {
    return setPasswordResetId(passwordResetId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function()? getUser,
    TResult? Function()? refreshToken,
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult? Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult? Function(String code, int passwordResetId)? verifyOtp,
    TResult? Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult? Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult? Function(int? passwordResetId)? setPasswordResetId,
  }) {
    return setPasswordResetId?.call(passwordResetId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function()? getUser,
    TResult Function()? refreshToken,
    TResult Function(String email)? forgotPassword,
    TResult Function(String password, String confirmPassword)?
        changeTemporaryPassword,
    TResult Function(String password, String confirmPassword)?
        changePermanentPassword,
    TResult Function(String code, int passwordResetId)? verifyOtp,
    TResult Function(
            String password, String confirmPassword, int passwordResetId)?
        resetPassword,
    TResult Function(String? code, String? password, String? confirmPassword)?
        verify,
    TResult Function(int? passwordResetId)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (setPasswordResetId != null) {
      return setPasswordResetId(passwordResetId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_RefreshToken value) refreshToken,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_ChangeTemporaryPassword value)
        changeTemporaryPassword,
    required TResult Function(_ChangePermanentPassword value)
        changePermanentPassword,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetPasswordResetId value) setPasswordResetId,
  }) {
    return setPasswordResetId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_RefreshToken value)? refreshToken,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult? Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_SetPasswordResetId value)? setPasswordResetId,
  }) {
    return setPasswordResetId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_RefreshToken value)? refreshToken,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_ChangeTemporaryPassword value)? changeTemporaryPassword,
    TResult Function(_ChangePermanentPassword value)? changePermanentPassword,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetPasswordResetId value)? setPasswordResetId,
    required TResult orElse(),
  }) {
    if (setPasswordResetId != null) {
      return setPasswordResetId(this);
    }
    return orElse();
  }
}

abstract class _SetPasswordResetId implements AuthEvent {
  const factory _SetPasswordResetId({final int? passwordResetId}) =
      _$SetPasswordResetIdImpl;

  int? get passwordResetId;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetPasswordResetIdImplCopyWith<_$SetPasswordResetIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthStateViewModel viewModel) loaded,
    required TResult Function(AuthStateViewModel viewModel) verified,
    required TResult Function(String error) error,
    required TResult Function(String error) errorVerify,
    required TResult Function() passwordReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthStateViewModel viewModel)? loaded,
    TResult? Function(AuthStateViewModel viewModel)? verified,
    TResult? Function(String error)? error,
    TResult? Function(String error)? errorVerify,
    TResult? Function()? passwordReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthStateViewModel viewModel)? loaded,
    TResult Function(AuthStateViewModel viewModel)? verified,
    TResult Function(String error)? error,
    TResult Function(String error)? errorVerify,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorVerify value) errorVerify,
    required TResult Function(_PasswordReset value) passwordReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
    TResult? Function(_ErrorVerify value)? errorVerify,
    TResult? Function(_PasswordReset value)? passwordReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorVerify value)? errorVerify,
    TResult Function(_PasswordReset value)? passwordReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthStateViewModel viewModel) loaded,
    required TResult Function(AuthStateViewModel viewModel) verified,
    required TResult Function(String error) error,
    required TResult Function(String error) errorVerify,
    required TResult Function() passwordReset,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthStateViewModel viewModel)? loaded,
    TResult? Function(AuthStateViewModel viewModel)? verified,
    TResult? Function(String error)? error,
    TResult? Function(String error)? errorVerify,
    TResult? Function()? passwordReset,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthStateViewModel viewModel)? loaded,
    TResult Function(AuthStateViewModel viewModel)? verified,
    TResult Function(String error)? error,
    TResult Function(String error)? errorVerify,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorVerify value) errorVerify,
    required TResult Function(_PasswordReset value) passwordReset,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
    TResult? Function(_ErrorVerify value)? errorVerify,
    TResult? Function(_PasswordReset value)? passwordReset,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorVerify value)? errorVerify,
    TResult Function(_PasswordReset value)? passwordReset,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthStateViewModel viewModel) loaded,
    required TResult Function(AuthStateViewModel viewModel) verified,
    required TResult Function(String error) error,
    required TResult Function(String error) errorVerify,
    required TResult Function() passwordReset,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthStateViewModel viewModel)? loaded,
    TResult? Function(AuthStateViewModel viewModel)? verified,
    TResult? Function(String error)? error,
    TResult? Function(String error)? errorVerify,
    TResult? Function()? passwordReset,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthStateViewModel viewModel)? loaded,
    TResult Function(AuthStateViewModel viewModel)? verified,
    TResult Function(String error)? error,
    TResult Function(String error)? errorVerify,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorVerify value) errorVerify,
    required TResult Function(_PasswordReset value) passwordReset,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
    TResult? Function(_ErrorVerify value)? errorVerify,
    TResult? Function(_PasswordReset value)? passwordReset,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorVerify value)? errorVerify,
    TResult Function(_PasswordReset value)? passwordReset,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthStateViewModel viewModel});

  $AuthStateViewModelCopyWith<$Res> get viewModel;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewModel = null,
  }) {
    return _then(_$LoadedImpl(
      viewModel: null == viewModel
          ? _value.viewModel
          : viewModel // ignore: cast_nullable_to_non_nullable
              as AuthStateViewModel,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthStateViewModelCopyWith<$Res> get viewModel {
    return $AuthStateViewModelCopyWith<$Res>(_value.viewModel, (value) {
      return _then(_value.copyWith(viewModel: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl with DiagnosticableTreeMixin implements _Loaded {
  const _$LoadedImpl({required this.viewModel});

  @override
  final AuthStateViewModel viewModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.loaded(viewModel: $viewModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.loaded'))
      ..add(DiagnosticsProperty('viewModel', viewModel));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.viewModel, viewModel) ||
                other.viewModel == viewModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewModel);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthStateViewModel viewModel) loaded,
    required TResult Function(AuthStateViewModel viewModel) verified,
    required TResult Function(String error) error,
    required TResult Function(String error) errorVerify,
    required TResult Function() passwordReset,
  }) {
    return loaded(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthStateViewModel viewModel)? loaded,
    TResult? Function(AuthStateViewModel viewModel)? verified,
    TResult? Function(String error)? error,
    TResult? Function(String error)? errorVerify,
    TResult? Function()? passwordReset,
  }) {
    return loaded?.call(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthStateViewModel viewModel)? loaded,
    TResult Function(AuthStateViewModel viewModel)? verified,
    TResult Function(String error)? error,
    TResult Function(String error)? errorVerify,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(viewModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorVerify value) errorVerify,
    required TResult Function(_PasswordReset value) passwordReset,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
    TResult? Function(_ErrorVerify value)? errorVerify,
    TResult? Function(_PasswordReset value)? passwordReset,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorVerify value)? errorVerify,
    TResult Function(_PasswordReset value)? passwordReset,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements AuthState {
  const factory _Loaded({required final AuthStateViewModel viewModel}) =
      _$LoadedImpl;

  AuthStateViewModel get viewModel;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifiedImplCopyWith<$Res> {
  factory _$$VerifiedImplCopyWith(
          _$VerifiedImpl value, $Res Function(_$VerifiedImpl) then) =
      __$$VerifiedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthStateViewModel viewModel});

  $AuthStateViewModelCopyWith<$Res> get viewModel;
}

/// @nodoc
class __$$VerifiedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$VerifiedImpl>
    implements _$$VerifiedImplCopyWith<$Res> {
  __$$VerifiedImplCopyWithImpl(
      _$VerifiedImpl _value, $Res Function(_$VerifiedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewModel = null,
  }) {
    return _then(_$VerifiedImpl(
      viewModel: null == viewModel
          ? _value.viewModel
          : viewModel // ignore: cast_nullable_to_non_nullable
              as AuthStateViewModel,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthStateViewModelCopyWith<$Res> get viewModel {
    return $AuthStateViewModelCopyWith<$Res>(_value.viewModel, (value) {
      return _then(_value.copyWith(viewModel: value));
    });
  }
}

/// @nodoc

class _$VerifiedImpl with DiagnosticableTreeMixin implements _Verified {
  const _$VerifiedImpl({required this.viewModel});

  @override
  final AuthStateViewModel viewModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.verified(viewModel: $viewModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.verified'))
      ..add(DiagnosticsProperty('viewModel', viewModel));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifiedImpl &&
            (identical(other.viewModel, viewModel) ||
                other.viewModel == viewModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewModel);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifiedImplCopyWith<_$VerifiedImpl> get copyWith =>
      __$$VerifiedImplCopyWithImpl<_$VerifiedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthStateViewModel viewModel) loaded,
    required TResult Function(AuthStateViewModel viewModel) verified,
    required TResult Function(String error) error,
    required TResult Function(String error) errorVerify,
    required TResult Function() passwordReset,
  }) {
    return verified(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthStateViewModel viewModel)? loaded,
    TResult? Function(AuthStateViewModel viewModel)? verified,
    TResult? Function(String error)? error,
    TResult? Function(String error)? errorVerify,
    TResult? Function()? passwordReset,
  }) {
    return verified?.call(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthStateViewModel viewModel)? loaded,
    TResult Function(AuthStateViewModel viewModel)? verified,
    TResult Function(String error)? error,
    TResult Function(String error)? errorVerify,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified(viewModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorVerify value) errorVerify,
    required TResult Function(_PasswordReset value) passwordReset,
  }) {
    return verified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
    TResult? Function(_ErrorVerify value)? errorVerify,
    TResult? Function(_PasswordReset value)? passwordReset,
  }) {
    return verified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorVerify value)? errorVerify,
    TResult Function(_PasswordReset value)? passwordReset,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified(this);
    }
    return orElse();
  }
}

abstract class _Verified implements AuthState {
  const factory _Verified({required final AuthStateViewModel viewModel}) =
      _$VerifiedImpl;

  AuthStateViewModel get viewModel;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifiedImplCopyWith<_$VerifiedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthStateViewModel viewModel) loaded,
    required TResult Function(AuthStateViewModel viewModel) verified,
    required TResult Function(String error) error,
    required TResult Function(String error) errorVerify,
    required TResult Function() passwordReset,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthStateViewModel viewModel)? loaded,
    TResult? Function(AuthStateViewModel viewModel)? verified,
    TResult? Function(String error)? error,
    TResult? Function(String error)? errorVerify,
    TResult? Function()? passwordReset,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthStateViewModel viewModel)? loaded,
    TResult Function(AuthStateViewModel viewModel)? verified,
    TResult Function(String error)? error,
    TResult Function(String error)? errorVerify,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorVerify value) errorVerify,
    required TResult Function(_PasswordReset value) passwordReset,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
    TResult? Function(_ErrorVerify value)? errorVerify,
    TResult? Function(_PasswordReset value)? passwordReset,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorVerify value)? errorVerify,
    TResult Function(_PasswordReset value)? passwordReset,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorVerifyImplCopyWith<$Res> {
  factory _$$ErrorVerifyImplCopyWith(
          _$ErrorVerifyImpl value, $Res Function(_$ErrorVerifyImpl) then) =
      __$$ErrorVerifyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorVerifyImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorVerifyImpl>
    implements _$$ErrorVerifyImplCopyWith<$Res> {
  __$$ErrorVerifyImplCopyWithImpl(
      _$ErrorVerifyImpl _value, $Res Function(_$ErrorVerifyImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorVerifyImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorVerifyImpl with DiagnosticableTreeMixin implements _ErrorVerify {
  const _$ErrorVerifyImpl(this.error);

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.errorVerify(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.errorVerify'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorVerifyImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorVerifyImplCopyWith<_$ErrorVerifyImpl> get copyWith =>
      __$$ErrorVerifyImplCopyWithImpl<_$ErrorVerifyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthStateViewModel viewModel) loaded,
    required TResult Function(AuthStateViewModel viewModel) verified,
    required TResult Function(String error) error,
    required TResult Function(String error) errorVerify,
    required TResult Function() passwordReset,
  }) {
    return errorVerify(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthStateViewModel viewModel)? loaded,
    TResult? Function(AuthStateViewModel viewModel)? verified,
    TResult? Function(String error)? error,
    TResult? Function(String error)? errorVerify,
    TResult? Function()? passwordReset,
  }) {
    return errorVerify?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthStateViewModel viewModel)? loaded,
    TResult Function(AuthStateViewModel viewModel)? verified,
    TResult Function(String error)? error,
    TResult Function(String error)? errorVerify,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) {
    if (errorVerify != null) {
      return errorVerify(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorVerify value) errorVerify,
    required TResult Function(_PasswordReset value) passwordReset,
  }) {
    return errorVerify(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
    TResult? Function(_ErrorVerify value)? errorVerify,
    TResult? Function(_PasswordReset value)? passwordReset,
  }) {
    return errorVerify?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorVerify value)? errorVerify,
    TResult Function(_PasswordReset value)? passwordReset,
    required TResult orElse(),
  }) {
    if (errorVerify != null) {
      return errorVerify(this);
    }
    return orElse();
  }
}

abstract class _ErrorVerify implements AuthState {
  const factory _ErrorVerify(final String error) = _$ErrorVerifyImpl;

  String get error;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorVerifyImplCopyWith<_$ErrorVerifyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordResetImplCopyWith<$Res> {
  factory _$$PasswordResetImplCopyWith(
          _$PasswordResetImpl value, $Res Function(_$PasswordResetImpl) then) =
      __$$PasswordResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PasswordResetImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$PasswordResetImpl>
    implements _$$PasswordResetImplCopyWith<$Res> {
  __$$PasswordResetImplCopyWithImpl(
      _$PasswordResetImpl _value, $Res Function(_$PasswordResetImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PasswordResetImpl
    with DiagnosticableTreeMixin
    implements _PasswordReset {
  const _$PasswordResetImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.passwordReset()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthState.passwordReset'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PasswordResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthStateViewModel viewModel) loaded,
    required TResult Function(AuthStateViewModel viewModel) verified,
    required TResult Function(String error) error,
    required TResult Function(String error) errorVerify,
    required TResult Function() passwordReset,
  }) {
    return passwordReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthStateViewModel viewModel)? loaded,
    TResult? Function(AuthStateViewModel viewModel)? verified,
    TResult? Function(String error)? error,
    TResult? Function(String error)? errorVerify,
    TResult? Function()? passwordReset,
  }) {
    return passwordReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthStateViewModel viewModel)? loaded,
    TResult Function(AuthStateViewModel viewModel)? verified,
    TResult Function(String error)? error,
    TResult Function(String error)? errorVerify,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) {
    if (passwordReset != null) {
      return passwordReset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorVerify value) errorVerify,
    required TResult Function(_PasswordReset value) passwordReset,
  }) {
    return passwordReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
    TResult? Function(_ErrorVerify value)? errorVerify,
    TResult? Function(_PasswordReset value)? passwordReset,
  }) {
    return passwordReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorVerify value)? errorVerify,
    TResult Function(_PasswordReset value)? passwordReset,
    required TResult orElse(),
  }) {
    if (passwordReset != null) {
      return passwordReset(this);
    }
    return orElse();
  }
}

abstract class _PasswordReset implements AuthState {
  const factory _PasswordReset() = _$PasswordResetImpl;
}

/// @nodoc
mixin _$AuthStateViewModel {
  int get userId => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  Map<String, dynamic> get tokenPayload => throw _privateConstructorUsedError;
  bool get hasTempPassword => throw _privateConstructorUsedError;
  UserEntity get user => throw _privateConstructorUsedError;
  int? get passwordResetId => throw _privateConstructorUsedError;

  /// Create a copy of AuthStateViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateViewModelCopyWith<AuthStateViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateViewModelCopyWith<$Res> {
  factory $AuthStateViewModelCopyWith(
          AuthStateViewModel value, $Res Function(AuthStateViewModel) then) =
      _$AuthStateViewModelCopyWithImpl<$Res, AuthStateViewModel>;
  @useResult
  $Res call(
      {int userId,
      String token,
      String refreshToken,
      Map<String, dynamic> tokenPayload,
      bool hasTempPassword,
      UserEntity user,
      int? passwordResetId});

  $UserEntityCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthStateViewModelCopyWithImpl<$Res, $Val extends AuthStateViewModel>
    implements $AuthStateViewModelCopyWith<$Res> {
  _$AuthStateViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthStateViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? token = null,
    Object? refreshToken = null,
    Object? tokenPayload = null,
    Object? hasTempPassword = null,
    Object? user = null,
    Object? passwordResetId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenPayload: null == tokenPayload
          ? _value.tokenPayload
          : tokenPayload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      hasTempPassword: null == hasTempPassword
          ? _value.hasTempPassword
          : hasTempPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      passwordResetId: freezed == passwordResetId
          ? _value.passwordResetId
          : passwordResetId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of AuthStateViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get user {
    return $UserEntityCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateViewModelImplCopyWith<$Res>
    implements $AuthStateViewModelCopyWith<$Res> {
  factory _$$AuthStateViewModelImplCopyWith(_$AuthStateViewModelImpl value,
          $Res Function(_$AuthStateViewModelImpl) then) =
      __$$AuthStateViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int userId,
      String token,
      String refreshToken,
      Map<String, dynamic> tokenPayload,
      bool hasTempPassword,
      UserEntity user,
      int? passwordResetId});

  @override
  $UserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthStateViewModelImplCopyWithImpl<$Res>
    extends _$AuthStateViewModelCopyWithImpl<$Res, _$AuthStateViewModelImpl>
    implements _$$AuthStateViewModelImplCopyWith<$Res> {
  __$$AuthStateViewModelImplCopyWithImpl(_$AuthStateViewModelImpl _value,
      $Res Function(_$AuthStateViewModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthStateViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? token = null,
    Object? refreshToken = null,
    Object? tokenPayload = null,
    Object? hasTempPassword = null,
    Object? user = null,
    Object? passwordResetId = freezed,
  }) {
    return _then(_$AuthStateViewModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenPayload: null == tokenPayload
          ? _value._tokenPayload
          : tokenPayload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      hasTempPassword: null == hasTempPassword
          ? _value.hasTempPassword
          : hasTempPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      passwordResetId: freezed == passwordResetId
          ? _value.passwordResetId
          : passwordResetId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$AuthStateViewModelImpl
    with DiagnosticableTreeMixin
    implements _AuthStateViewModel {
  const _$AuthStateViewModelImpl(
      {this.userId = 0,
      this.token = '',
      this.refreshToken = '',
      final Map<String, dynamic> tokenPayload = const {},
      this.hasTempPassword = false,
      this.user = const UserEntity(
          id: '', email: 'email', firstName: 'firstName', lastName: 'lastName'),
      this.passwordResetId})
      : _tokenPayload = tokenPayload;

  @override
  @JsonKey()
  final int userId;
  @override
  @JsonKey()
  final String token;
  @override
  @JsonKey()
  final String refreshToken;
  final Map<String, dynamic> _tokenPayload;
  @override
  @JsonKey()
  Map<String, dynamic> get tokenPayload {
    if (_tokenPayload is EqualUnmodifiableMapView) return _tokenPayload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tokenPayload);
  }

  @override
  @JsonKey()
  final bool hasTempPassword;
  @override
  @JsonKey()
  final UserEntity user;
  @override
  final int? passwordResetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthStateViewModel(userId: $userId, token: $token, refreshToken: $refreshToken, tokenPayload: $tokenPayload, hasTempPassword: $hasTempPassword, user: $user, passwordResetId: $passwordResetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthStateViewModel'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('refreshToken', refreshToken))
      ..add(DiagnosticsProperty('tokenPayload', tokenPayload))
      ..add(DiagnosticsProperty('hasTempPassword', hasTempPassword))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('passwordResetId', passwordResetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateViewModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            const DeepCollectionEquality()
                .equals(other._tokenPayload, _tokenPayload) &&
            (identical(other.hasTempPassword, hasTempPassword) ||
                other.hasTempPassword == hasTempPassword) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.passwordResetId, passwordResetId) ||
                other.passwordResetId == passwordResetId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      token,
      refreshToken,
      const DeepCollectionEquality().hash(_tokenPayload),
      hasTempPassword,
      user,
      passwordResetId);

  /// Create a copy of AuthStateViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateViewModelImplCopyWith<_$AuthStateViewModelImpl> get copyWith =>
      __$$AuthStateViewModelImplCopyWithImpl<_$AuthStateViewModelImpl>(
          this, _$identity);
}

abstract class _AuthStateViewModel implements AuthStateViewModel {
  const factory _AuthStateViewModel(
      {final int userId,
      final String token,
      final String refreshToken,
      final Map<String, dynamic> tokenPayload,
      final bool hasTempPassword,
      final UserEntity user,
      final int? passwordResetId}) = _$AuthStateViewModelImpl;

  @override
  int get userId;
  @override
  String get token;
  @override
  String get refreshToken;
  @override
  Map<String, dynamic> get tokenPayload;
  @override
  bool get hasTempPassword;
  @override
  UserEntity get user;
  @override
  int? get passwordResetId;

  /// Create a copy of AuthStateViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateViewModelImplCopyWith<_$AuthStateViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
