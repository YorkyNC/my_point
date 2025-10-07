import '../../../../app/imports.dart';
import '../../../../core/extensions/build_context_extension.dart';

class CustomSnackBar {
  static SnackBar show({
    required String title,
    required int seconds,
    required BuildContext context,
    required Color color,
    bool? isDeleting = false,
    VoidCallback? onTap,
  }) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      backgroundColor: color,
      duration: Duration(seconds: seconds),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: context.typography.smallParagraphMedium.copyWith(
                color: context.colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          isDeleting == true
              ? InkWell(
                  onTap: onTap,
                  child: Text(
                    context.loc.cancel,
                    style: context.typography.smallParagraphMedium.copyWith(
                      color: context.colors.white,
                    ),
                  ),
                )
              : Icon(
                  context.icons.multiplication,
                  color: context.colors.white,
                ),
        ],
      ),
    );
  }
}
