import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class OrderInfoWdget extends StatelessWidget {
  final bool isImage;
  final String subtitle;
  final IconData? icon;
  final VoidCallback? onTap;
  const OrderInfoWdget({super.key, this.isImage = false, required this.subtitle, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   width: 40,
            //   height: 40,
            //   decoration: BoxDecoration(
            //     color: isImage ? context.colors.white : context.colors.blue,
            //     shape: BoxShape.circle,
            //   ),
            //   child: isImage
            //       ? SvgPicture.asset(context.assetImages.emptyStatePicture)
            //       : Icon(icon, size: 24, color: context.colors.white),
            // ),
            SizedBox(height: 4),
            isImage
                ? Text(
                    subtitle,
                    style: context.typography.interText14.copyWith(color: context.colors.black),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    subtitle,
                    style: context.typography.interText14.copyWith(color: context.colors.gray),
                    textAlign: TextAlign.center,
                  ),
          ],
        ),
      ),
    );
  }
}
