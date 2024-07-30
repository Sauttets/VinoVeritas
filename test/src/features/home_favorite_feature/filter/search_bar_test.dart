import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/filter/search_bar.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/controller/wine_cubit.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/controller/wine_state.dart';
import 'package:vinoveritas/util/static_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MockWineCubit extends Mock implements WineCubit {}

class MockWineState extends Fake implements WineState {}

void main() {
  setUpAll(() {
    registerFallbackValue(MockWineState());
  });

  testWidgets('WineSearchBar Widget renders and interacts correctly', (WidgetTester tester) async {
    final mockWineCubit = MockWineCubit();

    when(() => mockWineCubit.stream).thenAnswer((_) => const Stream.empty());

    when(() => mockWineCubit.state).thenReturn(const WineInitial());

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

    expect(find.byType(TextField), findsOneWidget);
    expect(find.text(StaticText.searchHint), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    
    await tester.enterText(find.byType(TextField), 'test query');



  });
}
