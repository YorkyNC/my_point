import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class CustomOTPWidget extends StatelessWidget {
  const CustomOTPWidget({
    super.key,
    required this.onChanged,
    required this.controller,
    required this.focusNode,
    required this.currentIndex,
    required this.onBackspace,
    this.nextFocusNode,
  });

  final Function(String value) onChanged;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final int currentIndex;
  final Function(int) onBackspace;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
      ),
      child: KeyboardListener(
        focusNode: FocusNode(),
        onKeyEvent: (KeyEvent event) {
          if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.backspace && controller.text.isEmpty) {
            onBackspace(currentIndex);
          }
        },
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          onChanged: (value) {
            // Handle input changes
            if (value.isNotEmpty) {
              // Keep only the last character if someone enters multiple
              if (value.length > 1) {
                controller.text = value.substring(value.length - 1);
                controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: controller.text.length),
                );
              }
            } else if (value.isEmpty && currentIndex > 0) {
              // If the current field has been cleared with backspace, move to previous field
              onBackspace(currentIndex);
            }

            onChanged(controller.text);
          },
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          keyboardType: TextInputType.number,
          style: context.typography.interText14.copyWith(
            color: context.colors.black,
          ),
          cursorColor: context.colors.blue,
          decoration: InputDecoration(
            filled: true,
            // isDense: true,
            fillColor: context.colors.gray100,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.blue),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.error300),
            ),
          ),
        ),
      ),
    );
  }
}
