import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/localization/extension/app_language_extension.dart';
import 'package:my_point/src/core/router/router.dart';
import 'package:my_point/src/features/profile/presentation/components/settings_item_widget.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: context.colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Настройки', style: context.typography.inter14Bold.copyWith(color: context.colors.gray)),
          SettingsItemWidget(
            title: 'Способы оплаты',
            onTap: () {
              context.push(RoutePaths.paymentMethod);
            },
          ),
          SettingsItemWidget(
            title: 'Валюта',
            onTap: () {
              context.push(RoutePaths.currency);
            },
          ),
          SettingsItemWidget(
            title: 'Служба поддержки',
            onTap: () {
              context.push(RoutePaths.support);
            },
          ),
          SettingsItemWidget(
            isIcon: false,
            text: context.currentLanguage.nativeName,
            title: 'Язык',
            onTap: () {
              context.push(RoutePaths.languageSelection);
            },
          ),
          SettingsItemWidget(title: 'Политика конфиденциальности', onTap: () {}),
        ],
      ),
    );
  }
}
