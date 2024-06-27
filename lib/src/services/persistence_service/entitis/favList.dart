import 'package:isar/isar.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/user.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/wine.dart';

part 'favList.g.dart';

@collection
class FavListe {
  Id id = Isar.autoIncrement;
  late String name;
  IsarLinks<Wine> wines = IsarLinks<Wine>();

  @Backlink(to: 'userList')
  final user = IsarLinks<User>();

  FavListe({
    required this.name,
  });

  void addWine(Wine wine) {
    wines.add(wine);
  }

  void removeWine(Wine wine) {
    wines.remove(wine);
  }

  void clearWines() {
    wines.clear();
  }

  int getID() {
    return id;
  }
}
