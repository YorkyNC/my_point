// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response_no_meta_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseResponseNoMetaEntity<T> {
  T get data => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Create a copy of BaseResponseNoMetaEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseResponseNoMetaEntityCopyWith<T, BaseResponseNoMetaEntity<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseResponseNoMetaEntityCopyWith<T, $Res> {
  factory $BaseResponseNoMetaEntityCopyWith(BaseResponseNoMetaEntity<T> value,
          $Res Function(BaseResponseNoMetaEntity<T>) then) =
      _$BaseResponseNoMetaEntityCopyWithImpl<T, $Res,
          BaseResponseNoMetaEntity<T>>;
  @useResult
  $Res call({T data, String status});
}

/// @nodoc
class _$BaseResponseNoMetaEntityCopyWithImpl<T, $Res,
        $Val extends BaseResponseNoMetaEntity<T>>
    implements $BaseResponseNoMetaEntityCopyWith<T, $Res> {
  _$BaseResponseNoMetaEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseResponseNoMetaEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseResponseNoMetaEntityImplCopyWith<T, $Res>
    implements $BaseResponseNoMetaEntityCopyWith<T, $Res> {
  factory _$$BaseResponseNoMetaEntityImplCopyWith(
          _$BaseResponseNoMetaEntityImpl<T> value,
          $Res Function(_$BaseResponseNoMetaEntityImpl<T>) then) =
      __$$BaseResponseNoMetaEntityImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T data, String status});
}

/// @nodoc
class __$$BaseResponseNoMetaEntityImplCopyWithImpl<T, $Res>
    extends _$BaseResponseNoMetaEntityCopyWithImpl<T, $Res,
        _$BaseResponseNoMetaEntityImpl<T>>
    implements _$$BaseResponseNoMetaEntityImplCopyWith<T, $Res> {
  __$$BaseResponseNoMetaEntityImplCopyWithImpl(
      _$BaseResponseNoMetaEntityImpl<T> _value,
      $Res Function(_$BaseResponseNoMetaEntityImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of BaseResponseNoMetaEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = null,
  }) {
    return _then(_$BaseResponseNoMetaEntityImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BaseResponseNoMetaEntityImpl<T>
    implements _BaseResponseNoMetaEntity<T> {
  const _$BaseResponseNoMetaEntityImpl(
      {required this.data, required this.status});

  @override
  final T data;
  @override
  final String status;

  @override
  String toString() {
    return 'BaseResponseNoMetaEntity<$T>(data: $data, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseResponseNoMetaEntityImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), status);

  /// Create a copy of BaseResponseNoMetaEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseResponseNoMetaEntityImplCopyWith<T, _$BaseResponseNoMetaEntityImpl<T>>
      get copyWith => __$$BaseResponseNoMetaEntityImplCopyWithImpl<T,
          _$BaseResponseNoMetaEntityImpl<T>>(this, _$identity);
}

abstract class _BaseResponseNoMetaEntity<T>
    implements BaseResponseNoMetaEntity<T> {
  const factory _BaseResponseNoMetaEntity(
      {required final T data,
      required final String status}) = _$BaseResponseNoMetaEntityImpl<T>;

  @override
  T get data;
  @override
  String get status;

  /// Create a copy of BaseResponseNoMetaEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseResponseNoMetaEntityImplCopyWith<T, _$BaseResponseNoMetaEntityImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
