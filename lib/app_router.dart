import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/settings_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: '/page1',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: '/page2',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: '/page3',
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);

Widget placeholderPage(String pageName) {
  return Scaffold(
    appBar: AppBar(
      title: Text(pageName),
    ),
    body: Center(
      child: Text('$pageName is under construction'),
    ),
  );
}
