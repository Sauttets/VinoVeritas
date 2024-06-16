import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/navbar.dart';
import 'package:vinoveritas/app_router.dart' as app_router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp.router(
        routerConfig: app_router.router,
        builder: (context, router) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Positioned.fill(
                  child: router!,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomNavBar(goRouter: app_router.router),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
