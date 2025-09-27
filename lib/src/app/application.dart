import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_point/src/core/localization/localization_controller.dart';

import '../core/localization/generated/l10n.dart';
import '../core/router/router.dart';
import '../core/theme/theme.dart';
import 'imports.dart';

part 'flavor_builds.dart';

class MainApp extends StatefulWidget {
  const MainApp({
    required this.flavor,
    super.key,
  });

  final AppFlavor flavor;

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  final GoRouter _router = routerProvider();
  final LanguageController _languageController = LanguageController();

  @override
  void initState() {
    super.initState();

    _languageController.languageNotifier.addListener(_onLanguageChanged);
  }

  void _onLanguageChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _languageController.languageNotifier.removeListener(_onLanguageChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildApp(
      widget.flavor,
      _router,
      _languageController.currentLanguage,
    );
  }
}
