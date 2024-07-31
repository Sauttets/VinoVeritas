import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/features/lexicon_feature/aview/widgets/static_facts/expandable_wine_facts_list.dart';

void main() {
  testWidgets('WineFactsTab displays list of ExpandableWineFactCard', (WidgetTester tester) async {
    final testFacts = [
      {'title': 'Fact 1', 'content': 'Content 1'},
      {'title': 'Fact 2', 'content': 'Content 2'},
    ];

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: WineFactsTab(wineFacts: testFacts, tabIndex: 0),
      ),
    ));

    expect(find.text('Fact 1'), findsOneWidget);
    expect(find.text('Fact 2'), findsOneWidget);
  });
}
