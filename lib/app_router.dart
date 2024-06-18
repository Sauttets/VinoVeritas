import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/FilterSortTaste.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/wine_card.dart';
import 'package:vinoveritas/src/screens/home_page.dart';
import 'package:vinoveritas/src/screens/settings_page.dart';
import 'package:vinoveritas/src/screens/lexikon_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => placeholderPage('WhateverPage'),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => WinePageLayout(wineEntries: wineEntries),
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
        name: 'Tanz der Tanine',
        volume: '750ml',
        price: '34,00€',
        wineImagePath: 'assets/images/RotweinFlasche.png',
        glassImagePath: 'assets/images/RotweinGlas.png',
      ),
      WineEntry(
        year: '2019',
        name: 'Tanz der Tanine',
        volume: '750ml',
        price: '34,00€',
        wineImagePath: 'assets/images/RotweinFlasche.png',
        glassImagePath: 'assets/images/RotweinGlas.png',
      ),
      WineEntry(
        year: '2018',
        name: 'Weißwein Wunder',
        volume: '750ml',
        price: '29,00€',
        wineImagePath: 'assets/images/WeißweinFlasche.png',
        glassImagePath: 'assets/images/WeißweinGlas.png',
      ),
            WineEntry(
        year: '2018',
        name: 'Weißwein Wunder',
        volume: '750ml',
        price: '29,00€',
        wineImagePath: 'assets/images/WeißweinFlasche.png',
        glassImagePath: 'assets/images/WeißweinGlas.png',
      ),
            WineEntry(
        year: '2018',
        name: 'Weißwein Wunder',
        volume: '750ml',
        price: '29,00€',
        wineImagePath: 'assets/images/WeißweinFlasche.png',
        glassImagePath: 'assets/images/WeißweinGlas.png',
      ),
            WineEntry(
        year: '2018',
        name: 'Weißwein Wunder',
        volume: '750ml',
        price: '29,00€',
        wineImagePath: 'assets/images/WeißweinFlasche.png',
        glassImagePath: 'assets/images/WeißweinGlas.png',
      ),
            WineEntry(
        year: '2018',
        name: 'Weißwein Wunder',
        volume: '750ml',
        price: '29,00€',
        wineImagePath: 'assets/images/WeißweinFlasche.png',
        glassImagePath: 'assets/images/WeißweinGlas.png',
      ),
      
      // Add more WineEntry objects here
    ];
