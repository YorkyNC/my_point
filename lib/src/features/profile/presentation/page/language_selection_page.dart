import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/localization/enum/app_language.dart';
import 'package:my_point/src/core/localization/extension/app_language_extension.dart';
import 'package:my_point/src/core/localization/extension/string_to_language_extension.dart';
import 'package:my_point/src/core/localization/localization_controller.dart';
import 'package:my_point/src/features/profile/presentation/components/language_tile_widget.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  final LanguageController _languageController = LanguageController();

  String get _currentLanguageCode => _languageController.currentLanguage;

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

  Future<void> _changeLanguage(AppLanguage language) async {
    await _languageController.setLanguage(language.code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bgWhite,
      appBar: AppBar(
        backgroundColor: context.colors.bgWhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(context.icons.chevron_left, color: context.colors.black),
        ),
        title: Text(context.loc.language, style: context.typography.inter16Bold.copyWith(color: context.colors.black)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 16,
                    children: AppLanguage.values.map((language) => _buildLanguageOption(context, language)).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildSaveButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(BuildContext context, AppLanguage language) {
    return LanguageTileWidget(
      title: language.nativeName,
      value: language.code,
      groupValue: _currentLanguageCode,
      onChanged: (code) {
        if (code != null) {
          final selectedLanguage = code.toAppLanguage();
          if (selectedLanguage != null) {
            _changeLanguage(selectedLanguage);
          }
        }
      },
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => context.pop(),
            child: Text(context.loc.save, style: context.typography.interText16.copyWith(color: context.colors.white)),
          ),
        ),
      ],
    );
  }
}
