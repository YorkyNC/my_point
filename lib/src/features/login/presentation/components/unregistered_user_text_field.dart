import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class UnregisteredUserTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final GlobalKey<FormState>? formKey;
  final String? errorText;
  final String? Function(String?)? validator;
  const UnregisteredUserTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.keyboardType,
    this.obscureText,
    this.formKey,
    this.errorText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
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
            borderSide: BorderSide(color: context.colors.lightErrorBorder),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colors.lightErrorBorder, width: 1),
          ),
          labelStyle: context.typography.smallParagraph.copyWith(
            color: context.colors.textprimary,
          ),
          errorStyle: context.typography.interlinear.copyWith(
            color: context.colors.lightErrorBorder,
          ),
          errorText: errorText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: hintText,
          hintStyle: context.typography.smallParagraph.copyWith(
            color: context.colors.lightSecondaryText,
          ),
        ),
      ),
    );
  }
}
