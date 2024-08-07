import 'package:http/http.dart' as http;
import 'package:vinoveritas/src/features/home_favorite_feature/model/wine_model.dart';
import 'dart:convert';

class WineRepository {
  final String apiUrl = 'https://api.gargelkarg.com/getWines';

  Future<List<Wine>> fetchWines({
    required int offset,
    required int limit,
    String color = 'all',
    String sort = 'most-liked',
    String? fitOrFlavour,
    String? searchQuery,
    bool favlist = false,
    required String shareCode,
  }) async {
    final uri = Uri.parse(apiUrl).replace(queryParameters: {
      'shareCode': shareCode,
      'range': '$offset:$limit',
      if (color != 'all') 'color': color,
      if (sort != 'most-liked') 'sort': sort,
      if (fitOrFlavour != null) 'fitOrFlavour': fitOrFlavour,
      if (searchQuery != null) 'search': searchQuery,
      if (favlist) 'favlist': 'true',
    });

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> jsonList = List<dynamic>.from(json.decode(response.body) as Iterable<dynamic>);
      return jsonList.map((json) => Wine.fromJson(json as Map<String, dynamic>)).toList();
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

  Future<void> addToFavorites(String shareCode, int wineId) async {
    final response = await http.post(Uri.parse('https://api.gargelkarg.com/AddToFavList?shareCode=$shareCode&wine_id=$wineId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to add to favorites');
    }
  }

  Future<void> removeFromFavorites(String shareCode, int wineId) async {
    final response = await http.post(Uri.parse('https://api.gargelkarg.com/deleteFromFavList?shareCode=$shareCode&wine_id=$wineId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to remove from favorites');
    }
  }
}
