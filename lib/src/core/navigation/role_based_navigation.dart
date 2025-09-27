import '../models/jwt_payload_models.dart';
import '../services/role_extraction_service.dart';

/// Enumeration of available screens/pages in the app
enum AppScreen {
  dashboard,
  studentList,
  parentView,
  teacherTools,
  classroomManagement,
  psychologistTools,
  moderatorPanel,
  profile,
  settings,
  likes,
  comments,
  posts,
  notifications,
}

/// Configuration for role-based screen access
class RoleScreenConfig {
  final String roleName;
  final List<AppScreen> allowedScreens;
  final AppScreen defaultScreen;

  const RoleScreenConfig({
    required this.roleName,
    required this.allowedScreens,
    required this.defaultScreen,
  });
}

/// Service for managing role-based navigation and screen access control
class RoleBasedNavigation {
  RoleBasedNavigation._(); // Private constructor

  /// Screen configurations for each role
  static const Map<String, RoleScreenConfig> _roleConfigs = {
    'parent': RoleScreenConfig(
      roleName: 'parent',
      allowedScreens: [
        AppScreen.dashboard,
        AppScreen.parentView,
        AppScreen.profile,
        AppScreen.settings,
        AppScreen.likes,
        AppScreen.comments,
        AppScreen.posts,
        AppScreen.notifications,
      ],
      defaultScreen: AppScreen.parentView,
    ),
    'teacher': RoleScreenConfig(
      roleName: 'teacher',
      allowedScreens: [
        AppScreen.dashboard,
        AppScreen.studentList,
        AppScreen.teacherTools,
        AppScreen.profile,
        AppScreen.settings,
        AppScreen.likes,
        AppScreen.comments,
        AppScreen.posts,
        AppScreen.notifications,
      ],
      defaultScreen: AppScreen.teacherTools,
    ),
    'classroomTeacher': RoleScreenConfig(
      roleName: 'classroomTeacher',
      allowedScreens: [
        AppScreen.dashboard,
        AppScreen.studentList,
        AppScreen.teacherTools,
        AppScreen.classroomManagement,
        AppScreen.profile,
        AppScreen.settings,
        AppScreen.likes,
        AppScreen.comments,
        AppScreen.posts,
        AppScreen.notifications,
      ],
      defaultScreen: AppScreen.classroomManagement,
    ),
    'psychologist': RoleScreenConfig(
      roleName: 'psychologist',
      allowedScreens: [
        AppScreen.dashboard,
        AppScreen.studentList,
        AppScreen.psychologistTools,
        AppScreen.profile,
        AppScreen.settings,
        AppScreen.likes,
        AppScreen.comments,
        AppScreen.posts,
        AppScreen.notifications,
      ],
      defaultScreen: AppScreen.psychologistTools,
    ),
  };

  /// Gets the screen configuration for a specific role
  ///
  /// [roleTitle] The role title (e.g., 'parent', 'teacher')
  /// Returns [RoleScreenConfig] or null if role not found
  static RoleScreenConfig? getConfigForRole(String roleTitle) {
    return _roleConfigs[roleTitle];
  }

  /// Gets all allowed screens for a user based on their JWT token
  ///
  /// [token] The JWT token
  /// Returns a set of allowed [AppScreen] values
  static Set<AppScreen> getAllowedScreens(String token) {
    final userRoles = RoleExtractionService.getUserRoles(token);
    final Set<AppScreen> allowedScreens = {};

    // Add screens for each role the user has
    for (final role in userRoles) {
      final config = getConfigForRole(role);
      if (config != null) {
        allowedScreens.addAll(config.allowedScreens);
      }
    }

    // Add moderator screens if user is moderator
    if (RoleExtractionService.isModerator(token)) {
      allowedScreens.add(AppScreen.moderatorPanel);
    }

    return allowedScreens;
  }

  /// Checks if a user can access a specific screen
  ///
  /// [token] The JWT token
  /// [screen] The screen to check access for
  /// Returns true if user can access the screen
  static bool canAccessScreen(String token, AppScreen screen) {
    return getAllowedScreens(token).contains(screen);
  }

  /// Gets the default screen for a user based on their primary role
  ///
  /// [token] The JWT token
  /// Returns the default [AppScreen] or [AppScreen.dashboard] if no specific default
  static AppScreen getDefaultScreen(String token) {
    final primaryRole = RoleExtractionService.getPrimaryRole(token);

    if (primaryRole != null) {
      final config = getConfigForRole(primaryRole);
      if (config != null) {
        return config.defaultScreen;
      }
    }

    return AppScreen.dashboard;
  }

  /// Gets available screens grouped by role for UI display
  ///
  /// [token] The JWT token
  /// Returns a map of role names to their allowed screens
  static Map<String, List<AppScreen>> getScreensByRole(String token) {
    final userRoles = RoleExtractionService.getUserRoles(token);
    final Map<String, List<AppScreen>> screensByRole = {};

    for (final role in userRoles) {
      final config = getConfigForRole(role);
      if (config != null) {
        screensByRole[role] = config.allowedScreens;
      }
    }

    return screensByRole;
  }

  /// Gets contextual information for navigation based on user's current role selection
  ///
  /// [token] The JWT token
  /// [selectedRole] The currently selected role
  /// [selectedClassId] The currently selected class ID (optional)
  /// Returns contextual navigation info
  static NavigationContext getNavigationContext({
    required String token,
    required String selectedRole,
    int? selectedClassId,
  }) {
    final extractedRoles = RoleExtractionService.extractAllRoles(token);
    final roleSpecificInfo = extractedRoles.where((role) => role.roleTitle == selectedRole).toList();

    // Filter by class if specified
    if (selectedClassId != null) {
      roleSpecificInfo.removeWhere((role) => role.classId != selectedClassId);
    }

    return NavigationContext(
      selectedRole: selectedRole,
      selectedClassId: selectedClassId,
      availableClasses: roleSpecificInfo,
      allowedScreens: getAllowedScreens(token),
      defaultScreen: getDefaultScreen(token),
    );
  }

  /// Validates if a role selection is valid for the user
  ///
  /// [token] The JWT token
  /// [roleTitle] The role to validate
  /// [classId] The class ID to validate (optional)
  /// Returns true if the role selection is valid
  static bool isValidRoleSelection(String token, String roleTitle, [int? classId]) {
    final extractedRoles = RoleExtractionService.extractAllRoles(token);

    return extractedRoles.any((role) => role.roleTitle == roleTitle && (classId == null || role.classId == classId));
  }
}

/// Context information for navigation
class NavigationContext {
  final String selectedRole;
  final int? selectedClassId;
  final List<ExtractedRole> availableClasses;
  final Set<AppScreen> allowedScreens;
  final AppScreen defaultScreen;

  const NavigationContext({
    required this.selectedRole,
    this.selectedClassId,
    required this.availableClasses,
    required this.allowedScreens,
    required this.defaultScreen,
  });

  /// Gets children IDs if the selected role is parent
  List<int> getChildrenIds() {
    if (selectedRole != 'parent') return [];

    final Set<int> childrenIds = {};
    for (final role in availableClasses) {
      if (role.childrenIds != null) {
        childrenIds.addAll(role.childrenIds!);
      }
    }
    return childrenIds.toList();
  }

  /// Gets available class names for the selected role
  List<String> getClassNames() {
    return availableClasses.map((role) => role.className).toSet().toList();
  }

  /// Gets school information for the selected role
  List<String> getSchoolNames() {
    return availableClasses.map((role) => role.schoolName).toSet().toList();
  }
}
