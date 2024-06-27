import 'package:http/http.dart' as http;
import 'package:vinoveritas/src/features/homepage_feature/model/wine_model.dart';
import 'dart:convert';

class WineRepository {
  final String apiUrl = 'https://api.gargelkarg.com/getFullWine';

  Future<List<Wine>> fetchWines({int start = 1, int end = 20}) async {
    final response = await http.get(Uri.parse('$apiUrl?range=$start:$end&user_id=1'));
    if (response.statusCode == 200) {
      try {
        final List<dynamic> winesJson = json.decode(response.body);
        return winesJson.map((json) => Wine.fromJson(json)).toList();
      } catch (e) {
        print('Error parsing JSON: $e');
        throw Exception('Failed to parse wines');
      }
    } else {
      print('Failed to load wines, status code: ${response.statusCode}');
      throw Exception('Failed to load wines');
    }
  }
}
