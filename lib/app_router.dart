import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/wine_card.dart';
import 'package:vinoveritas/src/screens/home_page.dart';
import 'package:vinoveritas/src/screens/like_page.dart';
import 'package:vinoveritas/src/screens/settings_page.dart';
import 'package:vinoveritas/src/screens/lexikon_page.dart';
import 'package:vinoveritas/main.dart'; // Ensure this import exists for the wrapper

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => CustomNavBarWrapper(
        child: placeholderPage('WhateverPage'),
      ),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => CustomNavBarWrapper(
        child: WinePageLayout(wineEntries: wineEntries),
      ),
    ),
    GoRoute(
      path: '/page1',
      builder: (context, state) => const CustomNavBarWrapper(
        child: LexiconPage(fact: 'Some fact'),
      ),
    ),
    GoRoute(
      path: '/page2',
      builder: (context, state) => const CustomNavBarWrapper(
        child: LikePageLayout(),
      ),
    ),
    GoRoute(
      path: '/page3',
      builder: (context, state) => const CustomNavBarWrapper(
        child: SettingsPage(),
      ),
    ),
  ],
);

extension GoRouterLocation on GoRouter {
  String get location {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}

void push(BuildContext context, String route) {
  GoRouter.of(context).push(route);
}

void pop(BuildContext context) {
  GoRouter.of(context).pop();
}

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
];
