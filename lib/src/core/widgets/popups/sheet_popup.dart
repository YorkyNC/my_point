import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../extensions/build_context_extension.dart';
import '../padding/default_horizontal_padding.dart';
import 'base_popup.dart';

Future<T?> showSheetPopup<T>(
  BuildContext context, {
  Color? backgroundColor,
  Color? iconColor,
  Widget? title,
  required Widget Function(BuildContext) builder,
  bool useRootNavigator = true,
  EdgeInsets padding = DefaultHorizontalPadding.defaultPadding,
  bool showDragHandle = false,
}) {
  return showBasePopup<T>(
    context,
    showDragHandle: showDragHandle,
    useRootNavigator: useRootNavigator,
    useSafeArea: true,
    builder: (context) => DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor ?? context.colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8),
              Container(
                width: 48,
                height: 4,
                decoration:
                    BoxDecoration(color: context.colors.lightSecondaryText, borderRadius: BorderRadius.circular(100)),
              ),
              // SizedBox(height: 20),
              if (title != null)
                Container(
                  decoration: BoxDecoration(
                    color: backgroundColor ?? context.colors.white,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(padding.left, 16, padding.right, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: context.pop,
                              child: Icon(context.icons.close, size: 24, color: context.colors.black),
                            ),
                          ],
                        ),
                        DefaultTextStyle(
                          style: context.typography.title.copyWith(color: context.colors.black),
                          child: title,
                        ),
                      ],
                    ),
                  ),
                ),
              Flexible(
                child: Padding(padding: padding, child: builder(context)),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
