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
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null)
                Container(
                  decoration: BoxDecoration(
                    color: backgroundColor ?? context.colors.white,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(padding.left, 16, padding.right, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: DefaultTextStyle(
                            style: context.typography.inter16Bold.copyWith(color: context.colors.black),
                            child: title,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: context.pop,
                          icon: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(color: context.colors.gray25, shape: BoxShape.circle),
                            child: Icon(Icons.close_outlined, size: 16, color: context.colors.black),
                          ),
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
