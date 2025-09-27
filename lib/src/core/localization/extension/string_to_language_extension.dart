import 'package:my_point/src/core/localization/enum/app_language.dart';

extension StringToLanguageExtension on String {
  AppLanguage? toAppLanguage() {
    for (AppLanguage language in AppLanguage.values) {
      if (language.code == this) {
        return language;
      }
    }
    return null;
  }
}
