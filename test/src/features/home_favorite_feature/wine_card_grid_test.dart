import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vinoveritas/src/aview/home_and_favorite/widgets/wine_card_grid.dart';
import 'package:vinoveritas/src/controller/home_and_favorite/wine_cubit.dart';
import 'package:vinoveritas/src/controller/home_and_favorite/wine_state.dart';
import 'package:vinoveritas/src/model/home_and_favorite/wine_model.dart';
import 'package:vinoveritas/src/aview/home_and_favorite/widgets/wine_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MockWineCubit extends MockCubit<WineState> implements WineCubit {}

void main() {
  setUpAll(() {
    registerFallbackValue(const WineInitial());
  });

  testWidgets('WineCardGrid Widget renders correctly and triggers fetchWines on scroll', (WidgetTester tester) async {
    final mockWineCubit = MockWineCubit();
    final List<Wine> wines = [
      Wine(
        id: 1,
        name: 'Sample Wine 1',
        year: 2020,
        country: 'France',
        type: 'red',
        description: 'A nice red wine.',
        imageURL: 'https://example.com/wine.jpg',
        volume: 750.0,
        volAlc: 13.5,
        isLiked: false,
        dryness: 0.5,
        acidity: 0.4,
        tanninLevel: 0.6,
        flavours: ['Cherry', 'Oak'],
        fitsTo: ['Beef', 'Pasta'],
        supermarkets: [
          Supermarket(
            name: 'Supermarket A',
            street: 'Main St',
            postalCode: '12345',
            city: 'City',
            houseNumber: '10',
            price: 15.0,
          ),
          Supermarket(
            name: 'Supermarket B',
            street: 'Second St',
            postalCode: '54321',
            city: 'Another City',
            houseNumber: '20',
            price: 12.0,
          ),
        ],
      ),
      Wine(
        id: 2,
        name: 'Sample Wine 2',
        year: 2020,
        country: 'France',
        type: 'red',
        description: 'A nice red wine.',
        imageURL: 'https://example.com/wine.jpg',
        volume: 750.0,
        volAlc: 13.5,
        isLiked: false,
        dryness: 0.5,
        acidity: 0.4,
        tanninLevel: 0.6,
        flavours: ['Cherry', 'Oak'],
        fitsTo: ['Beef', 'Pasta'],
        supermarkets: [
          Supermarket(
            name: 'Supermarket A',
            street: 'Main St',
            postalCode: '12345',
            city: 'City',
            houseNumber: '10',
            price: 15.0,
          ),
          Supermarket(
            name: 'Supermarket B',
            street: 'Second St',
            postalCode: '54321',
            city: 'Another City',
            houseNumber: '20',
            price: 12.0,
          ),
        ],
      ),
    ];

    when(() => mockWineCubit.state).thenReturn(WineLoaded(wines));
    when(() => mockWineCubit.fetchWines()).thenAnswer((_) async {});

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<WineCubit>(
            create: (_) => mockWineCubit,
            child: WineCardGrid(wines: wines, hasReachedMax: false),
          ),
        ),
      ),
    );

    expect(find.byType(WineCard), findsNWidgets(2));
    expect(find.text('Sample Wine 1'), findsOneWidget);
    expect(find.text('Sample Wine 2'), findsOneWidget);

    final scrollableFinder = find.byType(GridView);
    tester.widget<GridView>(scrollableFinder);
    await tester.drag(scrollableFinder, const Offset(0, -500));
    await tester.pumpAndSettle();

    verify(() => mockWineCubit.fetchWines()).called(1);
  });
}
