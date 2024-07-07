import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:vinoveritas/src/features/homepage_feature/aview/widgets/navbar.dart';
import 'package:vinoveritas/src/services/persistence_service/IsarService.dart';
import 'package:vinoveritas/src/services/persistence_service/IsarServiceInterface.dart';
import 'package:vinoveritas/src/services/router_service/app_router.dart'
    as app_router;

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure plugin services are initialized
  await setupLocator(); // Setup service locator and initialize services
  runApp(const MyApp());
}

Future<void> setupLocator() async {
  final persistenceService = IsarService();
  GetIt.I.registerSingleton<IsarServiceInterface>(persistenceService);
  await addTestEntries(persistenceService); // Add this line to call the function
}
Future<void> addTestEntries(IsarServiceInterface isarService) async {
  await isarService.clearSharedLists(); // Clear existing entries
  await isarService.addSharedList('TestList1', '46f5d57f');
  await isarService.addSharedList('TestList2', '177b77ab');
  await isarService.addSharedList('TestList3', 'aeac23ce');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: app_router.router,
      builder: (context, router) {
        return router!;
      },
    );
  }
}

class CustomNavBarWrapper extends StatelessWidget {
  final Widget child;
  const CustomNavBarWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final hideNavBarRoutes = ['/']; // List of routes to hide the NavBar
    final currentLocation = GoRouter.of(context).location; // Use the extension

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: child,
      bottomNavigationBar: !hideNavBarRoutes.contains(currentLocation)
          ? CustomNavBar(goRouter: GoRouter.of(context))
          : null,
    );
  }
}
