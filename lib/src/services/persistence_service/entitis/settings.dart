import 'package:isar/isar.dart';

part 'settings.g.dart';

@collection
class Settings {
  Id id = Isar.autoIncrement;
  late String username;
  late int plz;
  double radius = 5;
  int colorMode = 0;
  String shareCode = '##this is a database share code ##';
  
}
