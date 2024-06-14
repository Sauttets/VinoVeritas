import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/settings_page.dart';

class AppRouter {
  late final GoRouter _router;

  AppRouter() {
    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'page1',
          builder: (context, state) => placeholderPage('Page 1'),
        ),
        GoRoute(
          path: '/page2',
          name: 'page2',
          builder: (context, state) => placeholderPage('Page 2'),
        ),
        GoRoute(
          path: '/page3',
          name: 'page3',
          builder: (context, state) => placeholderPage('Page 3'),
        ),
        GoRoute(
          path: '/page4',
          name: 'page4',
          builder: (context, state) => const SettingsPage(),
        ),
      ],
      errorBuilder: (context, state) => placeholderPage('Error Page'),
      debugLogDiagnostics: true,
    );
  }

  GoRouter get router => _router;

  static Widget placeholderPage(String pageName) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
      ),
      body: Center(
        child: Text('$pageName is under construction'),
      ),
    );
  }
}
