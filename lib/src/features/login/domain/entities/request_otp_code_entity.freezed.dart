// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_otp_code_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestOtpCodeEntity _$RequestOtpCodeEntityFromJson(Map<String, dynamic> json) {
  return _RequestOtpCodeEntity.fromJson(json);
}

/// @nodoc
mixin _$RequestOtpCodeEntity {
  String get pinId => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  String get ncStatus => throw _privateConstructorUsedError;
  String get smsStatus => throw _privateConstructorUsedError;

  /// Serializes this RequestOtpCodeEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestOtpCodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestOtpCodeEntityCopyWith<RequestOtpCodeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOtpCodeEntityCopyWith<$Res> {
  factory $RequestOtpCodeEntityCopyWith(RequestOtpCodeEntity value,
          $Res Function(RequestOtpCodeEntity) then) =
      _$RequestOtpCodeEntityCopyWithImpl<$Res, RequestOtpCodeEntity>;
  @useResult
  $Res call({String pinId, String to, String ncStatus, String smsStatus});
}

/// @nodoc
class _$RequestOtpCodeEntityCopyWithImpl<$Res,
        $Val extends RequestOtpCodeEntity>
    implements $RequestOtpCodeEntityCopyWith<$Res> {
  _$RequestOtpCodeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestOtpCodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinId = null,
    Object? to = null,
    Object? ncStatus = null,
    Object? smsStatus = null,
  }) {
    return _then(_value.copyWith(
      pinId: null == pinId
          ? _value.pinId
          : pinId // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      ncStatus: null == ncStatus
          ? _value.ncStatus
          : ncStatus // ignore: cast_nullable_to_non_nullable
              as String,
      smsStatus: null == smsStatus
          ? _value.smsStatus
          : smsStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestOtpCodeEntityImplCopyWith<$Res>
    implements $RequestOtpCodeEntityCopyWith<$Res> {
  factory _$$RequestOtpCodeEntityImplCopyWith(_$RequestOtpCodeEntityImpl value,
          $Res Function(_$RequestOtpCodeEntityImpl) then) =
      __$$RequestOtpCodeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pinId, String to, String ncStatus, String smsStatus});
}

/// @nodoc
class __$$RequestOtpCodeEntityImplCopyWithImpl<$Res>
    extends _$RequestOtpCodeEntityCopyWithImpl<$Res, _$RequestOtpCodeEntityImpl>
    implements _$$RequestOtpCodeEntityImplCopyWith<$Res> {
  __$$RequestOtpCodeEntityImplCopyWithImpl(_$RequestOtpCodeEntityImpl _value,
      $Res Function(_$RequestOtpCodeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestOtpCodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinId = null,
    Object? to = null,
    Object? ncStatus = null,
    Object? smsStatus = null,
  }) {
    return _then(_$RequestOtpCodeEntityImpl(
      pinId: null == pinId
          ? _value.pinId
          : pinId // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      ncStatus: null == ncStatus
          ? _value.ncStatus
          : ncStatus // ignore: cast_nullable_to_non_nullable
              as String,
      smsStatus: null == smsStatus
          ? _value.smsStatus
          : smsStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOtpCodeEntityImpl implements _RequestOtpCodeEntity {
  const _$RequestOtpCodeEntityImpl(
      {required this.pinId,
      required this.to,
      required this.ncStatus,
      required this.smsStatus});

  factory _$RequestOtpCodeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOtpCodeEntityImplFromJson(json);

  @override
  final String pinId;
  @override
  final String to;
  @override
  final String ncStatus;
  @override
  final String smsStatus;

  @override
  String toString() {
    return 'RequestOtpCodeEntity(pinId: $pinId, to: $to, ncStatus: $ncStatus, smsStatus: $smsStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOtpCodeEntityImpl &&
            (identical(other.pinId, pinId) || other.pinId == pinId) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.ncStatus, ncStatus) ||
                other.ncStatus == ncStatus) &&
            (identical(other.smsStatus, smsStatus) ||
                other.smsStatus == smsStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pinId, to, ncStatus, smsStatus);

  /// Create a copy of RequestOtpCodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOtpCodeEntityImplCopyWith<_$RequestOtpCodeEntityImpl>
      get copyWith =>
          __$$RequestOtpCodeEntityImplCopyWithImpl<_$RequestOtpCodeEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOtpCodeEntityImplToJson(
      this,
    );
  }
}

abstract class _RequestOtpCodeEntity implements RequestOtpCodeEntity {
  const factory _RequestOtpCodeEntity(
      {required final String pinId,
      required final String to,
      required final String ncStatus,
      required final String smsStatus}) = _$RequestOtpCodeEntityImpl;

  factory _RequestOtpCodeEntity.fromJson(Map<String, dynamic> json) =
      _$RequestOtpCodeEntityImpl.fromJson;

  @override
  String get pinId;
  @override
  String get to;
  @override
  String get ncStatus;
  @override
  String get smsStatus;

  /// Create a copy of RequestOtpCodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestOtpCodeEntityImplCopyWith<_$RequestOtpCodeEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
