import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:vinoveritas/src/aview/login_disclaimer/widgets/age_verification.dart';

void main() {
  group('CheckboxButtonWidget', () {
    testWidgets('CheckboxButtonWidget changes state and navigates when checked', (WidgetTester tester) async {
      final router = GoRouter(
        routes: [
          GoRoute(path: '/', builder: (context, state) => const Scaffold(body: AgeVerificationCheckboxButtonWidget())),
          GoRoute(path: '/home', builder: (context, state) => const Scaffold(body: Text('Home'))),
        ],
      );

      await tester.pumpWidget(MaterialApp.router(
        routerConfig: router,
      ));

      expect(find.byType(Checkbox), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);

      // Tap the checkbox
      await tester.tap(find.byType(Checkbox));
      await tester.pump();

      // Check if the button is enabled
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNotNull);

      // Tap the button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify navigation
      expect(find.text('Home'), findsOneWidget);
    });
  });
}
