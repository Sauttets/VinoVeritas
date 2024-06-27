import 'package:isar/isar.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/favList.dart';

part 'settings.g.dart';

@collection
class Settings {
  Id id = Isar.autoIncrement;
  late String username;
  late int plz;
  double radius = 5;
  @enumerated
  int colorMode = 0;
  String shareCode = '##this is a database share code ##';
  final userList = IsarLink<FavListe>();
  final impportList = IsarLink<FavListe>();
}
