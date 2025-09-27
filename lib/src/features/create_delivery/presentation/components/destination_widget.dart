import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class DestinationWidget extends StatelessWidget {
  final VoidCallback onTap;
  const DestinationWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: context.colors.gray100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text(
                'Откуда',
                style: context.typography.interText16.copyWith(
                  color: context.colors.textGray,
                ),
              ),
              Spacer(),
              Icon(
                context.icons.chevron_right,
                color: context.colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
