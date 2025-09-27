// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_payload_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassRoleImpl _$$ClassRoleImplFromJson(Map<String, dynamic> json) =>
    _$ClassRoleImpl(
      title: json['title'] as String,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$ClassRoleImplToJson(_$ClassRoleImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      if (instance.children case final value?) 'children': value,
    };

_$UserClassImpl _$$UserClassImplFromJson(Map<String, dynamic> json) =>
    _$UserClassImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      roles: (json['roles'] as List<dynamic>)
          .map((e) => ClassRole.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserClassImplToJson(_$UserClassImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'roles': instance.roles,
    };

_$SchoolPermissionImpl _$$SchoolPermissionImplFromJson(
        Map<String, dynamic> json) =>
    _$SchoolPermissionImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      isServiceAccount: json['isServiceAccount'] as bool,
      jobType:
          (json['jobType'] as List<dynamic>).map((e) => e as String).toList(),
      classes: (json['classes'] as List<dynamic>)
          .map((e) => UserClass.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SchoolPermissionImplToJson(
        _$SchoolPermissionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isServiceAccount': instance.isServiceAccount,
      'jobType': instance.jobType,
      'classes': instance.classes,
    };

_$UserPermissionsImpl _$$UserPermissionsImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPermissionsImpl(
      schools: (json['schools'] as List<dynamic>)
          .map((e) => SchoolPermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      isModerator: json['isModerator'] as bool,
    );

Map<String, dynamic> _$$UserPermissionsImplToJson(
        _$UserPermissionsImpl instance) =>
    <String, dynamic>{
      'schools': instance.schools,
      'isModerator': instance.isModerator,
    };

_$JwtPayloadImpl _$$JwtPayloadImplFromJson(Map<String, dynamic> json) =>
    _$JwtPayloadImpl(
      sub: json['sub'] as String,
      hasTempPassword: json['hasTempPassword'] as bool,
      permissions:
          UserPermissions.fromJson(json['permissions'] as Map<String, dynamic>),
      exp: (json['exp'] as num).toInt(),
    );

Map<String, dynamic> _$$JwtPayloadImplToJson(_$JwtPayloadImpl instance) =>
    <String, dynamic>{
      'sub': instance.sub,
      'hasTempPassword': instance.hasTempPassword,
      'permissions': instance.permissions,
      'exp': instance.exp,
    };

_$ExtractedRoleImpl _$$ExtractedRoleImplFromJson(Map<String, dynamic> json) =>
    _$ExtractedRoleImpl(
      roleTitle: json['roleTitle'] as String,
      schoolId: (json['schoolId'] as num).toInt(),
      schoolName: json['schoolName'] as String,
      classId: (json['classId'] as num).toInt(),
      className: json['className'] as String,
      childrenIds: (json['childrenIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      jobTypes: (json['jobTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ExtractedRoleImplToJson(_$ExtractedRoleImpl instance) =>
    <String, dynamic>{
      'roleTitle': instance.roleTitle,
      'schoolId': instance.schoolId,
      'schoolName': instance.schoolName,
      'classId': instance.classId,
      'className': instance.className,
      if (instance.childrenIds case final value?) 'childrenIds': value,
      if (instance.jobTypes case final value?) 'jobTypes': value,
    };
