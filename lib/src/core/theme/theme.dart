import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/app_icons.dart';
import 'colors.dart';
import 'typography.dart';

part 'color_schemes.dart';
part 'text_theme.dart';

class AppTheme {
  static const AppColors colors = AppColors();
  static const AppTextStyles typography = AppTextStyles();
  static final AppIcons icons = AppIcons();

  static final defaultInputBorder =
      OutlineInputBorder(borderSide: BorderSide(color: colors.gray200), borderRadius: BorderRadius.circular(8));

  static const buttonPadding = EdgeInsets.fromLTRB(17, 22, 17, 22);

  static final appTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: textTheme,
      bottomSheetTheme: const BottomSheetThemeData(constraints: BoxConstraints.expand()),
      iconTheme: IconThemeData(
        color: colors.black,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(1),
          backgroundColor: WidgetStatePropertyAll(colors.white),
          shadowColor: const WidgetStatePropertyAll(Color(0x0D0A0D12)),
          textStyle: WidgetStatePropertyAll(
            typography.inter16Bold.copyWith(
              height: 1, //TODO height does not work properly with icon
            ),
          ),
          foregroundColor: WidgetStatePropertyAll(
            colors.mainAccent,
          ),
          padding: const WidgetStatePropertyAll(buttonPadding),
          visualDensity: VisualDensity.compact,
          overlayColor: WidgetStatePropertyAll(colors.mainAccent.withValues(alpha: 0.1)),
          iconColor: WidgetStatePropertyAll(colors.mainAccent),
          iconSize: const WidgetStatePropertyAll(20),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          side: WidgetStatePropertyAll(
            BorderSide(
              color: colors.mainAccent,
            ),
          ),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.mainAccent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(buttonPadding),
          visualDensity: VisualDensity.comfortable,
          overlayColor: WidgetStatePropertyAll(colors.mainAccent),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return colors.dividerColor;
              }
              return colors.mainAccent;
            },
          ),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          textStyle: WidgetStatePropertyAll(
            typography.smallParagraphMedium.copyWith(
              height: 1, //TODO height does not work properly with icon
            ),
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return colors.lightSecondaryText;
              }
              return colors.white;
            },
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(colors.mainAccent),
      )),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(buttonPadding),
          visualDensity: VisualDensity.compact,
          backgroundColor: WidgetStatePropertyAll(colors.mainAccent),
          overlayColor: WidgetStatePropertyAll(colors.mainAccent),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          textStyle: WidgetStatePropertyAll(
            typography.inter16Bold.copyWith(
              height: 1, //TODO height does not work properly with icon
            ),
          ),
          iconColor: WidgetStatePropertyAll(colors.brand600),
          iconSize: const WidgetStatePropertyAll(20),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return colors.mainAccent;
              }
              return colors.mainAccent;
            },
          ),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colors.white,
      ),
      dividerTheme: DividerThemeData(space: 0, color: colors.gray100),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStatePropertyAll(colors.brand25),
        fillColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return colors.blueGray400;
            }
            return Colors.transparent;
          },
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: defaultInputBorder,
        focusedBorder: defaultInputBorder.copyWith(
          borderSide: BorderSide(color: colors.mainAccent),
        ),
        enabledBorder: defaultInputBorder,
        hintStyle: typography.interText16.copyWith(
          color: colors.textGray,
        ),
        iconColor: colors.black,
        prefixIconColor: colors.black,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colors.mainAccent,
        selectionHandleColor: colors.mainAccent,
        selectionColor: colors.mainAccent,
      ),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        primaryColor: colors.brand300,
      ));

  static final appThemeDark = appTheme.copyWith(
    brightness: Brightness.dark,
    textTheme: textTheme,
  );

  static final appThemeLight = appTheme.copyWith(
    brightness: Brightness.dark,
    textTheme: textTheme,
  );
}

class MaterialAppTheme {
  static final materialTheme = ThemeData(
    colorSchemeSeed: Colors.amber,
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: textTheme,
  );

  static final materialLight = materialTheme.copyWith(
    brightness: Brightness.light,
    textTheme: textTheme,
  );

  static final materialDark = materialTheme.copyWith(
    brightness: Brightness.dark,
    textTheme: textTheme,
  );
}
