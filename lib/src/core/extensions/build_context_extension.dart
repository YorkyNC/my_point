import 'package:flutter/material.dart';
import 'package:my_point/src/core/localization/enum/app_language.dart';
import 'package:my_point/src/core/localization/extension/string_to_language_extension.dart';

import '../../../gen/assets.gen.dart';
import '../localization/generated/l10n.dart';
import '../theme/colors.dart';
import '../theme/theme.dart';
import '../theme/typography.dart';
import '../utils/constants/app_icons.dart';

extension BuildContextExtension on BuildContext {
  S get loc => S.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  bool get userGestureInProgress => Navigator.of(this).userGestureInProgress;

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;

  double get bottomViewInset => MediaQuery.of(this).viewInsets.bottom;

  $AssetsAppImagesGen get assetImages => Assets.appImages;

  $AssetsIconsGen get assetIcons => Assets.icons;

  AppColors get colors => AppTheme.colors;

  AppTextStyles get typography => AppTheme.typography;

  AppIcons get icons => AppTheme.icons;

  AppLanguage get currentLanguage {
    final currentCode = Localizations.localeOf(this).languageCode;
    return currentCode.toAppLanguage() ?? AppLanguage.russian;
  }
}
