import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/features/login_disclaimer_feature/aview/widgets/age_verification.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/static_text.dart';

void main() {
  testWidgets('CheckboxButtonWidget toggles checkbox and enables/disables button', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CheckboxButtonWidget(),
        ),
      ),
    );

    // Verify initial state
    expect(find.text(StaticText.ageVerification), findsOneWidget);
    expect(find.text(StaticText.ageVerificationButton), findsOneWidget);
    expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed, isNull);

    // Tap the checkbox to check it
    await tester.tap(find.byType(Checkbox));
    await tester.pumpAndSettle();

    // Verify the button is now enabled
    expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed, isNotNull);
    expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).style?.backgroundColor?.resolve({}), AppColors.primaryRed);

    // Tap the checkbox to uncheck it
    await tester.tap(find.byType(Checkbox));
    await tester.pumpAndSettle();

    // Verify the button is now disabled
    expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed, isNull);
    expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).style?.backgroundColor?.resolve({}), AppColors.primaryGrey);
  });
}
