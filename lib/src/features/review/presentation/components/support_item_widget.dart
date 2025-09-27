import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class SupportItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const SupportItemWidget({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: context.colors.gray100,
      collapsedBackgroundColor: context.colors.gray100,
      collapsedIconColor: context.colors.blue,
      iconColor: context.colors.blue,
      childrenPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      title: Text(title, style: context.typography.interText14.copyWith(color: context.colors.black)),
      children: [
        Row(
          children: [
            Expanded(
              child: Text(subtitle, style: context.typography.interText14.copyWith(color: context.colors.gray)),
            ),
          ],
        ),
      ],
    );
  }
}
