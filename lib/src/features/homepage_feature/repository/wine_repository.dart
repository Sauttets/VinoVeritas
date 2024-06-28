import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vinoveritas/src/features/homepage_feature/model/wine_model.dart';


class WineRepository {
  final String apiUrl = 'https://api.gargelkarg.com/getFullWine';

  Future<List<Wine>> fetchWines(int startRange, int endRange) async {
    final response = await http.get(Uri.parse('$apiUrl?range=$startRange:$endRange&user_id=1'));
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
}
