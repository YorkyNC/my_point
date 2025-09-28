import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class UnregisteredUserTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const UnregisteredUserTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 15),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: context.colors.lightSecondaryText),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.colors.lightSecondaryText),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.colors.textprimary, width: 1),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.colors.error400),
        ),
        labelStyle: context.typography.smallParagraph.copyWith(
          color: context.colors.textprimary,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: hintText,
        hintStyle: context.typography.smallParagraph.copyWith(
          color: context.colors.lightSecondaryText,
        ),
      ),
    );
  }
}
