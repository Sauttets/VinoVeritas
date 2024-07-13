import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:vinoveritas/src/features/homepage_feature/aview/widgets/navbar.dart';
import 'package:vinoveritas/src/features/settings_feature/controller/cubit/settings_cubit.dart';
import 'package:vinoveritas/src/services/persistence_service/isar_service.dart';
import 'package:vinoveritas/src/services/persistence_service/isar_service_interface.dart';
import 'package:vinoveritas/src/services/router_service/app_router.dart' as app_router;
import 'package:vinoveritas/util/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure plugin services are initialized
  await setupLocator(); // Setup service locator and initialize services
  runApp(const MyApp());
}

Future<void> setupLocator() async {
  final persistenceService = IsarService();
  GetIt.I.registerSingleton<IsarServiceInterface>(persistenceService);
  GetIt.I.registerSingleton<SettingsCubit>(SettingsCubit());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
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
      backgroundColor: AppColors.primaryWhite,
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: child), // Wrap the body in SafeArea
      bottomNavigationBar: !hideNavBarRoutes.contains(currentLocation)
          ? SafeArea(child: CustomNavBar(goRouter: GoRouter.of(context))) // Wrap the NavBar in SafeArea
          : null,
    );
  }
}
