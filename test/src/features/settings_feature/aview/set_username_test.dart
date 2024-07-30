import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vinoveritas/src/features/settings_feature/controller/cubit/settings_cubit.dart';
import 'package:vinoveritas/src/features/settings_feature/model/settings_model.dart';
import 'package:vinoveritas/util/static_text.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/set_username.dart';

class MockSettingsCubit extends MockCubit<SettingsState> implements SettingsCubit {}

class FakeSettingsState extends Fake implements SettingsState {}

void main() {
  late MockSettingsCubit mockSettingsCubit;

  setUpAll(() {
    registerFallbackValue(FakeSettingsState());
  });

  setUp(() {
    mockSettingsCubit = MockSettingsCubit();
    when(() => mockSettingsCubit.state).thenReturn(SettingsInit());
    when(() => mockSettingsCubit.stream).thenAnswer((_) => Stream.value(SettingsInit()));
  });

  testWidgets('SetUsername Widget renders correctly and updates username on submit', (WidgetTester tester) async {
    // Definiere den initialen Zustand für den Test
    when(() => mockSettingsCubit.state).thenReturn(ShowSettings(SettingsModel(username: 'TestUser')));

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<SettingsCubit>(
            create: (_) => mockSettingsCubit,
            child: const SetUsername(),
          ),
        ),
      ),
    );

    // Überprüfen, ob der relevante Text gerendert wird
    expect(find.text(StaticText.username), findsOneWidget);

    // Überprüfen, ob das TextField korrekt angezeigt wird
    final Finder textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    // Überprüfen des HintTexts
    final TextField textField = tester.widget(textFieldFinder);
    expect(
      (textField.decoration as InputDecoration).hintText,
      'TestUser',
    );

    // Simuliere die Eingabe eines neuen Nutzernamens und den Absenden-Button
    await tester.enterText(textFieldFinder, 'NewUser');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    // Überprüfen, ob die updateUsername-Methode des Cubits aufgerufen wurde
    verify(() => mockSettingsCubit.updateUsername('NewUser')).called(1);
  });
}
