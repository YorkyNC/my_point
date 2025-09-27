import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum TwoChildrenOverlappingPriority {
  first,
  second;
}

class TwoChildrenOverlappingView extends MultiChildRenderObjectWidget {
  TwoChildrenOverlappingView({
    super.key,
    required Widget firstChild,
    required Widget secondChild,
    this.childPriority = TwoChildrenOverlappingPriority.first,
  }) : super(children: [firstChild, secondChild]);

  ///Determines the behavior of which child will get unlimited vertical space,
  ///and which will be given the rest.
  ///
  ///Does not change overlap logic.
  final TwoChildrenOverlappingPriority childPriority;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return TwoChildOverlapRenderBox(childPriority);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    TwoChildOverlapRenderBox renderObject,
  ) {
    renderObject.priority = childPriority;
  }
}

class TwoChildOverlapRenderBox extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, TwoChildSizedData>,
        RenderBoxContainerDefaultsMixin<RenderBox, TwoChildSizedData> {
  static const gap = 8;

  TwoChildOverlapRenderBox(this._priority);

  TwoChildrenOverlappingPriority _priority;

  TwoChildrenOverlappingPriority get priority => _priority;

  set priority(TwoChildrenOverlappingPriority priority) {
    _priority = priority;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    if (firstChild == null || lastChild == null) {
      size = constraints.smallest;
      return;
    }
    RenderBox priorityChild;
    RenderBox otherChild;
    switch (priority) {
      case TwoChildrenOverlappingPriority.first:
        priorityChild = firstChild!;
        otherChild = lastChild!;
      case TwoChildrenOverlappingPriority.second:
        priorityChild = lastChild!;
        otherChild = firstChild!;
    }
    priorityChild.layout(
      constraints.copyWith(
        minHeight: 0.0,
      ),
      parentUsesSize: true,
    );
    otherChild.layout(
      constraints.copyWith(
          minHeight: 0.0,
          maxHeight: constraints.maxHeight - priorityChild.size.height + gap),
      parentUsesSize: true,
    );
    (firstChild!.parentData as TwoChildSizedData).offset =
        Offset.zero;
    (lastChild!.parentData as TwoChildSizedData).offset =
        Offset(0, firstChild!.size.height - gap);
    size = Size(
      constraints.maxWidth,
      firstChild!.size.height + lastChild!.size.height - gap,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    _clipRectLayer.layer = context.pushClipRect(
      needsCompositing,
      offset,
      Offset.zero & size,
      defaultPaint,
      clipBehavior: Clip.hardEdge,
      oldLayer: _clipRectLayer.layer,
    );
  }

  final LayerHandle<ClipRectLayer> _clipRectLayer =
      LayerHandle<ClipRectLayer>();

  @override
  void dispose() {
    _clipRectLayer.layer = null;
    super.dispose();
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! TwoChildSizedData) {
      child.parentData = TwoChildSizedData(offset: Offset.zero);
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return firstChild!.computeMaxIntrinsicHeight(width) +
        lastChild!.computeMaxIntrinsicHeight(width);
  }
}

class TwoChildSizedData extends ContainerBoxParentData<RenderBox> {
  TwoChildSizedData({
    required Offset offset,
    RenderBox? previousSibling,
    RenderBox? nextSibling,
  }) {
    this.offset = offset;
    this.previousSibling = previousSibling;
    this.nextSibling = nextSibling;
  }
}
