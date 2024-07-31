import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/aview/facts/widgets/static_facts/expandable_wine_fact_card.dart';

void main() {
  testWidgets('ExpandableWineFactCard expands and collapses', (WidgetTester tester) async {
    const testTitle = 'Test Title';
    const testContent = 'Test Content';

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ExpandableWineFactCard(
          title: testTitle,
          content: testContent,
        ),
      ),
    ));

    expect(find.text(testTitle), findsOneWidget);
    expect(find.text(testContent), findsNothing);

    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();

    expect(find.text(testContent), findsOneWidget);

    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();

    expect(find.text(testContent), findsNothing);
  });
}
