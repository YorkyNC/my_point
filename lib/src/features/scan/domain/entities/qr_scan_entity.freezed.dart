// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_scan_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QrScanEntity _$QrScanEntityFromJson(Map<String, dynamic> json) {
  return _QrScanEntity.fromJson(json);
}

/// @nodoc
mixin _$QrScanEntity {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this QrScanEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QrScanEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrScanEntityCopyWith<QrScanEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrScanEntityCopyWith<$Res> {
  factory $QrScanEntityCopyWith(
          QrScanEntity value, $Res Function(QrScanEntity) then) =
      _$QrScanEntityCopyWithImpl<$Res, QrScanEntity>;
  @useResult
  $Res call({String status, String message, DateTime timestamp});
}

/// @nodoc
class _$QrScanEntityCopyWithImpl<$Res, $Val extends QrScanEntity>
    implements $QrScanEntityCopyWith<$Res> {
  _$QrScanEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrScanEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QrScanEntityImplCopyWith<$Res>
    implements $QrScanEntityCopyWith<$Res> {
  factory _$$QrScanEntityImplCopyWith(
          _$QrScanEntityImpl value, $Res Function(_$QrScanEntityImpl) then) =
      __$$QrScanEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, DateTime timestamp});
}

/// @nodoc
class __$$QrScanEntityImplCopyWithImpl<$Res>
    extends _$QrScanEntityCopyWithImpl<$Res, _$QrScanEntityImpl>
    implements _$$QrScanEntityImplCopyWith<$Res> {
  __$$QrScanEntityImplCopyWithImpl(
      _$QrScanEntityImpl _value, $Res Function(_$QrScanEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of QrScanEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? timestamp = null,
  }) {
    return _then(_$QrScanEntityImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QrScanEntityImpl implements _QrScanEntity {
  const _$QrScanEntityImpl(
      {required this.status, required this.message, required this.timestamp});

  factory _$QrScanEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$QrScanEntityImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'QrScanEntity(status: $status, message: $message, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrScanEntityImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, timestamp);

  /// Create a copy of QrScanEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrScanEntityImplCopyWith<_$QrScanEntityImpl> get copyWith =>
      __$$QrScanEntityImplCopyWithImpl<_$QrScanEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QrScanEntityImplToJson(
      this,
    );
  }
}

abstract class _QrScanEntity implements QrScanEntity {
  const factory _QrScanEntity(
      {required final String status,
      required final String message,
      required final DateTime timestamp}) = _$QrScanEntityImpl;

  factory _QrScanEntity.fromJson(Map<String, dynamic> json) =
      _$QrScanEntityImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  DateTime get timestamp;

  /// Create a copy of QrScanEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrScanEntityImplCopyWith<_$QrScanEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
