/* import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vinoveritas/src/features/homepage_feature/model/favlist_tupel.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/settings.dart';
import 'package:vinoveritas/src/services/persistence_service/IsarService.dart';

@GenerateMocks([Isar, Settings])

class MockIsar extends Mock implements Isar {}
class MockSettings extends Mock implements Settings {}

void main() {
  late IsarService isarService;
  late MockIsar mockIsar;
  late MockSettings mockSettings;

  setUp(() {
    mockIsar = MockIsar();
    mockSettings = MockSettings();
    isarService = IsarService();
    isarService.db = Future.value(mockIsar);

    // Set default behavior for mock settings
    when(mockSettings.id).thenReturn(1);
  });

  group('IsarService Tests', () {
    test('isDatabaseEmpty returns true if no settings exist', () async {
      when(mockIsar.settings.count()).thenAnswer((_) async => 0);

      final result = await isarService.isDatabaseEmpty();
      expect(result, true);
    });

    test('updateSettings updates user settings', () async {
      when(mockIsar.settings.get(any)).thenAnswer((_) async => mockSettings);

      await isarService.updateSettings(1, 'updatedUser', 12345, 10.0, 1);

      verify(mockIsar.writeTxn(any)).called(1);
      verify(mockSettings.username = 'updatedUser').called(1);
      verify(mockSettings.plz = 12345).called(1);
      verify(mockSettings.radius = 10.0).called(1);
      verify(mockSettings.colorMode = 1).called(1);
    });

    test('saveSettings saves new settings', () async {
      when(mockIsar.settings.put(any)).thenAnswer((_) async {});

      final settings = Settings()
        ..id = 1
        ..username = 'user'
        ..shareCode = 'shareCode';

      final result = await isarService.saveSettings(settings);

      verify(mockIsar.writeTxn(any)).called(1);
      verify(mockIsar.settings.put(settings)).called(1);
      expect(result, settings);
    });

    test('getSettings returns the settings', () async {
      when(mockIsar.settings.where().findFirst()).thenAnswer((_) async => mockSettings);

      final result = await isarService.getSettings();
      expect(result, mockSettings);
    });

    test('getID returns the ID of the user', () async {
      when(mockIsar.settings.where().findFirst()).thenAnswer((_) async => mockSettings);

      final result = await isarService.getID();
      expect(result, 1);
    });

    test('getUserName returns the username of the user', () async {
      when(mockIsar.settings.get(any)).thenAnswer((_) async => mockSettings);
      when(mockSettings.username).thenReturn('user');

      final result = await isarService.getUserName();
      expect(result, 'user');
    });

    test('addSharedList adds a new shared list', () async {
      when(mockIsar.settings.get(any)).thenAnswer((_) async => mockSettings);
      when(mockSettings.sharedWith).thenReturn([]);

      await isarService.addSharedList('sharedName', 'sharedCode');

      verify(mockIsar.writeTxn(any)).called(1);
      verify(mockSettings.sharedWith.add(any)).called(1);
      verify(mockIsar.settings.put(mockSettings)).called(1);
    });

    test('getAllSharedNames returns all shared names', () async {
      when(mockIsar.settings.get(any)).thenAnswer((_) async => mockSettings);
      when(mockSettings.sharedWith).thenReturn([
        Sharedlist()..name = 'shared1',
        Sharedlist()..name = 'shared2'
      ]);

      final result = await isarService.getAllSharedNames();
      expect(result, ['shared1', 'shared2']);
    });

    test('getSharedCodeFrom returns the share code for the given name', () async {
      when(mockIsar.settings.get(any)).thenAnswer((_) async => mockSettings);
      when(mockSettings.sharedWith).thenReturn([
        Sharedlist()..name = 'shared1'..shareCode = 'code1',
        Sharedlist()..name = 'shared2'..shareCode = 'code2'
      ]);

      final result = await isarService.getSharedCodeFrom('shared1');
      expect(result, 'code1');
    });

    test('getUserShareCode returns the share code of the user', () async {
      when(mockIsar.settings.get(any)).thenAnswer((_) async => mockSettings);
      when(mockSettings.shareCode).thenReturn('userShareCode');

      final result = await isarService.getUserShareCode();
      expect(result, 'userShareCode');
    });

    test('getSharedLists returns the shared lists as FavlistTupel', () async {
      when(mockIsar.settings.get(any)).thenAnswer((_) async => mockSettings);
      when(mockSettings.sharedWith).thenReturn([
        Sharedlist()..name = 'shared1'..shareCode = 'code1',
        Sharedlist()..name = 'shared2'..shareCode = 'code2'
      ]);

      final result = await isarService.getSharedLists();
      expect(result, [
        FavlistTupel(shareCode: 'code1', name: 'shared1'),
        FavlistTupel(shareCode: 'code2', name: 'shared2')
      ]);
    });

    test('clearSharedLists clears all shared lists', () async {
      when(mockIsar.settings.get(any)).thenAnswer((_) async => mockSettings);
      when(mockSettings.sharedWith).thenReturn([
        Sharedlist()..name = 'shared1'..shareCode = 'code1',
        Sharedlist()..name = 'shared2'..shareCode = 'code2'
      ]);

      await isarService.clearSharedLists();

      verify(mockIsar.writeTxn(any)).called(1);
      verify(mockSettings.sharedWith = []).called(1);
      verify(mockIsar.settings.put(mockSettings)).called(1);
    });
  });
} */