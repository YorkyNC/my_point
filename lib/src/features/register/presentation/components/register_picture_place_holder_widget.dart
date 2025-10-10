import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class RegisterPicturePlaceHolderWidget extends StatelessWidget {
  const RegisterPicturePlaceHolderWidget({
    super.key,
    required this.onTap,
    this.photoPath,
  });
  final VoidCallback onTap;
  final String? photoPath;

  @override
  Widget build(BuildContext context) {
    final itemHeight = MediaQuery.of(context).size.height * 0.285;
    final hasPhoto = photoPath != null && photoPath!.isNotEmpty;

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: SizedBox(
        width: itemHeight * 0.75,
        height: itemHeight,
        child: hasPhoto
            ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.file(
                      File(photoPath!),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: context.colors.black.withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: onTap,
                        child: Icon(
                          context.icons.close,
                          color: context.colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  radius: Radius.circular(4),
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
    );
  }
}
