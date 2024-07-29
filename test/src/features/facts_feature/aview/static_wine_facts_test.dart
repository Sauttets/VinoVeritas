import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/features/facts_feature/aview/widgets/static_facts/static_wine_facts.dart';

void main() {
  testWidgets('StaticWineFacts displays tabs and wine facts', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: StaticWineFacts(),
      ),
    ));

    expect(find.text('Weinbau'), findsOneWidget);
    expect(find.text('Kellerei'), findsOneWidget);
    expect(find.text('Geschmack'), findsOneWidget);
    expect(find.text('Sonstiges'), findsOneWidget);
  });
}
