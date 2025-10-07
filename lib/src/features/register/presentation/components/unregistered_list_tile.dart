import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class UnregisteredListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  const UnregisteredListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTap,
      trailing: Icon(
        context.icons.chevron_right,
        color: context.colors.textprimary,
        size: 24,
      ),
      contentPadding: EdgeInsets.zero,
      title: Text(title.toUpperCase(),
          style: context.typography.extraSmallParagraphMedium.copyWith(color: context.colors.textprimary)),
      subtitle: Text(
        subtitle,
        style: context.typography.mediumParagraph.copyWith(color: context.colors.accent2),
      ),
    );
  }
}
