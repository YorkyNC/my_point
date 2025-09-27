import 'package:flutter/material.dart';

class DefaultHorizontalPadding extends StatelessWidget {
  const DefaultHorizontalPadding({super.key, this.child});

  final Widget? child;

  static const EdgeInsets defaultPadding = EdgeInsets.symmetric(
    horizontal: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding,
      child: child,
    );
  }
}
