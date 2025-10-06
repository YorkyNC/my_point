import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class AppNavigationWrapper extends StatelessWidget {
  const AppNavigationWrapper({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onTap,
  });

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
                      color: const Color(0xFF000000).withOpacity(0.07),
                      blurRadius: 30,
                      spreadRadius: 0,
                      offset: const Offset(-10, 10),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(
                      context,
                      index: 0,
                      icon: Icons.home_outlined,
                      activeIcon: Icons.home,
                    ),
                    _buildNavItem(
                      context,
                      index: 1,
                      icon: Icons.local_shipping_outlined,
                      activeIcon: Icons.local_shipping,
                    ),
                    _buildNavItem(
                      context,
                      index: 2,
                      icon: Icons.inventory_outlined,
                      activeIcon: Icons.inventory,
                    ),
                    _buildNavItem(
                      context,
                      index: 3,
                      icon: Icons.person_outline,
                      activeIcon: Icons.person,
                    ),
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
                decoration: BoxDecoration(
                  color: context.colors.mainAccent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.qr_code_scanner,
                  color: context.colors.white,
                  size: 28,
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
          color: isActive ? context.colors.mainAccent : Colors.grey[600],
          size: 24,
        ),
      ),
    );
  }
}
