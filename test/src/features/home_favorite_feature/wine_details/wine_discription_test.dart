import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/aview/wine_detail/widgets/wine_description.dart';
import 'package:vinoveritas/util/static_text.dart';

void main() {
  testWidgets('WineDescription displays the correct description', (WidgetTester tester) async {
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

    expect(find.byType(Card), findsOneWidget);
    expect(find.text(StaticText.descriptionHeader), findsOneWidget);
    expect(find.text(testDescription), findsOneWidget);

  });
}
