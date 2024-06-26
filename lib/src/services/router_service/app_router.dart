import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vinoveritas/src/features/homepage_feature/aview/screens/home_page.dart';
import 'package:vinoveritas/src/features/homepage_feature/model/wine_model.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/screens/login_page.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/screens/settings_page.dart';
import 'package:vinoveritas/src/features/facts_feature/aview/screens/lexikon_page.dart';
import 'package:vinoveritas/main.dart';
import 'package:vinoveritas/src/screens/wine_details_page.dart'; // Ensure this import exists for the wrapper

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
      path: '/home',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const CustomNavBarWrapper(
          child: WinePageLayout(),
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
        child: CustomNavBarWrapper(
          child: placeholderPage("xxx"),//LikePageLayout(),
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
        return WineDetailsPage(wine: wine);
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
