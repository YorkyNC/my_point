import 'package:flutter/material.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class BuildeSelectableField extends StatelessWidget {
  final bool isOnlyRead;
  final String placeholder;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool isSelected;
  final String? value;
  const BuildeSelectableField({
    super.key,
    required this.placeholder,
    this.icon,
    this.onTap,
    this.isSelected = false,
    this.isOnlyRead = false,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isOnlyRead ? null : onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(color: context.colors.gray100, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              placeholder,
              style: context.typography.interText16.copyWith(
                color: isSelected ? context.colors.black : context.colors.textGray,
              ),
            ),
            if (icon != null) Icon(icon, size: 24, color: context.colors.blue),
            if (value != null)
              Text(value!, style: context.typography.inter14Bold.copyWith(color: context.colors.black)),
          ],
        ),
      ),
    );
  }
}
