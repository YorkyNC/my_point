// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jwt_payload_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClassRole _$ClassRoleFromJson(Map<String, dynamic> json) {
  return _ClassRole.fromJson(json);
}

/// @nodoc
mixin _$ClassRole {
  String get title => throw _privateConstructorUsedError;
  List<int>? get children => throw _privateConstructorUsedError;

  /// Serializes this ClassRole to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClassRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassRoleCopyWith<ClassRole> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassRoleCopyWith<$Res> {
  factory $ClassRoleCopyWith(ClassRole value, $Res Function(ClassRole) then) =
      _$ClassRoleCopyWithImpl<$Res, ClassRole>;
  @useResult
  $Res call({String title, List<int>? children});
}

/// @nodoc
class _$ClassRoleCopyWithImpl<$Res, $Val extends ClassRole>
    implements $ClassRoleCopyWith<$Res> {
  _$ClassRoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassRole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? children = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassRoleImplCopyWith<$Res>
    implements $ClassRoleCopyWith<$Res> {
  factory _$$ClassRoleImplCopyWith(
          _$ClassRoleImpl value, $Res Function(_$ClassRoleImpl) then) =
      __$$ClassRoleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<int>? children});
}

/// @nodoc
class __$$ClassRoleImplCopyWithImpl<$Res>
    extends _$ClassRoleCopyWithImpl<$Res, _$ClassRoleImpl>
    implements _$$ClassRoleImplCopyWith<$Res> {
  __$$ClassRoleImplCopyWithImpl(
      _$ClassRoleImpl _value, $Res Function(_$ClassRoleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClassRole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? children = freezed,
  }) {
    return _then(_$ClassRoleImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassRoleImpl implements _ClassRole {
  const _$ClassRoleImpl({required this.title, final List<int>? children})
      : _children = children;

  factory _$ClassRoleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassRoleImplFromJson(json);

  @override
  final String title;
  final List<int>? _children;
  @override
  List<int>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClassRole(title: $title, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassRoleImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_children));

  /// Create a copy of ClassRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassRoleImplCopyWith<_$ClassRoleImpl> get copyWith =>
      __$$ClassRoleImplCopyWithImpl<_$ClassRoleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassRoleImplToJson(
      this,
    );
  }
}

abstract class _ClassRole implements ClassRole {
  const factory _ClassRole(
      {required final String title,
      final List<int>? children}) = _$ClassRoleImpl;

  factory _ClassRole.fromJson(Map<String, dynamic> json) =
      _$ClassRoleImpl.fromJson;

  @override
  String get title;
  @override
  List<int>? get children;

  /// Create a copy of ClassRole
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassRoleImplCopyWith<_$ClassRoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserClass _$UserClassFromJson(Map<String, dynamic> json) {
  return _UserClass.fromJson(json);
}

/// @nodoc
mixin _$UserClass {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<ClassRole> get roles => throw _privateConstructorUsedError;

  /// Serializes this UserClass to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserClassCopyWith<UserClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserClassCopyWith<$Res> {
  factory $UserClassCopyWith(UserClass value, $Res Function(UserClass) then) =
      _$UserClassCopyWithImpl<$Res, UserClass>;
  @useResult
  $Res call({int id, String name, List<ClassRole> roles});
}

/// @nodoc
class _$UserClassCopyWithImpl<$Res, $Val extends UserClass>
    implements $UserClassCopyWith<$Res> {
  _$UserClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? roles = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<ClassRole>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserClassImplCopyWith<$Res>
    implements $UserClassCopyWith<$Res> {
  factory _$$UserClassImplCopyWith(
          _$UserClassImpl value, $Res Function(_$UserClassImpl) then) =
      __$$UserClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, List<ClassRole> roles});
}

/// @nodoc
class __$$UserClassImplCopyWithImpl<$Res>
    extends _$UserClassCopyWithImpl<$Res, _$UserClassImpl>
    implements _$$UserClassImplCopyWith<$Res> {
  __$$UserClassImplCopyWithImpl(
      _$UserClassImpl _value, $Res Function(_$UserClassImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? roles = null,
  }) {
    return _then(_$UserClassImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      roles: null == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<ClassRole>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserClassImpl implements _UserClass {
  const _$UserClassImpl(
      {required this.id,
      required this.name,
      required final List<ClassRole> roles})
      : _roles = roles;

  factory _$UserClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserClassImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  final List<ClassRole> _roles;
  @override
  List<ClassRole> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  String toString() {
    return 'UserClass(id: $id, name: $name, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserClassImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_roles));

  /// Create a copy of UserClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserClassImplCopyWith<_$UserClassImpl> get copyWith =>
      __$$UserClassImplCopyWithImpl<_$UserClassImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserClassImplToJson(
      this,
    );
  }
}

abstract class _UserClass implements UserClass {
  const factory _UserClass(
      {required final int id,
      required final String name,
      required final List<ClassRole> roles}) = _$UserClassImpl;

  factory _UserClass.fromJson(Map<String, dynamic> json) =
      _$UserClassImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  List<ClassRole> get roles;

  /// Create a copy of UserClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserClassImplCopyWith<_$UserClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SchoolPermission _$SchoolPermissionFromJson(Map<String, dynamic> json) {
  return _SchoolPermission.fromJson(json);
}

/// @nodoc
mixin _$SchoolPermission {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isServiceAccount => throw _privateConstructorUsedError;
  List<String> get jobType => throw _privateConstructorUsedError;
  List<UserClass> get classes => throw _privateConstructorUsedError;

  /// Serializes this SchoolPermission to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SchoolPermission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SchoolPermissionCopyWith<SchoolPermission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolPermissionCopyWith<$Res> {
  factory $SchoolPermissionCopyWith(
          SchoolPermission value, $Res Function(SchoolPermission) then) =
      _$SchoolPermissionCopyWithImpl<$Res, SchoolPermission>;
  @useResult
  $Res call(
      {int id,
      String name,
      bool isServiceAccount,
      List<String> jobType,
      List<UserClass> classes});
}

/// @nodoc
class _$SchoolPermissionCopyWithImpl<$Res, $Val extends SchoolPermission>
    implements $SchoolPermissionCopyWith<$Res> {
  _$SchoolPermissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SchoolPermission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isServiceAccount = null,
    Object? jobType = null,
    Object? classes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isServiceAccount: null == isServiceAccount
          ? _value.isServiceAccount
          : isServiceAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      jobType: null == jobType
          ? _value.jobType
          : jobType // ignore: cast_nullable_to_non_nullable
              as List<String>,
      classes: null == classes
          ? _value.classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<UserClass>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SchoolPermissionImplCopyWith<$Res>
    implements $SchoolPermissionCopyWith<$Res> {
  factory _$$SchoolPermissionImplCopyWith(_$SchoolPermissionImpl value,
          $Res Function(_$SchoolPermissionImpl) then) =
      __$$SchoolPermissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      bool isServiceAccount,
      List<String> jobType,
      List<UserClass> classes});
}

/// @nodoc
class __$$SchoolPermissionImplCopyWithImpl<$Res>
    extends _$SchoolPermissionCopyWithImpl<$Res, _$SchoolPermissionImpl>
    implements _$$SchoolPermissionImplCopyWith<$Res> {
  __$$SchoolPermissionImplCopyWithImpl(_$SchoolPermissionImpl _value,
      $Res Function(_$SchoolPermissionImpl) _then)
      : super(_value, _then);

  /// Create a copy of SchoolPermission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isServiceAccount = null,
    Object? jobType = null,
    Object? classes = null,
  }) {
    return _then(_$SchoolPermissionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isServiceAccount: null == isServiceAccount
          ? _value.isServiceAccount
          : isServiceAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      jobType: null == jobType
          ? _value._jobType
          : jobType // ignore: cast_nullable_to_non_nullable
              as List<String>,
      classes: null == classes
          ? _value._classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<UserClass>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SchoolPermissionImpl implements _SchoolPermission {
  const _$SchoolPermissionImpl(
      {required this.id,
      required this.name,
      required this.isServiceAccount,
      required final List<String> jobType,
      required final List<UserClass> classes})
      : _jobType = jobType,
        _classes = classes;

  factory _$SchoolPermissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SchoolPermissionImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final bool isServiceAccount;
  final List<String> _jobType;
  @override
  List<String> get jobType {
    if (_jobType is EqualUnmodifiableListView) return _jobType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_jobType);
  }

  final List<UserClass> _classes;
  @override
  List<UserClass> get classes {
    if (_classes is EqualUnmodifiableListView) return _classes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_classes);
  }

  @override
  String toString() {
    return 'SchoolPermission(id: $id, name: $name, isServiceAccount: $isServiceAccount, jobType: $jobType, classes: $classes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SchoolPermissionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isServiceAccount, isServiceAccount) ||
                other.isServiceAccount == isServiceAccount) &&
            const DeepCollectionEquality().equals(other._jobType, _jobType) &&
            const DeepCollectionEquality().equals(other._classes, _classes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      isServiceAccount,
      const DeepCollectionEquality().hash(_jobType),
      const DeepCollectionEquality().hash(_classes));

  /// Create a copy of SchoolPermission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SchoolPermissionImplCopyWith<_$SchoolPermissionImpl> get copyWith =>
      __$$SchoolPermissionImplCopyWithImpl<_$SchoolPermissionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SchoolPermissionImplToJson(
      this,
    );
  }
}

abstract class _SchoolPermission implements SchoolPermission {
  const factory _SchoolPermission(
      {required final int id,
      required final String name,
      required final bool isServiceAccount,
      required final List<String> jobType,
      required final List<UserClass> classes}) = _$SchoolPermissionImpl;

  factory _SchoolPermission.fromJson(Map<String, dynamic> json) =
      _$SchoolPermissionImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  bool get isServiceAccount;
  @override
  List<String> get jobType;
  @override
  List<UserClass> get classes;

  /// Create a copy of SchoolPermission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SchoolPermissionImplCopyWith<_$SchoolPermissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPermissions _$UserPermissionsFromJson(Map<String, dynamic> json) {
  return _UserPermissions.fromJson(json);
}

/// @nodoc
mixin _$UserPermissions {
  List<SchoolPermission> get schools => throw _privateConstructorUsedError;
  bool get isModerator => throw _privateConstructorUsedError;

  /// Serializes this UserPermissions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPermissions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPermissionsCopyWith<UserPermissions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPermissionsCopyWith<$Res> {
  factory $UserPermissionsCopyWith(
          UserPermissions value, $Res Function(UserPermissions) then) =
      _$UserPermissionsCopyWithImpl<$Res, UserPermissions>;
  @useResult
  $Res call({List<SchoolPermission> schools, bool isModerator});
}

/// @nodoc
class _$UserPermissionsCopyWithImpl<$Res, $Val extends UserPermissions>
    implements $UserPermissionsCopyWith<$Res> {
  _$UserPermissionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPermissions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schools = null,
    Object? isModerator = null,
  }) {
    return _then(_value.copyWith(
      schools: null == schools
          ? _value.schools
          : schools // ignore: cast_nullable_to_non_nullable
              as List<SchoolPermission>,
      isModerator: null == isModerator
          ? _value.isModerator
          : isModerator // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPermissionsImplCopyWith<$Res>
    implements $UserPermissionsCopyWith<$Res> {
  factory _$$UserPermissionsImplCopyWith(_$UserPermissionsImpl value,
          $Res Function(_$UserPermissionsImpl) then) =
      __$$UserPermissionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SchoolPermission> schools, bool isModerator});
}

/// @nodoc
class __$$UserPermissionsImplCopyWithImpl<$Res>
    extends _$UserPermissionsCopyWithImpl<$Res, _$UserPermissionsImpl>
    implements _$$UserPermissionsImplCopyWith<$Res> {
  __$$UserPermissionsImplCopyWithImpl(
      _$UserPermissionsImpl _value, $Res Function(_$UserPermissionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPermissions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schools = null,
    Object? isModerator = null,
  }) {
    return _then(_$UserPermissionsImpl(
      schools: null == schools
          ? _value._schools
          : schools // ignore: cast_nullable_to_non_nullable
              as List<SchoolPermission>,
      isModerator: null == isModerator
          ? _value.isModerator
          : isModerator // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPermissionsImpl implements _UserPermissions {
  const _$UserPermissionsImpl(
      {required final List<SchoolPermission> schools,
      required this.isModerator})
      : _schools = schools;

  factory _$UserPermissionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPermissionsImplFromJson(json);

  final List<SchoolPermission> _schools;
  @override
  List<SchoolPermission> get schools {
    if (_schools is EqualUnmodifiableListView) return _schools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schools);
  }

  @override
  final bool isModerator;

  @override
  String toString() {
    return 'UserPermissions(schools: $schools, isModerator: $isModerator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPermissionsImpl &&
            const DeepCollectionEquality().equals(other._schools, _schools) &&
            (identical(other.isModerator, isModerator) ||
                other.isModerator == isModerator));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_schools), isModerator);

  /// Create a copy of UserPermissions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPermissionsImplCopyWith<_$UserPermissionsImpl> get copyWith =>
      __$$UserPermissionsImplCopyWithImpl<_$UserPermissionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPermissionsImplToJson(
      this,
    );
  }
}

abstract class _UserPermissions implements UserPermissions {
  const factory _UserPermissions(
      {required final List<SchoolPermission> schools,
      required final bool isModerator}) = _$UserPermissionsImpl;

  factory _UserPermissions.fromJson(Map<String, dynamic> json) =
      _$UserPermissionsImpl.fromJson;

  @override
  List<SchoolPermission> get schools;
  @override
  bool get isModerator;

  /// Create a copy of UserPermissions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPermissionsImplCopyWith<_$UserPermissionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JwtPayload _$JwtPayloadFromJson(Map<String, dynamic> json) {
  return _JwtPayload.fromJson(json);
}

/// @nodoc
mixin _$JwtPayload {
  String get sub => throw _privateConstructorUsedError; // User ID
  bool get hasTempPassword => throw _privateConstructorUsedError;
  UserPermissions get permissions => throw _privateConstructorUsedError;
  int get exp => throw _privateConstructorUsedError;

  /// Serializes this JwtPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JwtPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JwtPayloadCopyWith<JwtPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JwtPayloadCopyWith<$Res> {
  factory $JwtPayloadCopyWith(
          JwtPayload value, $Res Function(JwtPayload) then) =
      _$JwtPayloadCopyWithImpl<$Res, JwtPayload>;
  @useResult
  $Res call(
      {String sub, bool hasTempPassword, UserPermissions permissions, int exp});

  $UserPermissionsCopyWith<$Res> get permissions;
}

/// @nodoc
class _$JwtPayloadCopyWithImpl<$Res, $Val extends JwtPayload>
    implements $JwtPayloadCopyWith<$Res> {
  _$JwtPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JwtPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sub = null,
    Object? hasTempPassword = null,
    Object? permissions = null,
    Object? exp = null,
  }) {
    return _then(_value.copyWith(
      sub: null == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String,
      hasTempPassword: null == hasTempPassword
          ? _value.hasTempPassword
          : hasTempPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as UserPermissions,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of JwtPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPermissionsCopyWith<$Res> get permissions {
    return $UserPermissionsCopyWith<$Res>(_value.permissions, (value) {
      return _then(_value.copyWith(permissions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JwtPayloadImplCopyWith<$Res>
    implements $JwtPayloadCopyWith<$Res> {
  factory _$$JwtPayloadImplCopyWith(
          _$JwtPayloadImpl value, $Res Function(_$JwtPayloadImpl) then) =
      __$$JwtPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sub, bool hasTempPassword, UserPermissions permissions, int exp});

  @override
  $UserPermissionsCopyWith<$Res> get permissions;
}

/// @nodoc
class __$$JwtPayloadImplCopyWithImpl<$Res>
    extends _$JwtPayloadCopyWithImpl<$Res, _$JwtPayloadImpl>
    implements _$$JwtPayloadImplCopyWith<$Res> {
  __$$JwtPayloadImplCopyWithImpl(
      _$JwtPayloadImpl _value, $Res Function(_$JwtPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of JwtPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sub = null,
    Object? hasTempPassword = null,
    Object? permissions = null,
    Object? exp = null,
  }) {
    return _then(_$JwtPayloadImpl(
      sub: null == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String,
      hasTempPassword: null == hasTempPassword
          ? _value.hasTempPassword
          : hasTempPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as UserPermissions,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JwtPayloadImpl implements _JwtPayload {
  const _$JwtPayloadImpl(
      {required this.sub,
      required this.hasTempPassword,
      required this.permissions,
      required this.exp});

  factory _$JwtPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$JwtPayloadImplFromJson(json);

  @override
  final String sub;
// User ID
  @override
  final bool hasTempPassword;
  @override
  final UserPermissions permissions;
  @override
  final int exp;

  @override
  String toString() {
    return 'JwtPayload(sub: $sub, hasTempPassword: $hasTempPassword, permissions: $permissions, exp: $exp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JwtPayloadImpl &&
            (identical(other.sub, sub) || other.sub == sub) &&
            (identical(other.hasTempPassword, hasTempPassword) ||
                other.hasTempPassword == hasTempPassword) &&
            (identical(other.permissions, permissions) ||
                other.permissions == permissions) &&
            (identical(other.exp, exp) || other.exp == exp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sub, hasTempPassword, permissions, exp);

  /// Create a copy of JwtPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JwtPayloadImplCopyWith<_$JwtPayloadImpl> get copyWith =>
      __$$JwtPayloadImplCopyWithImpl<_$JwtPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JwtPayloadImplToJson(
      this,
    );
  }
}

abstract class _JwtPayload implements JwtPayload {
  const factory _JwtPayload(
      {required final String sub,
      required final bool hasTempPassword,
      required final UserPermissions permissions,
      required final int exp}) = _$JwtPayloadImpl;

  factory _JwtPayload.fromJson(Map<String, dynamic> json) =
      _$JwtPayloadImpl.fromJson;

  @override
  String get sub; // User ID
  @override
  bool get hasTempPassword;
  @override
  UserPermissions get permissions;
  @override
  int get exp;

  /// Create a copy of JwtPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JwtPayloadImplCopyWith<_$JwtPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtractedRole _$ExtractedRoleFromJson(Map<String, dynamic> json) {
  return _ExtractedRole.fromJson(json);
}

/// @nodoc
mixin _$ExtractedRole {
  String get roleTitle => throw _privateConstructorUsedError;
  int get schoolId => throw _privateConstructorUsedError;
  String get schoolName => throw _privateConstructorUsedError;
  int get classId => throw _privateConstructorUsedError;
  String get className => throw _privateConstructorUsedError;
  List<int>? get childrenIds =>
      throw _privateConstructorUsedError; // Only for parent role
  List<String>? get jobTypes => throw _privateConstructorUsedError;

  /// Serializes this ExtractedRole to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtractedRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtractedRoleCopyWith<ExtractedRole> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtractedRoleCopyWith<$Res> {
  factory $ExtractedRoleCopyWith(
          ExtractedRole value, $Res Function(ExtractedRole) then) =
      _$ExtractedRoleCopyWithImpl<$Res, ExtractedRole>;
  @useResult
  $Res call(
      {String roleTitle,
      int schoolId,
      String schoolName,
      int classId,
      String className,
      List<int>? childrenIds,
      List<String>? jobTypes});
}

/// @nodoc
class _$ExtractedRoleCopyWithImpl<$Res, $Val extends ExtractedRole>
    implements $ExtractedRoleCopyWith<$Res> {
  _$ExtractedRoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtractedRole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleTitle = null,
    Object? schoolId = null,
    Object? schoolName = null,
    Object? classId = null,
    Object? className = null,
    Object? childrenIds = freezed,
    Object? jobTypes = freezed,
  }) {
    return _then(_value.copyWith(
      roleTitle: null == roleTitle
          ? _value.roleTitle
          : roleTitle // ignore: cast_nullable_to_non_nullable
              as String,
      schoolId: null == schoolId
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as int,
      schoolName: null == schoolName
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String,
      classId: null == classId
          ? _value.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as int,
      className: null == className
          ? _value.className
          : className // ignore: cast_nullable_to_non_nullable
              as String,
      childrenIds: freezed == childrenIds
          ? _value.childrenIds
          : childrenIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      jobTypes: freezed == jobTypes
          ? _value.jobTypes
          : jobTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExtractedRoleImplCopyWith<$Res>
    implements $ExtractedRoleCopyWith<$Res> {
  factory _$$ExtractedRoleImplCopyWith(
          _$ExtractedRoleImpl value, $Res Function(_$ExtractedRoleImpl) then) =
      __$$ExtractedRoleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String roleTitle,
      int schoolId,
      String schoolName,
      int classId,
      String className,
      List<int>? childrenIds,
      List<String>? jobTypes});
}

/// @nodoc
class __$$ExtractedRoleImplCopyWithImpl<$Res>
    extends _$ExtractedRoleCopyWithImpl<$Res, _$ExtractedRoleImpl>
    implements _$$ExtractedRoleImplCopyWith<$Res> {
  __$$ExtractedRoleImplCopyWithImpl(
      _$ExtractedRoleImpl _value, $Res Function(_$ExtractedRoleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExtractedRole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleTitle = null,
    Object? schoolId = null,
    Object? schoolName = null,
    Object? classId = null,
    Object? className = null,
    Object? childrenIds = freezed,
    Object? jobTypes = freezed,
  }) {
    return _then(_$ExtractedRoleImpl(
      roleTitle: null == roleTitle
          ? _value.roleTitle
          : roleTitle // ignore: cast_nullable_to_non_nullable
              as String,
      schoolId: null == schoolId
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as int,
      schoolName: null == schoolName
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String,
      classId: null == classId
          ? _value.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as int,
      className: null == className
          ? _value.className
          : className // ignore: cast_nullable_to_non_nullable
              as String,
      childrenIds: freezed == childrenIds
          ? _value._childrenIds
          : childrenIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      jobTypes: freezed == jobTypes
          ? _value._jobTypes
          : jobTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtractedRoleImpl implements _ExtractedRole {
  const _$ExtractedRoleImpl(
      {required this.roleTitle,
      required this.schoolId,
      required this.schoolName,
      required this.classId,
      required this.className,
      final List<int>? childrenIds,
      final List<String>? jobTypes})
      : _childrenIds = childrenIds,
        _jobTypes = jobTypes;

  factory _$ExtractedRoleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtractedRoleImplFromJson(json);

  @override
  final String roleTitle;
  @override
  final int schoolId;
  @override
  final String schoolName;
  @override
  final int classId;
  @override
  final String className;
  final List<int>? _childrenIds;
  @override
  List<int>? get childrenIds {
    final value = _childrenIds;
    if (value == null) return null;
    if (_childrenIds is EqualUnmodifiableListView) return _childrenIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Only for parent role
  final List<String>? _jobTypes;
// Only for parent role
  @override
  List<String>? get jobTypes {
    final value = _jobTypes;
    if (value == null) return null;
    if (_jobTypes is EqualUnmodifiableListView) return _jobTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ExtractedRole(roleTitle: $roleTitle, schoolId: $schoolId, schoolName: $schoolName, classId: $classId, className: $className, childrenIds: $childrenIds, jobTypes: $jobTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtractedRoleImpl &&
            (identical(other.roleTitle, roleTitle) ||
                other.roleTitle == roleTitle) &&
            (identical(other.schoolId, schoolId) ||
                other.schoolId == schoolId) &&
            (identical(other.schoolName, schoolName) ||
                other.schoolName == schoolName) &&
            (identical(other.classId, classId) || other.classId == classId) &&
            (identical(other.className, className) ||
                other.className == className) &&
            const DeepCollectionEquality()
                .equals(other._childrenIds, _childrenIds) &&
            const DeepCollectionEquality().equals(other._jobTypes, _jobTypes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      roleTitle,
      schoolId,
      schoolName,
      classId,
      className,
      const DeepCollectionEquality().hash(_childrenIds),
      const DeepCollectionEquality().hash(_jobTypes));

  /// Create a copy of ExtractedRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtractedRoleImplCopyWith<_$ExtractedRoleImpl> get copyWith =>
      __$$ExtractedRoleImplCopyWithImpl<_$ExtractedRoleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtractedRoleImplToJson(
      this,
    );
  }
}

abstract class _ExtractedRole implements ExtractedRole {
  const factory _ExtractedRole(
      {required final String roleTitle,
      required final int schoolId,
      required final String schoolName,
      required final int classId,
      required final String className,
      final List<int>? childrenIds,
      final List<String>? jobTypes}) = _$ExtractedRoleImpl;

  factory _ExtractedRole.fromJson(Map<String, dynamic> json) =
      _$ExtractedRoleImpl.fromJson;

  @override
  String get roleTitle;
  @override
  int get schoolId;
  @override
  String get schoolName;
  @override
  int get classId;
  @override
  String get className;
  @override
  List<int>? get childrenIds; // Only for parent role
  @override
  List<String>? get jobTypes;

  /// Create a copy of ExtractedRole
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtractedRoleImplCopyWith<_$ExtractedRoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
