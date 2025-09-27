import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/router/router.dart';

class VerifiedAccountWidget extends StatelessWidget {
  const VerifiedAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        context.push(RoutePaths.accountDetails);
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: context.colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // SvgPicture.asset(context.assetImages.emptyStatePicture, width: 40, height: 40),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Сатпаев Магжан', style: context.typography.interText14.copyWith(color: context.colors.black)),
                    SizedBox(height: 4),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      decoration: BoxDecoration(
                        color: context.colors.blue.withAlpha(20),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Верифицирован',
                        style: context.typography.interText10.copyWith(color: context.colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.chevron_right, color: context.colors.blue),
          ],
        ),
      ),
    );
  }
}
