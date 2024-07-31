import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/aview/facts/widgets/static_facts/wine_facts_selector.dart';

void main() {
  testWidgets('WineFactsSelector changes tab on tap', (WidgetTester tester) async {
    int selectedIndex = 0;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: WineFactsSelector(
          selectedIndex: selectedIndex,
          onTabSelected: (index) {
            selectedIndex = index;
          },
        ),
      ),
    ));

    await tester.tap(find.text('Kellerei'));
    await tester.pumpAndSettle();

    expect(selectedIndex, 1);
  });
}
