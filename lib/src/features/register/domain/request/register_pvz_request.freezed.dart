// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_pvz_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterPvzRequest _$RegisterPvzRequestFromJson(Map<String, dynamic> json) {
  return _RegisterPvzRequest.fromJson(json);
}

/// @nodoc
mixin _$RegisterPvzRequest {
  String get address => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  List<String> get files => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get square => throw _privateConstructorUsedError;

  /// Serializes this RegisterPvzRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterPvzRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterPvzRequestCopyWith<RegisterPvzRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterPvzRequestCopyWith<$Res> {
  factory $RegisterPvzRequestCopyWith(
          RegisterPvzRequest value, $Res Function(RegisterPvzRequest) then) =
      _$RegisterPvzRequestCopyWithImpl<$Res, RegisterPvzRequest>;
  @useResult
  $Res call(
      {String address,
      String city,
      List<String> files,
      double latitude,
      double longitude,
      String name,
      String square});
}

/// @nodoc
class _$RegisterPvzRequestCopyWithImpl<$Res, $Val extends RegisterPvzRequest>
    implements $RegisterPvzRequestCopyWith<$Res> {
  _$RegisterPvzRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterPvzRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? city = null,
    Object? files = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? name = null,
    Object? square = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<String>,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      square: null == square
          ? _value.square
          : square // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterPvzRequestImplCopyWith<$Res>
    implements $RegisterPvzRequestCopyWith<$Res> {
  factory _$$RegisterPvzRequestImplCopyWith(_$RegisterPvzRequestImpl value,
          $Res Function(_$RegisterPvzRequestImpl) then) =
      __$$RegisterPvzRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      String city,
      List<String> files,
      double latitude,
      double longitude,
      String name,
      String square});
}

/// @nodoc
class __$$RegisterPvzRequestImplCopyWithImpl<$Res>
    extends _$RegisterPvzRequestCopyWithImpl<$Res, _$RegisterPvzRequestImpl>
    implements _$$RegisterPvzRequestImplCopyWith<$Res> {
  __$$RegisterPvzRequestImplCopyWithImpl(_$RegisterPvzRequestImpl _value,
      $Res Function(_$RegisterPvzRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterPvzRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? city = null,
    Object? files = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? name = null,
    Object? square = null,
  }) {
    return _then(_$RegisterPvzRequestImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<String>,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      square: null == square
          ? _value.square
          : square // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterPvzRequestImpl implements _RegisterPvzRequest {
  const _$RegisterPvzRequestImpl(
      {required this.address,
      required this.city,
      required final List<String> files,
      required this.latitude,
      required this.longitude,
      required this.name,
      required this.square})
      : _files = files;

  factory _$RegisterPvzRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterPvzRequestImplFromJson(json);

  @override
  final String address;
  @override
  final String city;
  final List<String> _files;
  @override
  List<String> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String name;
  @override
  final String square;

  @override
  String toString() {
    return 'RegisterPvzRequest(address: $address, city: $city, files: $files, latitude: $latitude, longitude: $longitude, name: $name, square: $square)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterPvzRequestImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.square, square) || other.square == square));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      city,
      const DeepCollectionEquality().hash(_files),
      latitude,
      longitude,
      name,
      square);

  /// Create a copy of RegisterPvzRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterPvzRequestImplCopyWith<_$RegisterPvzRequestImpl> get copyWith =>
      __$$RegisterPvzRequestImplCopyWithImpl<_$RegisterPvzRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterPvzRequestImplToJson(
      this,
    );
  }
}

abstract class _RegisterPvzRequest implements RegisterPvzRequest {
  const factory _RegisterPvzRequest(
      {required final String address,
      required final String city,
      required final List<String> files,
      required final double latitude,
      required final double longitude,
      required final String name,
      required final String square}) = _$RegisterPvzRequestImpl;

  factory _RegisterPvzRequest.fromJson(Map<String, dynamic> json) =
      _$RegisterPvzRequestImpl.fromJson;

  @override
  String get address;
  @override
  String get city;
  @override
  List<String> get files;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get name;
  @override
  String get square;

  /// Create a copy of RegisterPvzRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterPvzRequestImplCopyWith<_$RegisterPvzRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
