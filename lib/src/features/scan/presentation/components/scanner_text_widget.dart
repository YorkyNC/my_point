import 'package:flutter/material.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class ScannerTextWidget extends StatelessWidget {
  final String text;
  final String subtitle;
  const ScannerTextWidget({
    super.key,
    required this.screenSize,
    required this.scanAreaSize,
    required this.text,
    required this.subtitle,
  });

  final Size screenSize;
  final double scanAreaSize;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: screenSize.height / 2 + scanAreaSize / 2 + 40,
      left: 0,
      right: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: context.typography.title.copyWith(
              color: context.colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: context.typography.smallParagraph.copyWith(
              color: context.colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
