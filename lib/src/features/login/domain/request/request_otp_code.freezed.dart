// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_otp_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestOtpCode _$RequestOtpCodeFromJson(Map<String, dynamic> json) {
  return _RequestOtpCode.fromJson(json);
}

/// @nodoc
mixin _$RequestOtpCode {
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Serializes this RequestOtpCode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestOtpCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestOtpCodeCopyWith<RequestOtpCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOtpCodeCopyWith<$Res> {
  factory $RequestOtpCodeCopyWith(
          RequestOtpCode value, $Res Function(RequestOtpCode) then) =
      _$RequestOtpCodeCopyWithImpl<$Res, RequestOtpCode>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class _$RequestOtpCodeCopyWithImpl<$Res, $Val extends RequestOtpCode>
    implements $RequestOtpCodeCopyWith<$Res> {
  _$RequestOtpCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestOtpCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestOtpCodeImplCopyWith<$Res>
    implements $RequestOtpCodeCopyWith<$Res> {
  factory _$$RequestOtpCodeImplCopyWith(_$RequestOtpCodeImpl value,
          $Res Function(_$RequestOtpCodeImpl) then) =
      __$$RequestOtpCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$RequestOtpCodeImplCopyWithImpl<$Res>
    extends _$RequestOtpCodeCopyWithImpl<$Res, _$RequestOtpCodeImpl>
    implements _$$RequestOtpCodeImplCopyWith<$Res> {
  __$$RequestOtpCodeImplCopyWithImpl(
      _$RequestOtpCodeImpl _value, $Res Function(_$RequestOtpCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestOtpCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$RequestOtpCodeImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOtpCodeImpl implements _RequestOtpCode {
  const _$RequestOtpCodeImpl({required this.phoneNumber});

  factory _$RequestOtpCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOtpCodeImplFromJson(json);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'RequestOtpCode(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOtpCodeImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of RequestOtpCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOtpCodeImplCopyWith<_$RequestOtpCodeImpl> get copyWith =>
      __$$RequestOtpCodeImplCopyWithImpl<_$RequestOtpCodeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOtpCodeImplToJson(
      this,
    );
  }
}

abstract class _RequestOtpCode implements RequestOtpCode {
  const factory _RequestOtpCode({required final String phoneNumber}) =
      _$RequestOtpCodeImpl;

  factory _RequestOtpCode.fromJson(Map<String, dynamic> json) =
      _$RequestOtpCodeImpl.fromJson;

  @override
  String get phoneNumber;

  /// Create a copy of RequestOtpCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestOtpCodeImplCopyWith<_$RequestOtpCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
