import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/aview/home_and_favorite/widgets/filter/filter_sort_taste.dart';
import 'package:vinoveritas/util/static_text.dart';


void mockApplyFilters({String? color, String? sort, String? fitOrFlavour}) {}

void main() {
  testWidgets('FilterSortTaste Widget renders and toggles menus correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FilterSortTaste(),
        ),
      ),
    );

    expect(find.text(StaticText.filterLabel), findsOneWidget);
    expect(find.text(StaticText.sortLabel), findsOneWidget);
    expect(find.byType(Column), findsOneWidget); 

    await tester.tap(find.text(StaticText.sortLabel));
    await tester.pumpAndSettle();

    expect(find.byType(Column), findsNWidgets(3)); 

    await tester.tap(find.text(StaticText.filterLabel));
    await tester.pumpAndSettle();

    expect(find.byType(Column), findsNWidgets(2)); 

    expect(find.text('Käse'), findsOneWidget);
  });
}
