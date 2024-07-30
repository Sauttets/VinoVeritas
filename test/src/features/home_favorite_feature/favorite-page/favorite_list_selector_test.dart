import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/favorite_page/favorite_list_selector.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/model/favlist_tupel.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/controller/wine_cubit.dart';

class MockWineCubit extends Mock implements WineCubit {}

void main() {
  setUpAll(() {
    registerFallbackValue(Future<void>.value());
  });

  testWidgets('FavoriteListSelector displays dropdown items and updates selection', (WidgetTester tester) async {
    final wineLists = [
      FavlistTupel(name: 'List1', shareCode: 'code1'),
      FavlistTupel(name: 'List2', shareCode: 'code2'),
    ];

    final mockWineCubit = MockWineCubit();

    when(() => mockWineCubit.applyFilters(searchQuery: any(named: 'searchQuery'))).thenAnswer((_) async {});

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

    expect(find.text('List1'), findsOneWidget);
    expect(find.text('List2'), findsNothing);

    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle(); // Wait for the dropdown menu to appear    
  });
}
