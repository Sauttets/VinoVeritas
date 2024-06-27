import 'package:vinoveritas/src/services/persistence_service/entitis/settings.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/wine.dart';

abstract class IsarServiceInterface {
  //Settings_functions
  Future<Settings?> saveSettings(Settings settings);
  Future<Settings?> getSettings();
  Future<int> addUser(String name, String shareCode);
  Future<void> deleteUser(int id);
  Future<void> updateUser(
      int id, String? name, int? plz, double? radius, int? colorMode);

  Future<void> addInFavList(Wine wine, int id);
  Future<void> removeInFavList(Wine wine, int id);

  Future<int> addWine(Wine wine);
  Future<void> deleteWine(Wine wine);

  //Filterfunktionen
  Future<List<Wine>> getFavoriteWines(int userId);
  Future<List<Wine>> filterFavoriteWines(int userId,
      {String? region, String? type, String? taste, String? color});
}
