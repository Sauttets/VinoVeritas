import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:vinoveritas/src/features/global_widgets/navbar.dart';
import 'package:vinoveritas/src/features/settings_feature/controller/cubit/settings_cubit.dart';
import 'package:vinoveritas/src/services/persistence_service/isar_service.dart';
import 'package:vinoveritas/src/services/persistence_service/isar_service_interface.dart';
import 'package:vinoveritas/src/services/router_service/app_router.dart' as app_router;
import 'package:vinoveritas/util/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.backgroundColor,
  ));
  runApp(const VinoVeritas());
}

Future<void> setupLocator() async {
  final persistenceService = IsarService();
  GetIt.I.registerSingleton<IsarServiceInterface>(persistenceService);
  GetIt.I.registerSingleton<SettingsCubit>(SettingsCubit());
}

class VinoVeritas extends StatelessWidget {
  const VinoVeritas({super.key});
  
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundColor,
        statusBarIconBrightness: Brightness.light, 
        statusBarBrightness: Brightness.light,
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: app_router.router,
        builder: (context, router) {
          return router!;
        },
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColor,
        ),
      ),
    );
  }
}

class CustomNavBarWrapper extends StatelessWidget {
  final Widget child;
  const CustomNavBarWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final hideNavBarRoutes = ['/', '/disclaimer'];
    final currentLocation = GoRouter.of(context).location;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: child),
      bottomNavigationBar: !hideNavBarRoutes.contains(currentLocation)
          ? SafeArea(child: CustomNavBar(goRouter: GoRouter.of(context)))
          : null,
    );
  }
}
