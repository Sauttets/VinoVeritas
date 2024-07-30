import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/share_favorites.dart';

void main() {
  testWidgets('DisplayAndCopyText Widget displays text and has a copy button', (WidgetTester tester) async {
    // Test-Text
    const testText = 'Sample text for copying';

    // Pumpe das Widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DisplayAndCopyText(text: testText),
        ),
      ),
    );

    // Überprüfen, ob der Text korrekt angezeigt wird
    expect(find.text(testText), findsOneWidget);

    // Überprüfen, ob der Kopieren-Button vorhanden ist
    final Finder copyButtonFinder = find.byIcon(Icons.copy);
    expect(copyButtonFinder, findsOneWidget);

    // Simuliere das Drücken des Kopieren-Buttons
    await tester.tap(copyButtonFinder);
    await tester.pump();

   
  });
}
