import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class SettingsItemWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isIcon;
  final String? text;
  const SettingsItemWidget({super.key, required this.title, required this.onTap, this.isIcon = false, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.colors.gray100, borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        trailing: isIcon ? Icon(Icons.chevron_right, size: 20, color: context.colors.blue) : Text(text ?? ''),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(title, style: context.typography.interText14.copyWith(color: context.colors.black)),
      ),
    );
  }
}
