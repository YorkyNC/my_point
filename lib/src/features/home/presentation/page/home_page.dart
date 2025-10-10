import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_point/src/core/router/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _handleSignOut(BuildContext context) async {
    try {
      log('Settings: Starting logout process');
      await st.deleteAuthStatus();
      await st.deletePvzId();
      await st.deleteToken();
      await st.deleteRefreshToken();
      await st.deleteRole();
      await st.clear();
      st.notify();
      await Future.delayed(const Duration(milliseconds: 100));

      log('Settings: Manual logout completed, token should be cleared');

      if (context.mounted) {
        context.go(RoutePaths.login);
      }
    } catch (e) {
      log('Settings: Error during sign out: $e');
      try {
        await st.deleteAuthStatus();
        await st.deletePvzId();
        await st.deleteToken();
        await st.deleteRefreshToken();
        await st.deleteRole();
        await st.clear();
        st.notify();
      } catch (clearError) {
        log('Settings: Error during fallback clear: $clearError');
      }
      if (context.mounted) {
        context.go(RoutePaths.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: IconButton(
              onPressed: () {
                _handleSignOut(context);
              },
              icon: Icon(Icons.logout))),
    );
  }
}
