import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/controller/wine_cubit.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/model/wine_model.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/heartbutton.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:mockito/annotations.dart';

import 'heartbutton_test.mocks.dart';

@GenerateMocks([WineCubit])
void main() {
  testWidgets('HeartButton toggles favorite status', (WidgetTester tester) async {
    final mockWineCubit = MockWineCubit();
    final wine = Wine(
      id: 1,
      name: 'Sample Wine',
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
      ],
    );

    when(mockWineCubit.stream).thenAnswer((_) => const Stream.empty());
    when(mockWineCubit.toggleFavorite(any)).thenAnswer((_) async {});

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WineCubit>(
          create: (context) => mockWineCubit,
          child: Scaffold(
            body: HeartButton(wine: wine),
          ),
        ),
      ),
    );

    expect(
      (tester.widget<Icon>(find.byIcon(Icons.favorite)).color),
      equals(AppColors.white),
    );

    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    verify(mockWineCubit.toggleFavorite(wine)).called(1);

    expect(
      (tester.widget<Icon>(find.byIcon(Icons.favorite)).color),
      equals(AppColors.heartRed),
    );

    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    verify(mockWineCubit.toggleFavorite(wine)).called(1);

    expect(
      (tester.widget<Icon>(find.byIcon(Icons.favorite)).color),
      equals(AppColors.white),
    );
  });
}
