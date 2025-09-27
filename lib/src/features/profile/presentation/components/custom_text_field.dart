import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controllerText,
    required this.value,
    required this.hintText,
    required this.isValid,
    required this.hasContent,
    required this.validator,
    this.readOnly = true, // Add readOnly parameter with default true
  });
  final TextEditingController controllerText;
  final String value;
  final String hintText;
  final bool isValid;
  final bool hasContent;
  final String? Function(String?) validator;
  final bool readOnly; // Add readOnly field

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
    // Set the initial text from the value
    if (widget.value.isNotEmpty) {
      widget.controllerText.text = widget.value;
    }
  }

  @override
  void didUpdateWidget(CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only update if the value has actually changed to avoid unnecessary controller updates
    if (oldWidget.value != widget.value && widget.value != widget.controllerText.text) {
      widget.controllerText.text = widget.value;
    }
  }

  @override
  void dispose() {
    // Don't dispose the controller since it's managed by the parent
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly, // Use the readOnly parameter
      controller: widget.controllerText,
      decoration: InputDecoration(
        fillColor: context.colors.gray100,
        filled: true,
        hintText: widget.hintText,
        hintStyle: context.typography.interText16.copyWith(color: context.colors.textGray),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        errorBorder: _buildBorder(),
        disabledBorder: _buildBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        suffixIcon: _buildSuffixIcon(context),
      ),
      validator: widget.validator,
      // Add these properties to ensure proper text input handling
      enableInteractiveSelection: false,
      showCursor: false,
      // Add focus management to prevent conflicts
      autofocus: false,
      focusNode: FocusNode(skipTraversal: true), // Skip focus traversal
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none);
  }

  Widget? _buildSuffixIcon(BuildContext context) {
    if (widget.isValid) {
      return Icon(Icons.check_circle, color: context.colors.brand500);
    } else if (widget.hasContent) {
      return Icon(Icons.error, color: context.colors.red);
    }
    return null;
  }
}
