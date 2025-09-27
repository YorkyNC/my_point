import 'package:flutter/material.dart';

class BuildActionIcon extends StatelessWidget {
  const BuildActionIcon({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    this.rotation = 0.0,
  });

  final IconData icon;
  final Color iconColor;
  final Color? backgroundColor;
  final double rotation;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation * (3.14159 / 180),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 18,
        ),
      ),
    );
  }
}
