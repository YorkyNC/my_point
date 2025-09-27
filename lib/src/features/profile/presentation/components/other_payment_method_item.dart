import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class OtherPaymentMethodItem extends StatelessWidget {
  final String title;
  final String image;
  final String value;
  final String groupValue;
  final Function(String?) onChanged;
  const OtherPaymentMethodItem({
    super.key,
    required this.title,
    required this.image,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      dense: true,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: context.colors.blue,
      controlAffinity: ListTileControlAffinity.trailing,
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 11, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: context.colors.black),
            ),
            child: SvgPicture.asset(image),
          ),
          SizedBox(width: 8),
          Text(title, style: context.typography.interText16.copyWith(color: context.colors.black)),
        ],
      ),
    );
  }
}
