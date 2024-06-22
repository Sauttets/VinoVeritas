import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vinoveritas/src/isar/entitis/favList.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;
  String name;
	late int plz;
	double radius = 5;
  @enumerated
	ColorMode colorMode = ColorMode.auto;
	String shareCode;
  final userList = IsarLink<FavListe>();


  User({
    required this.name,  
    required this.shareCode,    
  });

  
}

enum ColorMode{
    auto,
    light, 
    dark
}



