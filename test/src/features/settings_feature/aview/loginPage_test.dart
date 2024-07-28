/* import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:vinoveritas/src/features/settings_feature/controller/cubit/settings_cubit.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/screens/login_page.dart';
import 'package:vinoveritas/src/features/settings_feature/repository/settings_repository.dart';

@GenerateMocks([SettingsCubit])
void main() {
  late MockSettingsCubit mockSettingsCubit;

  // Funktion zum Pumpen des LoginScreen Widgets
  Future<void> pumpLoginScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<SettingsCubit>(create: (_) => mockSettingsCubit),
        ],
        child: MaterialApp(
          home: LoginScreen(),
        ),
      ),
    );
  }

  setUp(() {
    mockSettingsCubit = MockSettingsCubit();

    // Registrierung der Mocks im GetIt Service Locator
    GetIt.I.registerSingleton<SettingsCubit>(mockSettingsCubit);
  });

  tearDown(() {
    // Entfernen der Registrierung nach jedem Test
    GetIt.I.reset();
  });

  testWidgets('LoginScreen displays correctly', (WidgetTester tester) async {
    await pumpLoginScreen(tester);

    // Prüfen, ob das LoginScreen Widget korrekt angezeigt wird
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Los Gehts!'), findsOneWidget);
  });

  testWidgets('Login button is enabled when username is entered', (WidgetTester tester) async {
    await pumpLoginScreen(tester);

    // Überprüfen, ob der Button anfangs deaktiviert ist
    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.onPressed, isNull);

    // Geben Sie einen Text in das Textfeld ein
    await tester.enterText(find.byType(TextField), 'testuser');
    await tester.pump();

    // Überprüfen, ob der Button aktiviert wird
    final updatedButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(updatedButton.onPressed, isNotNull);
  });

  testWidgets('Login button navigates to /home on click', (WidgetTester tester) async {
    await pumpLoginScreen(tester);

    // Geben Sie einen Text in das Textfeld ein und drücken Sie den Button
    await tester.enterText(find.byType(TextField), 'testuser');
    await tester.pump();
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Überprüfen, ob die Navigation zur /home Seite stattfindet
    // Hier müssen Sie die Navigation anpassen, um sie zu überprüfen
    verify(mockSettingsCubit.login('testuser')).called(1);
  });
}
 */