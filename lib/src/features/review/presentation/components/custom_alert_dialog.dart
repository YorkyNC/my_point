import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color backgorundColor;
  final Color iconColor;
  final String title;
  final String subtitle;
  const CustomAlertDialog({
    super.key,
    required this.backgorundColor,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: context.typography.inter16Bold.copyWith(
                    color: context.colors.black,
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colors.gray25,
                    ),
                    child: Icon(
                      size: 16,
                      Icons.close,
                      color: context.colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              subtitle,
              style: context.typography.interText16.copyWith(
                color: context.colors.black,
              ),
            ),
            SizedBox(height: 16),
            Row(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('Нет'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.red, overlayColor: context.colors.error300),
                    onPressed: () {
                      // TODO: Implement cancel order
                    },
                    child: Text(
                      'Отменить',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
