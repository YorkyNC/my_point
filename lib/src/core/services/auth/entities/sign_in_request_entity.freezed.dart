// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignInRequestEntity _$SignInRequestEntityFromJson(Map<String, dynamic> json) {
  return _SignInRequestEntity.fromJson(json);
}

/// @nodoc
mixin _$SignInRequestEntity {
  String get phone => throw _privateConstructorUsedError;

  /// Serializes this SignInRequestEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignInRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInRequestEntityCopyWith<SignInRequestEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInRequestEntityCopyWith<$Res> {
  factory $SignInRequestEntityCopyWith(
          SignInRequestEntity value, $Res Function(SignInRequestEntity) then) =
      _$SignInRequestEntityCopyWithImpl<$Res, SignInRequestEntity>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class _$SignInRequestEntityCopyWithImpl<$Res, $Val extends SignInRequestEntity>
    implements $SignInRequestEntityCopyWith<$Res> {
  _$SignInRequestEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInRequestEntityImplCopyWith<$Res>
    implements $SignInRequestEntityCopyWith<$Res> {
  factory _$$SignInRequestEntityImplCopyWith(_$SignInRequestEntityImpl value,
          $Res Function(_$SignInRequestEntityImpl) then) =
      __$$SignInRequestEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$SignInRequestEntityImplCopyWithImpl<$Res>
    extends _$SignInRequestEntityCopyWithImpl<$Res, _$SignInRequestEntityImpl>
    implements _$$SignInRequestEntityImplCopyWith<$Res> {
  __$$SignInRequestEntityImplCopyWithImpl(_$SignInRequestEntityImpl _value,
      $Res Function(_$SignInRequestEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_$SignInRequestEntityImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInRequestEntityImpl implements _SignInRequestEntity {
  const _$SignInRequestEntityImpl({required this.phone});

  factory _$SignInRequestEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInRequestEntityImplFromJson(json);

  @override
  final String phone;

  @override
  String toString() {
    return 'SignInRequestEntity(phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInRequestEntityImpl &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phone);

  /// Create a copy of SignInRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInRequestEntityImplCopyWith<_$SignInRequestEntityImpl> get copyWith =>
      __$$SignInRequestEntityImplCopyWithImpl<_$SignInRequestEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInRequestEntityImplToJson(
      this,
    );
  }
}

abstract class _SignInRequestEntity implements SignInRequestEntity {
  const factory _SignInRequestEntity({required final String phone}) =
      _$SignInRequestEntityImpl;

  factory _SignInRequestEntity.fromJson(Map<String, dynamic> json) =
      _$SignInRequestEntityImpl.fromJson;

  @override
  String get phone;

  /// Create a copy of SignInRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInRequestEntityImplCopyWith<_$SignInRequestEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
