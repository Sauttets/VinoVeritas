import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/static_text.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/design_selector.dart';

void main() {
  testWidgets('DesignSelector displays correct structure and reacts to taps', (WidgetTester tester) async {
    int selectedIndex = 0;
    void onTabSelected(int index) {
      selectedIndex = index;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DesignSelector(
            selectedIndex: selectedIndex,
            onTabSelected: onTabSelected,
          ),
        ),
      ),
    );

    // Verify the title text
    expect(find.text(StaticText.design), findsOneWidget);

    // Verify all mode texts
    expect(find.text(StaticText.autoMode), findsOneWidget);
    expect(find.text(StaticText.lightMode), findsOneWidget);
    expect(find.text(StaticText.darkMode), findsOneWidget);

    // Verify initial selected state for auto mode
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Container &&
            widget.decoration is BoxDecoration &&
            (widget.decoration as BoxDecoration).color == AppColors.primaryRed &&
            widget.child is Center &&
            (widget.child as Center).child is Text &&
            ((widget.child as Center).child as Text).data == StaticText.autoMode,
      ),
      findsOneWidget,
    );

    // Tap on the light mode button
    await tester.tap(find.text(StaticText.lightMode));
    await tester.pumpAndSettle();

    // Verify the callback is triggered and the light mode button is selected
    expect(selectedIndex, 1);

    // Tap on the dark mode button
    await tester.tap(find.text(StaticText.darkMode));
    await tester.pumpAndSettle();

    // Verify the callback is triggered and the dark mode button is selected
    expect(selectedIndex, 2);
  });
}
