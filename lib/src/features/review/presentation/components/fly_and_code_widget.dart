import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class FlyAndCodeWidget extends StatelessWidget {
  final String title;
  final bool? isCode;
  final String? flyName;
  final String? flyNumber;
  final String? code;
  const FlyAndCodeWidget({
    super.key,
    required this.title,
    this.isCode = false,
    this.flyName,
    this.flyNumber,
    this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 12),
      decoration: BoxDecoration(
        color: context.colors.gray100,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: context.typography.interText12.copyWith(color: context.colors.gray)),
          Row(
            children: [
              Text(
                isCode ?? false ? code ?? '123456' : flyName ?? 'FlyArystan',
                style: isCode ?? false
                    ? context.typography.inter16Bold.copyWith(color: context.colors.black)
                    : context.typography.inter14Bold.copyWith(color: context.colors.redBold),
              ),
              SizedBox(width: 8),
              isCode ?? false
                  ? Icon(Icons.copy, size: 24, color: context.colors.black)
                  : Text(
                      flyNumber ?? 'IQ 360 ₸',
                      style: context.typography.inter14Bold.copyWith(color: context.colors.black),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
