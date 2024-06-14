import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/navbar.dart';
import 'app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // Check if _appRouter or its router is null and print a message
    if (_appRouter.router == null) {
      print('AppRouter or its router is null');
    }

    return MaterialApp(
      title: 'My App',
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: _appRouter.router != null
                ? Router(
                    routerDelegate: _appRouter.router.routerDelegate,
                    routeInformationParser:
                        _appRouter.router.routeInformationParser,
                    routeInformationProvider: PlatformRouteInformationProvider(
                      initialRouteInformation:
                          RouteInformation(uri: Uri.parse('/'), state: {}),
                    ),
                    backButtonDispatcher: RootBackButtonDispatcher(),
                  )
                : Center(
                    child: Text('Error: AppRouter or its router is null'),
                  ), // Display a message when _appRouter or its router is null
            bottomNavigationBar: CustomNavBar(appRouter: _appRouter),
          );
        },
      ),
    );
  }
}
