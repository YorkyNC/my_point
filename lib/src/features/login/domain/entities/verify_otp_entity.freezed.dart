// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyOtpEntity _$VerifyOtpEntityFromJson(Map<String, dynamic> json) {
  return _VerifyOtpEntity.fromJson(json);
}

/// @nodoc
mixin _$VerifyOtpEntity {
  String get pinId => throw _privateConstructorUsedError;
  String get msisdn => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  int get attemptsRemaining => throw _privateConstructorUsedError;
  String? get pinError => throw _privateConstructorUsedError;

  /// Serializes this VerifyOtpEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyOtpEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyOtpEntityCopyWith<VerifyOtpEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpEntityCopyWith<$Res> {
  factory $VerifyOtpEntityCopyWith(
          VerifyOtpEntity value, $Res Function(VerifyOtpEntity) then) =
      _$VerifyOtpEntityCopyWithImpl<$Res, VerifyOtpEntity>;
  @useResult
  $Res call(
      {String pinId,
      String msisdn,
      bool verified,
      int attemptsRemaining,
      String? pinError});
}

/// @nodoc
class _$VerifyOtpEntityCopyWithImpl<$Res, $Val extends VerifyOtpEntity>
    implements $VerifyOtpEntityCopyWith<$Res> {
  _$VerifyOtpEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyOtpEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinId = null,
    Object? msisdn = null,
    Object? verified = null,
    Object? attemptsRemaining = null,
    Object? pinError = freezed,
  }) {
    return _then(_value.copyWith(
      pinId: null == pinId
          ? _value.pinId
          : pinId // ignore: cast_nullable_to_non_nullable
              as String,
      msisdn: null == msisdn
          ? _value.msisdn
          : msisdn // ignore: cast_nullable_to_non_nullable
              as String,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      attemptsRemaining: null == attemptsRemaining
          ? _value.attemptsRemaining
          : attemptsRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      pinError: freezed == pinError
          ? _value.pinError
          : pinError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyOtpEntityImplCopyWith<$Res>
    implements $VerifyOtpEntityCopyWith<$Res> {
  factory _$$VerifyOtpEntityImplCopyWith(_$VerifyOtpEntityImpl value,
          $Res Function(_$VerifyOtpEntityImpl) then) =
      __$$VerifyOtpEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String pinId,
      String msisdn,
      bool verified,
      int attemptsRemaining,
      String? pinError});
}

/// @nodoc
class __$$VerifyOtpEntityImplCopyWithImpl<$Res>
    extends _$VerifyOtpEntityCopyWithImpl<$Res, _$VerifyOtpEntityImpl>
    implements _$$VerifyOtpEntityImplCopyWith<$Res> {
  __$$VerifyOtpEntityImplCopyWithImpl(
      _$VerifyOtpEntityImpl _value, $Res Function(_$VerifyOtpEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyOtpEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinId = null,
    Object? msisdn = null,
    Object? verified = null,
    Object? attemptsRemaining = null,
    Object? pinError = freezed,
  }) {
    return _then(_$VerifyOtpEntityImpl(
      pinId: null == pinId
          ? _value.pinId
          : pinId // ignore: cast_nullable_to_non_nullable
              as String,
      msisdn: null == msisdn
          ? _value.msisdn
          : msisdn // ignore: cast_nullable_to_non_nullable
              as String,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      attemptsRemaining: null == attemptsRemaining
          ? _value.attemptsRemaining
          : attemptsRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      pinError: freezed == pinError
          ? _value.pinError
          : pinError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyOtpEntityImpl implements _VerifyOtpEntity {
  const _$VerifyOtpEntityImpl(
      {required this.pinId,
      required this.msisdn,
      required this.verified,
      required this.attemptsRemaining,
      this.pinError});

  factory _$VerifyOtpEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyOtpEntityImplFromJson(json);

  @override
  final String pinId;
  @override
  final String msisdn;
  @override
  final bool verified;
  @override
  final int attemptsRemaining;
  @override
  final String? pinError;

  @override
  String toString() {
    return 'VerifyOtpEntity(pinId: $pinId, msisdn: $msisdn, verified: $verified, attemptsRemaining: $attemptsRemaining, pinError: $pinError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpEntityImpl &&
            (identical(other.pinId, pinId) || other.pinId == pinId) &&
            (identical(other.msisdn, msisdn) || other.msisdn == msisdn) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.attemptsRemaining, attemptsRemaining) ||
                other.attemptsRemaining == attemptsRemaining) &&
            (identical(other.pinError, pinError) ||
                other.pinError == pinError));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, pinId, msisdn, verified, attemptsRemaining, pinError);

  /// Create a copy of VerifyOtpEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpEntityImplCopyWith<_$VerifyOtpEntityImpl> get copyWith =>
      __$$VerifyOtpEntityImplCopyWithImpl<_$VerifyOtpEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyOtpEntityImplToJson(
      this,
    );
  }
}

abstract class _VerifyOtpEntity implements VerifyOtpEntity {
  const factory _VerifyOtpEntity(
      {required final String pinId,
      required final String msisdn,
      required final bool verified,
      required final int attemptsRemaining,
      final String? pinError}) = _$VerifyOtpEntityImpl;

  factory _VerifyOtpEntity.fromJson(Map<String, dynamic> json) =
      _$VerifyOtpEntityImpl.fromJson;

  @override
  String get pinId;
  @override
  String get msisdn;
  @override
  bool get verified;
  @override
  int get attemptsRemaining;
  @override
  String? get pinError;

  /// Create a copy of VerifyOtpEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpEntityImplCopyWith<_$VerifyOtpEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
