import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vinoveritas/src/controller/settings/settings_cubit.dart';
import 'package:vinoveritas/src/model/settings/settings_model.dart';
import 'package:vinoveritas/util/static_text.dart';
import 'package:vinoveritas/src/aview/settings/widgets/set_username.dart';

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
    when(() => mockSettingsCubit.state).thenReturn(ShowSettings(const SettingsModel(username: 'TestUser')));

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

    expect(find.text(StaticText.username), findsOneWidget);

    final Finder textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    final TextField textField = tester.widget(textFieldFinder);
    expect(
      (textField.decoration as InputDecoration).hintText,
      'TestUser',
    );

    await tester.enterText(textFieldFinder, 'NewUser');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    verify(() => mockSettingsCubit.updateUsername('NewUser')).called(1);
  });
}
