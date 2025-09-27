import 'package:flutter/material.dart';
import 'package:my_point/src/core/localization/enum/app_language.dart';

extension AppLanguageExtension on AppLanguage {
  /// Get localized language name
  String getDisplayName(BuildContext context) {
    switch (this) {
      case AppLanguage.english:
        return 'English';
      case AppLanguage.russian:
        return 'Русский';
      case AppLanguage.kazakh:
        return 'Қазақша';
    }
  }

  String get nativeName {
    switch (this) {
      case AppLanguage.english:
        return 'English';
      case AppLanguage.russian:
        return 'Русский';
      case AppLanguage.kazakh:
        return 'Қазақша';
    }
  }

  bool isCurrent(String currentLanguageCode) {
    return code == currentLanguageCode;
  }
}
