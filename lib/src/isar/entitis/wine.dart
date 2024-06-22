import 'package:isar/isar.dart';
import 'package:vinoveritas/src/isar/entitis/favList.dart';

part 'wine.g.dart';

@Collection()
class Wine {
  Id id = Isar.autoIncrement;
  String name;

  @Backlink(to: 'wines')
  final favLists = IsarLinks<FavListe>();

  Wine({
    required this.name,
  });
}
