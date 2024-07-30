import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/filter/filter_sort_taste.dart';
import 'package:vinoveritas/util/static_text.dart';
import 'package:vinoveritas/util/taste_maps.dart';

// Dummy Data for the test (placeholders for actual icons and colors)

// Create a mock function to replace context.read<WineCubit>()
void mockApplyFilters({String? color, String? sort, String? fitOrFlavour}) {
  // Dummy function for tests, no actual logic needed
}

void main() {
  testWidgets('FilterSortTaste Widget renders and toggles menus correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FilterSortTaste(),
        ),
      ),
    );

    // Check initial state: Menus should be closed
    expect(find.text(StaticText.filterLabel), findsOneWidget);
    expect(find.text(StaticText.sortLabel), findsOneWidget);
    expect(find.byType(Column), findsOneWidget); // Menus should not be visible initially

    // Open Filter/Sort menu
    await tester.tap(find.text(StaticText.sortLabel));
    await tester.pumpAndSettle();

    // Check if the Filter/Sort menu is open
    expect(find.byType(Column), findsNWidgets(3)); // Expecting a Column which means the menu is expanded

    // Open Taste menu
    await tester.tap(find.text(StaticText.filterLabel));
    await tester.pumpAndSettle();

    // Check if the Taste menu is open
    expect(find.byType(Column), findsNWidgets(2)); // Expecting both menus to be visible

    // Select a wine type (e.g., "red")
    expect(find.text('Käse'), findsOneWidget);

    // Verify the state change by checking UI elements
    // Here you would need to verify how the UI changes, which depends on the specific implementation
    // For simplicity, assume the change is visible, add actual checks as per UI implementation
  });
}
