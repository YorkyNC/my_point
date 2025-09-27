import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class AccountDetailsWidget extends StatelessWidget {
  final String title;
  final String value;
  const AccountDetailsWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(title, style: context.typography.interText12.copyWith(color: context.colors.gray)),
        ),
        SizedBox(width: 8),
        Text(value, style: context.typography.inter14Bold.copyWith(color: context.colors.black)),
      ],
    );
  }
}
