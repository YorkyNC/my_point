import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class BulletPointText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  const BulletPointText({super.key, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '• ',
        style: TextStyle(fontWeight: FontWeight.bold, color: context.colors.black),
        children: [
          TextSpan(
            text: text,
            style: textStyle ?? context.typography.interText16.copyWith(color: context.colors.black),
          ),
        ],
      ),
    );
  }
}
