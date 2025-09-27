import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class ImageItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const ImageItemWidget({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      trailing: Icon(context.icons.chevron_right, color: context.colors.blue),
      title: Text(title),
      titleTextStyle: context.typography.interTBody16.copyWith(color: context.colors.black),
      leading: Icon(icon, color: context.colors.blue),
      onTap: onTap,
    );
  }
}
