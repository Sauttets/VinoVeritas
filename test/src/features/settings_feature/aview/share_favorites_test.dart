import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/share_favorites.dart';

void main() {
  testWidgets('DisplayAndCopyText Widget displays text and has a copy button', (WidgetTester tester) async {
    const testText = 'Sample text for copying';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DisplayAndCopyText(text: testText),
        ),
      ),
    );

    expect(find.text(testText), findsOneWidget);

    final Finder copyButtonFinder = find.byIcon(Icons.copy);
    expect(copyButtonFinder, findsOneWidget);

    await tester.tap(copyButtonFinder);
    await tester.pump();

   
  });
}
