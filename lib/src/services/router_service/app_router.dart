import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vinoveritas/src/aview/login_disclaimer/screens/onboarding_screen.dart';
import 'package:vinoveritas/src/aview/home_and_favorite/screens/home_page.dart';
import 'package:vinoveritas/src/model/home_and_favorite/wine_model.dart';
import 'package:vinoveritas/src/aview/login_disclaimer/screens/login_page.dart';
import 'package:vinoveritas/src/aview/settings/screens/settings_page.dart';
import 'package:vinoveritas/src/aview/facts/screens/lexikon_page.dart';
import 'package:vinoveritas/main.dart';
import 'package:vinoveritas/src/aview/wine_detail/screens/wine_details_page.dart';

class NoTransitionPage<T> extends CustomTransitionPage<T> {
  NoTransitionPage({
    required super.child,
  }) : super(
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const CustomNavBarWrapper(
          child: LoginScreen(),
        ),
      ),
    ),
    GoRoute(
      path: '/disclaimer',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const CustomNavBarWrapper(
          child: OnboardingScreen(),
        ),
      ),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const CustomNavBarWrapper(
          child: HomeFavPage(showFavList: false)
        ),
      ),
    ),
    GoRoute(
      path: '/page1',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const CustomNavBarWrapper(
          child: LexiconPage(),
        ),
      ),
    ),
    GoRoute(
      path: '/page2',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const CustomNavBarWrapper(
          child: HomeFavPage(showFavList: true)

        ),
      ),
    ),
    GoRoute(
      path: '/page3',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const CustomNavBarWrapper(
          child: SettingsPage(),
        ),
      ),
    ),
    GoRoute(
      path: '/wine-details',
      builder: (context, state) {
        final wine = state.extra as Wine;
        return WineDetailsPage(wine: wine, favlist: false);
      },
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

