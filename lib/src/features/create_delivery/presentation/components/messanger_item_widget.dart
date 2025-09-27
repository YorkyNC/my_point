import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class MessangerItemWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const MessangerItemWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: context.colors.gray100, borderRadius: BorderRadius.circular(8)),
        child: Text(
          title,
          style: context.typography.interText16.copyWith(color: context.colors.black),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
