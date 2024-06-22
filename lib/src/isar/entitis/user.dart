import 'package:isar/isar.dart';
import 'package:vinoveritas/src/isar/entitis/favList.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;
  String name;
	late int plz;
	double radius = 5;
  @enumerated
	int colorMode = 0;
	String shareCode;
  final userList = IsarLink<FavListe>();


  User({
    required this.name,  
    required this.shareCode,    
  });

  
}
