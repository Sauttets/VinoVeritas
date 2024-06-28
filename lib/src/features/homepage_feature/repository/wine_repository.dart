import 'package:http/http.dart' as http;
import 'package:vinoveritas/src/features/homepage_feature/model/wine_model.dart';
import 'dart:convert';

class WineRepository {
  final String apiUrl = 'https://api.gargelkarg.com/getWines';

  Future<List<Wine>> fetchWines(int offset, int limit) async {
    final response = await http.get(Uri.parse('$apiUrl?user_id=1&range=$offset:$limit'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Wine.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load wines');
    }
  }

  Future<bool> isImageValid(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<void> addToFavorites(int userId, int wineId) async {
    final response = await http.post(Uri.parse('https://api.gargelkarg.com/AddToFavList?user_id=$userId&wine_id=$wineId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to add to favorites');
    }
  }

  Future<void> removeFromFavorites(int userId, int wineId) async {
    final response = await http.post(Uri.parse('https://api.gargelkarg.com/deleteFromFavList?user_id=$userId&wine_id=$wineId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to remove from favorites');
    }
  }
}
