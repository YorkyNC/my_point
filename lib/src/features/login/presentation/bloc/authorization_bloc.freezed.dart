// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authorization_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthorizationState {
  String? get phoneCode => throw _privateConstructorUsedError;
  bool get isPhoneCodeFilled => throw _privateConstructorUsedError;
  String? get flag => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  bool get isPhoneNumberFilled => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of AuthorizationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthorizationStateCopyWith<AuthorizationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorizationStateCopyWith<$Res> {
  factory $AuthorizationStateCopyWith(
          AuthorizationState value, $Res Function(AuthorizationState) then) =
      _$AuthorizationStateCopyWithImpl<$Res, AuthorizationState>;
  @useResult
  $Res call(
      {String? phoneCode,
      bool isPhoneCodeFilled,
      String? flag,
      String? phoneNumber,
      bool isPhoneNumberFilled,
      bool isLoading});
}

/// @nodoc
class _$AuthorizationStateCopyWithImpl<$Res, $Val extends AuthorizationState>
    implements $AuthorizationStateCopyWith<$Res> {
  _$AuthorizationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthorizationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneCode = freezed,
    Object? isPhoneCodeFilled = null,
    Object? flag = freezed,
    Object? phoneNumber = freezed,
    Object? isPhoneNumberFilled = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isPhoneCodeFilled: null == isPhoneCodeFilled
          ? _value.isPhoneCodeFilled
          : isPhoneCodeFilled // ignore: cast_nullable_to_non_nullable
              as bool,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isPhoneNumberFilled: null == isPhoneNumberFilled
          ? _value.isPhoneNumberFilled
          : isPhoneNumberFilled // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorizationStateImplCopyWith<$Res>
    implements $AuthorizationStateCopyWith<$Res> {
  factory _$$AuthorizationStateImplCopyWith(_$AuthorizationStateImpl value,
          $Res Function(_$AuthorizationStateImpl) then) =
      __$$AuthorizationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? phoneCode,
      bool isPhoneCodeFilled,
      String? flag,
      String? phoneNumber,
      bool isPhoneNumberFilled,
      bool isLoading});
}

/// @nodoc
class __$$AuthorizationStateImplCopyWithImpl<$Res>
    extends _$AuthorizationStateCopyWithImpl<$Res, _$AuthorizationStateImpl>
    implements _$$AuthorizationStateImplCopyWith<$Res> {
  __$$AuthorizationStateImplCopyWithImpl(_$AuthorizationStateImpl _value,
      $Res Function(_$AuthorizationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthorizationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneCode = freezed,
    Object? isPhoneCodeFilled = null,
    Object? flag = freezed,
    Object? phoneNumber = freezed,
    Object? isPhoneNumberFilled = null,
    Object? isLoading = null,
  }) {
    return _then(_$AuthorizationStateImpl(
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isPhoneCodeFilled: null == isPhoneCodeFilled
          ? _value.isPhoneCodeFilled
          : isPhoneCodeFilled // ignore: cast_nullable_to_non_nullable
              as bool,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isPhoneNumberFilled: null == isPhoneNumberFilled
          ? _value.isPhoneNumberFilled
          : isPhoneNumberFilled // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthorizationStateImpl extends _AuthorizationState {
  const _$AuthorizationStateImpl(
      {this.phoneCode,
      this.isPhoneCodeFilled = false,
      this.flag,
      this.phoneNumber,
      this.isPhoneNumberFilled = false,
      this.isLoading = false})
      : super._();

  @override
  final String? phoneCode;
  @override
  @JsonKey()
  final bool isPhoneCodeFilled;
  @override
  final String? flag;
  @override
  final String? phoneNumber;
  @override
  @JsonKey()
  final bool isPhoneNumberFilled;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AuthorizationState(phoneCode: $phoneCode, isPhoneCodeFilled: $isPhoneCodeFilled, flag: $flag, phoneNumber: $phoneNumber, isPhoneNumberFilled: $isPhoneNumberFilled, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorizationStateImpl &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode) &&
            (identical(other.isPhoneCodeFilled, isPhoneCodeFilled) ||
                other.isPhoneCodeFilled == isPhoneCodeFilled) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isPhoneNumberFilled, isPhoneNumberFilled) ||
                other.isPhoneNumberFilled == isPhoneNumberFilled) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneCode, isPhoneCodeFilled,
      flag, phoneNumber, isPhoneNumberFilled, isLoading);

  /// Create a copy of AuthorizationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorizationStateImplCopyWith<_$AuthorizationStateImpl> get copyWith =>
      __$$AuthorizationStateImplCopyWithImpl<_$AuthorizationStateImpl>(
          this, _$identity);
}

abstract class _AuthorizationState extends AuthorizationState {
  const factory _AuthorizationState(
      {final String? phoneCode,
      final bool isPhoneCodeFilled,
      final String? flag,
      final String? phoneNumber,
      final bool isPhoneNumberFilled,
      final bool isLoading}) = _$AuthorizationStateImpl;
  const _AuthorizationState._() : super._();

  @override
  String? get phoneCode;
  @override
  bool get isPhoneCodeFilled;
  @override
  String? get flag;
  @override
  String? get phoneNumber;
  @override
  bool get isPhoneNumberFilled;
  @override
  bool get isLoading;

  /// Create a copy of AuthorizationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorizationStateImplCopyWith<_$AuthorizationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
