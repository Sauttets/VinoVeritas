import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/features/facts_feature/aview/widgets/wine_fact_of_the_day_card.dart';
import 'package:vinoveritas/util/static_text.dart';

void main() {
  testWidgets('WineFactOfTheDay displays the fact', (WidgetTester tester) async {
    const testFact = 'Test Fact of the Day';

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: WineFactOfTheDay(fact: testFact),
      ),
    ));

    expect(find.text(StaticText.wineFactOfTheDay), findsOneWidget);
    expect(find.text(testFact), findsOneWidget);
  });
}
