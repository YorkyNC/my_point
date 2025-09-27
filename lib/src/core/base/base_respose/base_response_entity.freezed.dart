// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseResponseEntity<T, M> {
  T get data => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  M get meta => throw _privateConstructorUsedError;

  /// Create a copy of BaseResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseResponseEntityCopyWith<T, M, BaseResponseEntity<T, M>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseResponseEntityCopyWith<T, M, $Res> {
  factory $BaseResponseEntityCopyWith(BaseResponseEntity<T, M> value,
          $Res Function(BaseResponseEntity<T, M>) then) =
      _$BaseResponseEntityCopyWithImpl<T, M, $Res, BaseResponseEntity<T, M>>;
  @useResult
  $Res call({T data, String status, M meta});
}

/// @nodoc
class _$BaseResponseEntityCopyWithImpl<T, M, $Res,
        $Val extends BaseResponseEntity<T, M>>
    implements $BaseResponseEntityCopyWith<T, M, $Res> {
  _$BaseResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = null,
    Object? meta = freezed,
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
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as M,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseResponseEntityImplCopyWith<T, M, $Res>
    implements $BaseResponseEntityCopyWith<T, M, $Res> {
  factory _$$BaseResponseEntityImplCopyWith(
          _$BaseResponseEntityImpl<T, M> value,
          $Res Function(_$BaseResponseEntityImpl<T, M>) then) =
      __$$BaseResponseEntityImplCopyWithImpl<T, M, $Res>;
  @override
  @useResult
  $Res call({T data, String status, M meta});
}

/// @nodoc
class __$$BaseResponseEntityImplCopyWithImpl<T, M, $Res>
    extends _$BaseResponseEntityCopyWithImpl<T, M, $Res,
        _$BaseResponseEntityImpl<T, M>>
    implements _$$BaseResponseEntityImplCopyWith<T, M, $Res> {
  __$$BaseResponseEntityImplCopyWithImpl(_$BaseResponseEntityImpl<T, M> _value,
      $Res Function(_$BaseResponseEntityImpl<T, M>) _then)
      : super(_value, _then);

  /// Create a copy of BaseResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = null,
    Object? meta = freezed,
  }) {
    return _then(_$BaseResponseEntityImpl<T, M>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as M,
    ));
  }
}

/// @nodoc

class _$BaseResponseEntityImpl<T, M> implements _BaseResponseEntity<T, M> {
  const _$BaseResponseEntityImpl(
      {required this.data, required this.status, required this.meta});

  @override
  final T data;
  @override
  final String status;
  @override
  final M meta;

  @override
  String toString() {
    return 'BaseResponseEntity<$T, $M>(data: $data, status: $status, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseResponseEntityImpl<T, M> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.meta, meta));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      status,
      const DeepCollectionEquality().hash(meta));

  /// Create a copy of BaseResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseResponseEntityImplCopyWith<T, M, _$BaseResponseEntityImpl<T, M>>
      get copyWith => __$$BaseResponseEntityImplCopyWithImpl<T, M,
          _$BaseResponseEntityImpl<T, M>>(this, _$identity);
}

abstract class _BaseResponseEntity<T, M> implements BaseResponseEntity<T, M> {
  const factory _BaseResponseEntity(
      {required final T data,
      required final String status,
      required final M meta}) = _$BaseResponseEntityImpl<T, M>;

  @override
  T get data;
  @override
  String get status;
  @override
  M get meta;

  /// Create a copy of BaseResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseResponseEntityImplCopyWith<T, M, _$BaseResponseEntityImpl<T, M>>
      get copyWith => throw _privateConstructorUsedError;
}
