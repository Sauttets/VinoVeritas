import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/aview/login_disclaimer/widgets/onboarding_feature_diclaimer.dart';
import 'package:vinoveritas/util/static_text.dart';

void main() {
  testWidgets('OnboaringFeatureDisclaimer displays correct structure and texts', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: OnboaringFeatureDisclaimer(),
        ),
      ),
    );

    // Verify the title text
    expect(find.text(StaticText.featureDisclaimerTitle), findsOneWidget);

    // Verify the first feature icon and texts
    expect(find.byIcon(Icons.wine_bar), findsOneWidget);
    expect(find.text(StaticText.feature1Title), findsOneWidget);
    expect(find.text(StaticText.feature1Text), findsOneWidget);

    // Verify the second feature icon and texts
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    expect(find.text(StaticText.feature2Title), findsOneWidget);
    expect(find.text(StaticText.feature2Text), findsOneWidget);

    // Verify the third feature icon and texts
    expect(find.byIcon(Icons.book), findsOneWidget);
    expect(find.text(StaticText.feature3Title), findsOneWidget);
    expect(find.text(StaticText.feature3Text), findsOneWidget);
  });
}
