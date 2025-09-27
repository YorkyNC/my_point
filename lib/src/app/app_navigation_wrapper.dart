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
    return Scaffold(
      backgroundColor: context.colors.white,
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: context.colors.white,
        elevation: 8,
        unselectedItemColor: context.colors.gray,
        unselectedLabelStyle: context.typography.interText8.copyWith(
          color: context.colors.gray,
        ),
        selectedItemColor: context.colors.blue,
        selectedLabelStyle: context.typography.interText8.copyWith(
          color: context.colors.blue,
          fontWeight: FontWeight.w600,
        ),
        onTap: (value) {
          onTap(value);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: currentIndex == 0 ? context.colors.blue : context.colors.gray,
            ),
            activeIcon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              color: currentIndex == 1 ? context.colors.blue : context.colors.gray,
            ),
            activeIcon: Icon(
              Icons.add_box,
            ),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: currentIndex == 2 ? context.colors.blue : context.colors.gray,
            ),
            activeIcon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
