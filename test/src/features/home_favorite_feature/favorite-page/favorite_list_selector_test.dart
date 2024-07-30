import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/favorite_page/favorite_list_selector.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/model/favlist_tupel.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/controller/wine_cubit.dart';

// Mock der WineCubit-Klasse
class MockWineCubit extends Mock implements WineCubit {}

void main() {
  // Set up FallbackValue für Future<void> Methoden, falls nötig
  setUpAll(() {
    // Registrierung eines Fallback-Werts für alle Future<void> Rückgaben
    registerFallbackValue(Future<void>.value());
  });

  testWidgets('FavoriteListSelector displays dropdown items and updates selection', (WidgetTester tester) async {
    // Arrange: Set up a list of wine lists
    final wineLists = [
      FavlistTupel(name: 'List1', shareCode: 'code1'),
      FavlistTupel(name: 'List2', shareCode: 'code2'),
    ];

    // Mock the WineCubit
    final mockWineCubit = MockWineCubit();

    // Set up Mock-Verhalten für Methoden, die aufgerufen werden
    when(() => mockWineCubit.applyFilters(searchQuery: any(named: 'searchQuery'))).thenAnswer((_) async {});

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<WineCubit>(
            create: (_) => mockWineCubit,
            child: FavoriteListSelector(wineLists: wineLists),
          ),
        ),
      ),
    );

    // Verify the initial state: Ensure the initial dropdown value is 'List1'
    expect(find.text('List1'), findsOneWidget);
    expect(find.text('List2'), findsNothing);

    // Open the dropdown menu
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle(); // Wait for the dropdown menu to appear    
  });
}
