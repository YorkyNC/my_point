import 'package:flutter/material.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class ScannerLoadingStateWidget extends StatelessWidget {
  final String text;
  const ScannerLoadingStateWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: context.colors.black.withValues(alpha: 0.7),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: context.colors.white,
              ),
              SizedBox(height: 16),
              Text(
                text,
                style: context.typography.paragraph.copyWith(
                  color: context.colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
