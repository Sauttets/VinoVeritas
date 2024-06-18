import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/wine_card.dart';
import 'package:vinoveritas/src/screens/settings_page.dart';
import 'package:vinoveritas/src/screens/lexikon_page.dart';
import 'package:vinoveritas/src/screens/startup_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => WineListPage(wineEntries: wineEntries),
    ),
    GoRoute(
      path: '/page1',
      builder: (context, state) => const LexiconPage(fact: 'Some fact'),
    ),
    GoRoute(
      path: '/page2',
      builder: (context, state) => placeholderPage('FavoritesPage'),
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


final wineEntries = [
    WineEntry(
      year: '2019',
      name: 'Châteauneuf-du-Pape',
      volume: '850ml',
      price: '42,00€',
      imagePath: 'assets/images/wine.png',
    ),
    WineEntry(
      year: '2019',
      name: 'Château Migraine',
      volume: '750ml',
      price: '13,37€',
      imagePath: 'assets/images/wine.png',
    ),
    // Add more entries as needed
  ];