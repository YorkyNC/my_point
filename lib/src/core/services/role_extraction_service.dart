import '../../../main.dart';
import '../models/jwt_payload_models.dart';
import '../utils/token_utils.dart';

/// Service for extracting and managing role-based information from JWT tokens
class RoleExtractionService {
  RoleExtractionService._(); // Private constructor to prevent instantiation

  /// Parses the complete JWT payload into structured models
  ///
  /// [token] The JWT token
  /// Returns a [JwtPayload] object or null if parsing failed
  static JwtPayload? parseJwtPayload(String token) {
    try {
      final payload = TokenUtils.parseTokenPayload(token);
      if (payload.isEmpty) return null;

      return JwtPayload.fromJson(payload);
    } catch (e) {
      log.e('Error parsing JWT payload: $e');
      return null;
    }
  }

  /// Extracts all roles the user has across all schools and classes
  ///
  /// [token] The JWT token
  /// Returns a list of [ExtractedRole] objects
  static List<ExtractedRole> extractAllRoles(String token) {
    final payload = parseJwtPayload(token);
    if (payload == null) return [];

    final List<ExtractedRole> roles = [];

    for (final school in payload.permissions.schools) {
      for (final userClass in school.classes) {
        for (final role in userClass.roles) {
          roles.add(ExtractedRole(
            roleTitle: role.title,
            schoolId: school.id,
            schoolName: school.name,
            classId: userClass.id,
            className: userClass.name,
            childrenIds: role.children,
            jobTypes: school.jobType,
          ));
        }
      }
    }

    return roles;
  }

  /// Gets all unique role titles the user has
  ///
  /// [token] The JWT token
  /// Returns a list of unique role titles
  static List<String> getUserRoles(String token) {
    final roles = extractAllRoles(token);
    return roles.map((role) => role.roleTitle).toSet().toList();
  }

  /// Checks if user has a specific role
  ///
  /// [token] The JWT token
  /// [roleTitle] The role to check for (e.g., 'parent', 'teacher', 'classroomTeacher')
  /// Returns true if user has the specified role
  static bool hasRole(String token, String roleTitle) {
    return getUserRoles(token).contains(roleTitle);
  }

  /// Gets all roles for a specific school
  ///
  /// [token] The JWT token
  /// [schoolId] The school ID to filter by
  /// Returns a list of [ExtractedRole] objects for the specified school
  static List<ExtractedRole> getRolesForSchool(String token, int schoolId) {
    final roles = extractAllRoles(token);
    return roles.where((role) => role.schoolId == schoolId).toList();
  }

  /// Gets all roles for a specific class
  ///
  /// [token] The JWT token
  /// [classId] The class ID to filter by
  /// Returns a list of [ExtractedRole] objects for the specified class
  static List<ExtractedRole> getRolesForClass(String token, int classId) {
    final roles = extractAllRoles(token);
    return roles.where((role) => role.classId == classId).toList();
  }

  /// Gets parent roles with their associated children
  ///
  /// [token] The JWT token
  /// Returns a list of [ExtractedRole] objects where roleTitle is 'parent'
  static List<ExtractedRole> getParentRoles(String token) {
    final roles = extractAllRoles(token);
    return roles.where((role) => role.roleTitle == 'parent').toList();
  }

  /// Gets teacher/classroom teacher roles
  ///
  /// [token] The JWT token
  /// Returns a list of [ExtractedRole] objects for teaching roles
  static List<ExtractedRole> getTeacherRoles(String token) {
    final roles = extractAllRoles(token);
    return roles
        .where((role) =>
            role.roleTitle == 'teacher' || role.roleTitle == 'classroomTeacher')
        .toList();
  }

  /// Gets all children IDs for parent roles
  ///
  /// [token] The JWT token
  /// Returns a list of child IDs the user is parent of
  static List<int> getChildrenIds(String token) {
    final parentRoles = getParentRoles(token);
    final Set<int> childrenIds = {};

    for (final role in parentRoles) {
      if (role.childrenIds != null) {
        childrenIds.addAll(role.childrenIds!);
      }
    }

    return childrenIds.toList();
  }

  /// Gets all class IDs the user has any role in
  ///
  /// [token] The JWT token
  /// Returns a list of class IDs
  static List<int> getClassIds(String token) {
    final roles = extractAllRoles(token);
    return roles.map((role) => role.classId).toSet().toList();
  }

  /// Gets all school IDs the user has any role in
  ///
  /// [token] The JWT token
  /// Returns a list of school IDs
  static List<int> getSchoolIds(String token) {
    final roles = extractAllRoles(token);
    return roles.map((role) => role.schoolId).toSet().toList();
  }

  /// Checks if user can access a specific class based on their roles
  ///
  /// [token] The JWT token
  /// [classId] The class ID to check access for
  /// Returns true if user has any role in the specified class
  static bool canAccessClass(String token, int classId) {
    return getClassIds(token).contains(classId);
  }

  /// Checks if user can access a specific school based on their roles
  ///
  /// [token] The JWT token
  /// [schoolId] The school ID to check access for
  /// Returns true if user has any role in the specified school
  static bool canAccessSchool(String token, int schoolId) {
    return getSchoolIds(token).contains(schoolId);
  }

  /// Gets the primary role for display purposes
  /// Priority: classroomTeacher > teacher > psychologist > parent
  ///
  /// [token] The JWT token
  /// Returns the primary role title or null if no roles found
  static String? getPrimaryRole(String token) {
    final roles = getUserRoles(token);
    if (roles.isEmpty) return null;

    // Define role priority
    const rolePriority = [
      'classroomTeacher',
      'teacher',
      'psychologist',
      'parent',
    ];

    for (final priority in rolePriority) {
      if (roles.contains(priority)) {
        return priority;
      }
    }

    // Return first role if none match priority
    return roles.first;
  }

  /// Checks if user is a moderator
  ///
  /// [token] The JWT token
  /// Returns true if user has moderator privileges
  static bool isModerator(String token) {
    final payload = parseJwtPayload(token);
    return payload?.permissions.isModerator ?? false;
  }

  /// Gets user ID from token
  ///
  /// [token] The JWT token
  /// Returns the user ID or null if not found
  static String? getUserId(String token) {
    final payload = parseJwtPayload(token);
    return payload?.sub;
  }

  /// Checks if user has temporary password
  ///
  /// [token] The JWT token
  /// Returns true if user has a temporary password
  static bool hasTempPassword(String token) {
    final payload = parseJwtPayload(token);
    return payload?.hasTempPassword ?? false;
  }
}
