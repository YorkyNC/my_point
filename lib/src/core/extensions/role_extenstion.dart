import 'package:flutter/material.dart';

import 'build_context_extension.dart';

extension RoleExtenstion on String {
  String getRoleText(BuildContext context) {
    // Normalize the role name to lowercase for consistent comparison
    final normalizedRole = toLowerCase();

    switch (normalizedRole) {
      case 'parent':
        return context.loc.parent;
      case 'teacher':
        return context.loc.teacher;
      case 'classroomteacher':
        return 'Классный руководитель';
      case 'psychologist':
        return context.loc.psychologist;
      case 'admin':
        return context.loc.teacher;
      default:
        return '';
    }
  }
}
