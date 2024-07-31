import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/features/login_disclaimer_feature/aview/widgets/age_verification.dart';
import 'package:vinoveritas/src/features/login_disclaimer_feature/aview/widgets/onboarding_age_verification_disclaimer.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/static_text.dart';

void main() {
  testWidgets('OnboardingAgeVerification displays correct structure and texts', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: OnboardingAgeVerificationDisclaimer(),
        ),
      ),
    );

    // Verify the title text
    expect(find.text(StaticText.ageVerificationTitle), findsOneWidget);
    
    // Verify the first paragraph text
    expect(find.text(StaticText.ageVerificationText1), findsOneWidget);
    
    // Verify the second paragraph text
    expect(find.text(StaticText.ageVerificationText2), findsOneWidget);

    // Verify the CheckboxButtonWidget is present
    expect(find.byType(AgeVerificationCheckbox), findsOneWidget);

    // Verify initial state of the CheckboxButtonWidget
    final checkboxFinder = find.byType(Checkbox);
    final buttonFinder = find.byType(ElevatedButton);

    expect(checkboxFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
    expect(tester.widget<ElevatedButton>(buttonFinder).onPressed, isNull);

    // Tap the checkbox to check it
    await tester.tap(checkboxFinder);
    await tester.pumpAndSettle();

    // Verify the button is now enabled
    expect(tester.widget<ElevatedButton>(buttonFinder).onPressed, isNotNull);
    expect(tester.widget<ElevatedButton>(buttonFinder).style?.backgroundColor?.resolve({}), AppColors.primaryRed);

    // Tap the checkbox to uncheck it
    await tester.tap(checkboxFinder);
    await tester.pumpAndSettle();

    // Verify the button is now disabled
    expect(tester.widget<ElevatedButton>(buttonFinder).onPressed, isNull);
    expect(tester.widget<ElevatedButton>(buttonFinder).style?.backgroundColor?.resolve({}), AppColors.primaryGrey);
  });
}
