import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class RegisterPicturePlaceHolderWidget extends StatelessWidget {
  const RegisterPicturePlaceHolderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          // Handle photo addition
        },
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.285,
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              radius: Radius.circular(12),
              dashPattern: [8, 4],
              strokeWidth: 1,
              padding: EdgeInsets.all(16),
              color: context.colors.lightBorder,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    context.assetImages.squareAdd,
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(height: 4),
                  Text(
                    textAlign: TextAlign.center,
                    'Добавить фото',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.typography.smallParagraph.copyWith(
                      color: context.colors.accent2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
