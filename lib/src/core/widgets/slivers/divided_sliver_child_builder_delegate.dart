import 'dart:math' as math;

import 'package:flutter/material.dart';

class DividedSliverChildBuilderDelegate extends SliverChildBuilderDelegate {
  DividedSliverChildBuilderDelegate({
    required IndexedWidgetBuilder builder,
    required int childCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  }) : super(
          (context, index) {
            final itemIndex = index ~/ 2;
            if (index.isEven) {
              return builder(context, itemIndex);
            }

            return const Divider();
          },
          childCount: math.max(
            0,
            childCount * 2 - 1,
          ),
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          semanticIndexCallback: (_, index) => index.isEven ? index ~/ 2 : null,
        );
}
