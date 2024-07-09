import 'package:isar/isar.dart';

part 'settings.g.dart';

@collection
class Settings {
  late Id id;
  late String username;
  int plz = 0000;
  double radius = 5;
  int colorMode = 0;
  late String shareCode;
  List<Sharedlist> sharedWith = [];
}

@embedded
class Sharedlist {
  late String name;
  late String shareCode;
}
