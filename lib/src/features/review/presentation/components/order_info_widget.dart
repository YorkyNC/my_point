import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class OrderInfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String from;
  final String to;
  final String date;
  final String price;
  const OrderInfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.from,
    required this.to,
    required this.date,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: context.colors.black,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.5),
                child: Row(
                  children: [
                    // SvgPicture.asset(context.assetImages.emptyStatePicture, width: 16, height: 16),
                    const SizedBox(width: 8),
                    Text(title, style: context.typography.inter14Bold.copyWith(color: context.colors.black)),
                  ],
                ),
              ),
              const SizedBox(height: 0.5),
              Row(
                children: [
                  Text(from, style: context.typography.interText12.copyWith(color: context.colors.textGray)),
                  const SizedBox(width: 4),
                  Icon(Icons.arrow_forward, size: 16, color: context.colors.textGray),
                  const SizedBox(width: 4),
                  Text(to, style: context.typography.interText12.copyWith(color: context.colors.textGray)),
                ],
              ),
              const SizedBox(height: 0.5),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(date, style: context.typography.interText12.copyWith(color: context.colors.black)),
                    Text(price, style: context.typography.inter16Bold.copyWith(color: context.colors.black)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
