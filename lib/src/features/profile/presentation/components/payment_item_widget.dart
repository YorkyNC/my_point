import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class PaymentItemWidget extends StatelessWidget {
  final String title;
  final String? image;
  final bool isAdd;
  final Function()? onTap;
  const PaymentItemWidget({super.key, required this.title, this.image, this.isAdd = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: isAdd
                    ? EdgeInsets.symmetric(vertical: 10, horizontal: 14)
                    : EdgeInsets.symmetric(vertical: 11, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: context.colors.black),
                ),
                child: isAdd
                    ? Icon(Icons.add, color: context.colors.black, size: 12)
                    : image != null
                        ? SvgPicture.asset(image!)
                        : null,
              ),
              SizedBox(width: 8),
              Text(title, style: context.typography.interText16.copyWith(color: context.colors.black)),
            ],
          ),
          Icon(context.icons.chevron_right, color: context.colors.blue),
        ],
      ),
    );
  }
}
