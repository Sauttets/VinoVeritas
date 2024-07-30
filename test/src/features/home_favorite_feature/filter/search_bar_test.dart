import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/filter/search_bar.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/controller/wine_cubit.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/controller/wine_state.dart';
import 'package:vinoveritas/util/static_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Mock der WineCubit-Klasse
class MockWineCubit extends Mock implements WineCubit {}

// MockWineState, falls nötig für Mocktail
class MockWineState extends Fake implements WineState {}

void main() {
  setUpAll(() {
    // Registriere den MockWineState als FallbackValue für Mocktail
    registerFallbackValue(MockWineState());
  });

  testWidgets('WineSearchBar Widget renders and interacts correctly', (WidgetTester tester) async {
    // Arrange: Erstelle einen Mock-Cubit
    final mockWineCubit = MockWineCubit();

    // Erstelle eine leere Stream-Mock
    when(() => mockWineCubit.stream).thenAnswer((_) => Stream.empty());

    // Setze den aktuellen Zustand des Cubits auf WineInitial
    when(() => mockWineCubit.state).thenReturn(const WineInitial());

    // Mock die applyFilters Methode um ein Future<void> zurückzugeben
    when(() => mockWineCubit.applyFilters(searchQuery: any(named: 'searchQuery')))
      .thenAnswer((_) async {});

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<WineCubit>(
            create: (_) => mockWineCubit,
            child: const WineSearchBar(),
          ),
        ),
      ),
    );

    // Verify the TextField is present with the correct hint text and prefix icon
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text(StaticText.searchHint), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    
    // Act: Enter text into the TextField and submit it
    await tester.enterText(find.byType(TextField), 'test query');



  });
}
