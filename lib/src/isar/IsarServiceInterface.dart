import 'package:vinoveritas/src/isar/entitis/wine.dart';

abstract class IsarServiceInterface {
  Future<int> addUser(String name, String shareCode);
  Future<void> deleteUser(int id);
  Future<void> updateUser(int id, String? name, int? plz, double? radius,
  int? colorMode);
  Future<String> getUserName(int id);
  
  Future<void> addInFavList(Wine wine, int id);
  Future<void> removeInFavList(Wine wine, int id);

  Future<int> addWine(Wine wine);
  Future<void> deleteWine(Wine wine);

  //Filterfunktionen
  Future<List<Wine>> getFavoriteWines(int userId);
  Future<List<Wine>> filterFavoriteWines(int userId,
      {String? region, String? type, String? taste, String? color});
}
