import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vinoveritas/src/features/settings_feature/controller/cubit/settings_cubit.dart';
import 'package:vinoveritas/util/static_text.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/import_favorites.dart';

// Mock-Klasse für SettingsCubit
class MockSettingsCubit extends MockCubit<SettingsState> implements SettingsCubit {}

class FakeSettingsState extends Fake implements SettingsState {}

void main() {
  late MockSettingsCubit mockSettingsCubit;

  // Setze Fallback-Werte für die Mock-Klassen
  setUpAll(() {
    registerFallbackValue(FakeSettingsState());
  });

  // Initialisiere mockSettingsCubit vor jedem Test
  setUp(() {
    mockSettingsCubit = MockSettingsCubit();
    // Gib an, dass der Stream initial den SettingsInit Zustand liefert
    when(() => mockSettingsCubit.stream).thenAnswer((_) => Stream.value(SettingsInit()));
    // Setze den initialen Zustand
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

    // Überprüfen, ob die relevanten Texte gerendert werden
    expect(find.text(StaticText.weincode), findsOneWidget);
    expect(find.text(StaticText.listName), findsOneWidget);
    expect(find.text(StaticText.importButton), findsOneWidget);

    // Überprüfen, ob der Button zunächst deaktiviert ist
    final Finder buttonFinder = find.byType(ElevatedButton);
    expect(buttonFinder, findsOneWidget);
    ElevatedButton button = tester.widget(buttonFinder);
    expect(button.onPressed, isNull);

    // Text in das erste Textfeld eingeben und überprüfen, ob der Button immer noch deaktiviert ist
    await tester.enterText(find.byType(TextField).at(0), 'Test Code');
    await tester.pump();
    button = tester.widget(buttonFinder);
    expect(button.onPressed, isNull);

    // Text in das zweite Textfeld eingeben und überprüfen, ob der Button aktiviert ist
    await tester.enterText(find.byType(TextField).at(1), 'Test Name');
    await tester.pump();
    button = tester.widget(buttonFinder);
    expect(button.onPressed, isNotNull);
  });
}
