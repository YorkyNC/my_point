import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/widgets/popups/sheet_popup.dart';
import 'package:my_point/src/features/create_delivery/presentation/components/messanger_item_widget.dart';

class MessangerSelectionSheet extends StatelessWidget {
  const MessangerSelectionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Укажите ваш мессенджер для поддержки связи',
          style: context.typography.interText12.copyWith(color: context.colors.gray),
        ),
        SizedBox(height: 16),
        MessangerItemWidget(
          title: 'WhatsApp',
          onTap: () {
            context.pop();
            showSheetPopup(
              context,
              title: Text('WhatsApp'),
              builder: (context) => Column(mainAxisSize: MainAxisSize.max, children: [Text('WhatsApp')]),
            );
          },
        ),
        SizedBox(height: 8),
        MessangerItemWidget(
          title: 'Telegram',
          onTap: () {
            context.pop();
            showSheetPopup(
              context,
              title: Text('Telegram'),
              builder: (context) => Column(mainAxisSize: MainAxisSize.max, children: [Text('Telegram')]),
            );
          },
        ),
      ],
    );
  }
}
