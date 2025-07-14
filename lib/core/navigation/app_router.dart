import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Placeholder screen - create this file for now
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const DashboardScreen(), // Main screen
      ),
      // Add other routes here later e.g., /add-expense, /settings
    ],
    // Optional: Add error handling
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.error}')),
    ),
  );
}
