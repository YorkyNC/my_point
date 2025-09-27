import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class LanguageTileWidget extends StatelessWidget {
  const LanguageTileWidget({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });
  final String title;
  final String value;
  final String groupValue;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      dense: true,
      selected: groupValue == value,
      title: Text(title, style: context.typography.interText16.copyWith(color: context.colors.black)),
      activeColor: context.colors.blue,
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      fillColor: WidgetStateProperty.all(context.colors.blue),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
