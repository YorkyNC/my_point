import 'package:flutter/material.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const SectionWidget({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.typography.interText14.copyWith(color: context.colors.textGrayLight),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}
