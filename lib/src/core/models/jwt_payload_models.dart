import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt_payload_models.freezed.dart';
part 'jwt_payload_models.g.dart';

/// Model representing a user role within a class
@freezed
class ClassRole with _$ClassRole {
  const factory ClassRole({
    required String title,
    List<int>? children, // For parent role, contains child IDs
  }) = _ClassRole;

  factory ClassRole.fromJson(Map<String, dynamic> json) => _$ClassRoleFromJson(json);
}

/// Model representing a class the user belongs to
@freezed
class UserClass with _$UserClass {
  const factory UserClass({
    required int id,
    required String name,
    required List<ClassRole> roles,
  }) = _UserClass;

  factory UserClass.fromJson(Map<String, dynamic> json) => _$UserClassFromJson(json);
}

/// Model representing a school and user's permissions within it
@freezed
class SchoolPermission with _$SchoolPermission {
  const factory SchoolPermission({
    required int id,
    required String name,
    required bool isServiceAccount,
    required List<String> jobType,
    required List<UserClass> classes,
  }) = _SchoolPermission;

  factory SchoolPermission.fromJson(Map<String, dynamic> json) => _$SchoolPermissionFromJson(json);
}

/// Model representing all user permissions
@freezed
class UserPermissions with _$UserPermissions {
  const factory UserPermissions({
    required List<SchoolPermission> schools,
    required bool isModerator,
  }) = _UserPermissions;

  factory UserPermissions.fromJson(Map<String, dynamic> json) => _$UserPermissionsFromJson(json);
}

/// Complete JWT payload model
@freezed
class JwtPayload with _$JwtPayload {
  const factory JwtPayload({
    required String sub, // User ID
    required bool hasTempPassword,
    required UserPermissions permissions,
    required int exp, // Expiration timestamp
  }) = _JwtPayload;

  factory JwtPayload.fromJson(Map<String, dynamic> json) => _$JwtPayloadFromJson(json);
}

/// Extracted role information for easier use in UI
@freezed
class ExtractedRole with _$ExtractedRole {
  const factory ExtractedRole({
    required String roleTitle,
    required int schoolId,
    required String schoolName,
    required int classId,
    required String className,
    List<int>? childrenIds, // Only for parent role
    List<String>? jobTypes, // Job types available at this school
  }) = _ExtractedRole;

  factory ExtractedRole.fromJson(Map<String, dynamic> json) => _$ExtractedRoleFromJson(json);
}
