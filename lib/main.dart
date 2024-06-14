import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/navbar.dart';
import 'app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My App',
      routerDelegate: _appRouter.router.routerDelegate,
      routeInformationParser: _appRouter.router.routeInformationParser,
      backButtonDispatcher: RootBackButtonDispatcher(),
      routeInformationProvider: PlatformRouteInformationProvider(
        initialRouteInformation: RouteInformation(uri: Uri.parse('/')),
      ),
      builder: (context, router) {
        return Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) => Scaffold(
                body:
                    router ?? const Center(child: CircularProgressIndicator()),
                bottomNavigationBar: CustomNavBar(appRouter: _appRouter),
              ),
            ),
          ],
        );
      },
    );
  }
}
