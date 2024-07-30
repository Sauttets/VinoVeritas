import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vinoveritas/src/features/settings_feature/controller/cubit/settings_cubit.dart';
import 'package:vinoveritas/util/static_text.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/import_favorites.dart';

class MockSettingsCubit extends MockCubit<SettingsState> implements SettingsCubit {}

class FakeSettingsState extends Fake implements SettingsState {}

void main() {
  late MockSettingsCubit mockSettingsCubit;

  setUpAll(() {
    registerFallbackValue(FakeSettingsState());
  });

  setUp(() {
    mockSettingsCubit = MockSettingsCubit();
    when(() => mockSettingsCubit.stream).thenAnswer((_) => Stream.value(SettingsInit()));
    when(() => mockSettingsCubit.state).thenReturn(SettingsInit());
  });

  testWidgets('ImportFavorites Widget renders correctly and button enables/disables based on input', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<SettingsCubit>(
          create: (_) => mockSettingsCubit,
          child: const ImportFavorites(),
        ),
      ),
    );

    expect(find.text(StaticText.weincode), findsOneWidget);
    expect(find.text(StaticText.listName), findsOneWidget);
    expect(find.text(StaticText.importButton), findsOneWidget);

    final Finder buttonFinder = find.byType(ElevatedButton);
    expect(buttonFinder, findsOneWidget);
    ElevatedButton button = tester.widget(buttonFinder);
    expect(button.onPressed, isNull);

    await tester.enterText(find.byType(TextField).at(0), 'Test Code');
    await tester.pump();
    button = tester.widget(buttonFinder);
    expect(button.onPressed, isNull);

    await tester.enterText(find.byType(TextField).at(1), 'Test Name');
    await tester.pump();
    button = tester.widget(buttonFinder);
    expect(button.onPressed, isNotNull);
  });
}
