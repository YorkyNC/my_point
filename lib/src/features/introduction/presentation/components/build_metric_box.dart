import 'package:flutter/material.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class BuildMetricBox extends StatelessWidget {
  const BuildMetricBox({
    super.key,
    required this.context,
    required this.icon,
    required this.value,
  });

  final BuildContext context;
  final IconData icon;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(7.75),
          decoration: BoxDecoration(
            color: context.colors.mainAccent,
            borderRadius: BorderRadius.circular(7.27),
          ),
          child: Icon(
            icon,
            color: context.colors.white,
            size: 17.45,
          ),
        ),
        SizedBox(width: 8),
        Text(
          value,
          style: context.typography.title.copyWith(
            color: context.colors.white,
          ),
        ),
      ],
    );
  }
}
