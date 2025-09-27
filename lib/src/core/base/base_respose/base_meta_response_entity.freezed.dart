// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_meta_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaseMetaResponseEntity _$BaseMetaResponseEntityFromJson(
    Map<String, dynamic> json) {
  return _BaseMetaResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$BaseMetaResponseEntity {
  String? get endCursor => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;

  /// Serializes this BaseMetaResponseEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BaseMetaResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseMetaResponseEntityCopyWith<BaseMetaResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseMetaResponseEntityCopyWith<$Res> {
  factory $BaseMetaResponseEntityCopyWith(BaseMetaResponseEntity value,
          $Res Function(BaseMetaResponseEntity) then) =
      _$BaseMetaResponseEntityCopyWithImpl<$Res, BaseMetaResponseEntity>;
  @useResult
  $Res call({String? endCursor, bool hasNextPage});
}

/// @nodoc
class _$BaseMetaResponseEntityCopyWithImpl<$Res,
        $Val extends BaseMetaResponseEntity>
    implements $BaseMetaResponseEntityCopyWith<$Res> {
  _$BaseMetaResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseMetaResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endCursor = freezed,
    Object? hasNextPage = null,
  }) {
    return _then(_value.copyWith(
      endCursor: freezed == endCursor
          ? _value.endCursor
          : endCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseMetaResponseEntityImplCopyWith<$Res>
    implements $BaseMetaResponseEntityCopyWith<$Res> {
  factory _$$BaseMetaResponseEntityImplCopyWith(
          _$BaseMetaResponseEntityImpl value,
          $Res Function(_$BaseMetaResponseEntityImpl) then) =
      __$$BaseMetaResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? endCursor, bool hasNextPage});
}

/// @nodoc
class __$$BaseMetaResponseEntityImplCopyWithImpl<$Res>
    extends _$BaseMetaResponseEntityCopyWithImpl<$Res,
        _$BaseMetaResponseEntityImpl>
    implements _$$BaseMetaResponseEntityImplCopyWith<$Res> {
  __$$BaseMetaResponseEntityImplCopyWithImpl(
      _$BaseMetaResponseEntityImpl _value,
      $Res Function(_$BaseMetaResponseEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of BaseMetaResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endCursor = freezed,
    Object? hasNextPage = null,
  }) {
    return _then(_$BaseMetaResponseEntityImpl(
      endCursor: freezed == endCursor
          ? _value.endCursor
          : endCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseMetaResponseEntityImpl implements _BaseMetaResponseEntity {
  const _$BaseMetaResponseEntityImpl(
      {this.endCursor, required this.hasNextPage});

  factory _$BaseMetaResponseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseMetaResponseEntityImplFromJson(json);

  @override
  final String? endCursor;
  @override
  final bool hasNextPage;

  @override
  String toString() {
    return 'BaseMetaResponseEntity(endCursor: $endCursor, hasNextPage: $hasNextPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseMetaResponseEntityImpl &&
            (identical(other.endCursor, endCursor) ||
                other.endCursor == endCursor) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, endCursor, hasNextPage);

  /// Create a copy of BaseMetaResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseMetaResponseEntityImplCopyWith<_$BaseMetaResponseEntityImpl>
      get copyWith => __$$BaseMetaResponseEntityImplCopyWithImpl<
          _$BaseMetaResponseEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseMetaResponseEntityImplToJson(
      this,
    );
  }
}

abstract class _BaseMetaResponseEntity implements BaseMetaResponseEntity {
  const factory _BaseMetaResponseEntity(
      {final String? endCursor,
      required final bool hasNextPage}) = _$BaseMetaResponseEntityImpl;

  factory _BaseMetaResponseEntity.fromJson(Map<String, dynamic> json) =
      _$BaseMetaResponseEntityImpl.fromJson;

  @override
  String? get endCursor;
  @override
  bool get hasNextPage;

  /// Create a copy of BaseMetaResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseMetaResponseEntityImplCopyWith<_$BaseMetaResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
