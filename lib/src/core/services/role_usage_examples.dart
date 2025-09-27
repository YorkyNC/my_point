/// Example usage patterns for the role-based system
///
/// This file demonstrates how to use the RoleExtractionService and RoleBasedNavigation
/// to implement role-based features in your Flutter app.
library;

import '../navigation/role_based_navigation.dart';
import '../services/role_extraction_service.dart';
import '../utils/token_utils.dart';

class RoleUsageExamples {
  /// Example: Basic role checking
  static void exampleBasicRoleChecking(String token) {
    // Check if user has specific roles
    if (RoleExtractionService.hasRole(token, 'parent')) {
      print('User is a parent');
    }

    if (RoleExtractionService.hasRole(token, 'teacher')) {
      print('User is a teacher');
    }

    if (RoleExtractionService.hasRole(token, 'classroomTeacher')) {
      print('User is a classroom teacher');
    }

    // Get all roles
    final roles = RoleExtractionService.getUserRoles(token);
    print('User roles: $roles');

    // Get primary role for UI display
    final primaryRole = RoleExtractionService.getPrimaryRole(token);
    print('Primary role: $primaryRole');
  }

  /// Example: Parent-specific functionality
  static void exampleParentFunctionality(String token) {
    // Get all parent roles (user might be parent in multiple classes)
    final parentRoles = RoleExtractionService.getParentRoles(token);

    for (final role in parentRoles) {
      print('Parent in class: ${role.className} (ID: ${role.classId})');
      print('Children IDs: ${role.childrenIds}');
      print('School: ${role.schoolName}');
    }

    // Get all children IDs across all classes
    final allChildrenIds = RoleExtractionService.getChildrenIds(token);
    print('All children IDs: $allChildrenIds');
  }

  /// Example: Teacher-specific functionality
  static void exampleTeacherFunctionality(String token) {
    // Get all teaching roles
    final teacherRoles = RoleExtractionService.getTeacherRoles(token);

    for (final role in teacherRoles) {
      print('Teaching role: ${role.roleTitle}');
      print('Class: ${role.className} (ID: ${role.classId})');
      print('School: ${role.schoolName}');
      print('Job types: ${role.jobTypes}');
    }

    // Check access to specific classes
    final classIds = RoleExtractionService.getClassIds(token);
    for (final classId in classIds) {
      if (RoleExtractionService.canAccessClass(token, classId)) {
        print('Can access class $classId');
      }
    }
  }

  /// Example: Navigation based on roles
  static void exampleRoleBasedNavigation(String token) {
    // Get default screen for user's primary role
    final defaultScreen = RoleBasedNavigation.getDefaultScreen(token);
    print('Default screen: $defaultScreen');

    // Check if user can access specific screens
    if (RoleBasedNavigation.canAccessScreen(token, AppScreen.parentView)) {
      print('User can access parent view');
    }

    if (RoleBasedNavigation.canAccessScreen(token, AppScreen.teacherTools)) {
      print('User can access teacher tools');
    }

    if (RoleBasedNavigation.canAccessScreen(token, AppScreen.moderatorPanel)) {
      print('User can access moderator panel');
    }

    // Get all allowed screens
    final allowedScreens = RoleBasedNavigation.getAllowedScreens(token);
    print('Allowed screens: $allowedScreens');

    // Get screens grouped by role
    final screensByRole = RoleBasedNavigation.getScreensByRole(token);
    for (final entry in screensByRole.entries) {
      print('Role ${entry.key}: ${entry.value}');
    }
  }

  /// Example: Context-aware navigation
  static void exampleContextualNavigation(String token) {
    // User selects "parent" role for class ID 3
    final context = RoleBasedNavigation.getNavigationContext(
      token: token,
      selectedRole: 'parent',
      selectedClassId: 3,
    );

    print('Selected role: ${context.selectedRole}');
    print('Selected class: ${context.selectedClassId}');
    print('Children in this class: ${context.getChildrenIds()}');
    print('Available classes: ${context.getClassNames()}');
    print('Schools: ${context.getSchoolNames()}');
    print('Allowed screens: ${context.allowedScreens}');

    // Validate role selection
    final isValid =
        RoleBasedNavigation.isValidRoleSelection(token, 'parent', 3);
    print('Role selection valid: $isValid');
  }

  /// Example: Complete role-based UI flow
  static Map<String, dynamic> exampleUIFlow(String token) {
    // 1. Parse JWT payload
    final payload = RoleExtractionService.parseJwtPayload(token);
    if (payload == null) {
      return {'error': 'Invalid token'};
    }

    // 2. Check for temporary password
    if (RoleExtractionService.hasTempPassword(token)) {
      return {
        'screen': 'change_password',
        'message': 'Please change your temporary password'
      };
    }

    // 3. Get all user roles
    final roles = RoleExtractionService.extractAllRoles(token);

    // 4. If user has only one role in one class, auto-select it
    if (roles.length == 1) {
      final role = roles.first;
      final context = RoleBasedNavigation.getNavigationContext(
        token: token,
        selectedRole: role.roleTitle,
        selectedClassId: role.classId,
      );

      return {
        'screen': context.defaultScreen.toString(),
        'role': role.roleTitle,
        'classId': role.classId,
        'className': role.className,
        'schoolName': role.schoolName,
        'childrenIds': role.childrenIds,
      };
    }

    // 5. If user has multiple roles, show role selection
    final roleOptions = <Map<String, dynamic>>[];
    for (final role in roles) {
      roleOptions.add({
        'roleTitle': role.roleTitle,
        'classId': role.classId,
        'className': role.className,
        'schoolName': role.schoolName,
        'childrenIds': role.childrenIds,
      });
    }

    return {
      'screen': 'role_selection',
      'roleOptions': roleOptions,
      'primaryRole': RoleExtractionService.getPrimaryRole(token),
    };
  }

  /// Example: Security checks
  static Map<String, bool> exampleSecurityChecks(
      String token, int requestedClassId) {
    return {
      'canAccessClass':
          RoleExtractionService.canAccessClass(token, requestedClassId),
      'isModerator': RoleExtractionService.isModerator(token),
      'hasParentAccess': RoleExtractionService.hasRole(token, 'parent'),
      'hasTeacherAccess': RoleExtractionService.hasRole(token, 'teacher') ||
          RoleExtractionService.hasRole(token, 'classroomTeacher'),
      'tokenValid': !TokenUtils.isTokenExpired(token),
    };
  }
}

/// Example BLoC/Cubit for managing role selection in UI
class RoleSelectionExample {
  String? _selectedRole;
  int? _selectedClassId;
  late String _token;

  void initialize(String token) {
    _token = token;

    // Auto-select if user has only one role
    final roles = RoleExtractionService.extractAllRoles(token);
    if (roles.length == 1) {
      _selectedRole = roles.first.roleTitle;
      _selectedClassId = roles.first.classId;
    }
  }

  void selectRole(String roleTitle, int classId) {
    // Validate selection
    if (RoleBasedNavigation.isValidRoleSelection(_token, roleTitle, classId)) {
      _selectedRole = roleTitle;
      _selectedClassId = classId;

      // Navigate to appropriate screen
      final context = RoleBasedNavigation.getNavigationContext(
        token: _token,
        selectedRole: roleTitle,
        selectedClassId: classId,
      );

      // Use context.defaultScreen for navigation
      print('Navigating to: ${context.defaultScreen}');
    }
  }

  NavigationContext? getCurrentContext() {
    if (_selectedRole == null) return null;

    return RoleBasedNavigation.getNavigationContext(
      token: _token,
      selectedRole: _selectedRole!,
      selectedClassId: _selectedClassId,
    );
  }
}
