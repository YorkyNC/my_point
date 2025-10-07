import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class AppNavigationWrapper extends StatelessWidget {
  const AppNavigationWrapper({super.key, required this.child, required this.currentIndex, required this.onTap});

  final Widget child;
  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final bool isScanPage = currentIndex == 4;
    log('isScanPage: $isScanPage');
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      backgroundColor: isScanPage ? Colors.transparent : context.colors.white,
      body: child,
      floatingActionButton: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: context.colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF000000).withValues(alpha: 0.07),
                      blurRadius: 30,
                      spreadRadius: 0,
                      offset: const Offset(-10, 10),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(context, index: 0, icon: context.icons.home, activeIcon: context.icons.home),
                    _buildNavItem(context, index: 1, icon: context.icons.delivery, activeIcon: context.icons.delivery),
                    _buildNavItem(context, index: 2, icon: context.icons.box, activeIcon: context.icons.box),
                    _buildNavItem(context, index: 3, icon: context.icons.profile, activeIcon: context.icons.profile),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => onTap(4),
              child: Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
                decoration: BoxDecoration(color: context.colors.mainAccent, shape: BoxShape.circle),
                child: SvgPicture.asset(
                  context.assetImages.scan,
                  // colorFilter: ColorFilter.mode(
                  //   context.colors.white,
                  //   BlendMode.srcIn,
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required int index,
    required IconData icon,
    required IconData activeIcon,
  }) {
    final bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
        child: Icon(
          isActive ? activeIcon : icon,
          color: isActive ? context.colors.mainAccent : context.colors.textprimary,
        ),
      ),
    );
  }
}
