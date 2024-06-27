import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;
  String name;
  late int plz;
  double radius = 5;
  int colorMode = 0;
  String shareCode;

  User({
    required this.name,
    required this.shareCode,
  });
}
