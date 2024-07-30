import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/wine_details/wine_description.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/static_text.dart';

void main() {
  testWidgets('WineDescription displays the correct description', (WidgetTester tester) async {
    // Arrange
    const testDescription = 'This is a test wine description.';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WineDescription(
            description: testDescription,
          ),
        ),
      ),
    );

    // Assert
    expect(find.byType(Card), findsOneWidget);
    expect(find.text(StaticText.descriptionHeader), findsOneWidget);
    expect(find.text(testDescription), findsOneWidget);

    // Additional asserts to verify styling or layout can be added if necessary
  });
}
