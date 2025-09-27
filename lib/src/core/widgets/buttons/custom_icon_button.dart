import 'package:flutter/material.dart';
import '../../extensions/build_context_extension.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final IconData icon;
  final double size;
  final BorderSide? borderSide;
  final Color? backgroundColor;
  final EdgeInsets padding;
  final Color? iconColor;

  const CustomIconButton(
      {super.key,
      required this.icon,
      this.onTap,
      this.onTapDown,
      this.onTapUp,
      this.size = 20,
      this.padding = const EdgeInsets.all(12),
      this.backgroundColor,
      this.borderSide,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? context.colors.white,
      shape: CircleBorder(
        side: borderSide ??
            BorderSide(
              color: context.colors.gray300,
              width: 1,
            ),
      ),
      elevation: 1,
      shadowColor: const Color(0xFF0A0D12).withValues(alpha: 0.05),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        child: Padding(
          padding: padding,
          child: Icon(
            icon,
            size: size,
            color: iconColor ?? context.colors.gray700,
          ),
        ),
      ),
    );
  }
}
