// wine_fact_repository.dart
import 'package:http/http.dart' as http;
import 'package:vinoveritas/src/features/facts_feature/model/wine_fact_model.dart';
import 'dart:convert';

class WineFactRepository {
  final String apiUrl = 'https://api.gargelkarg.com/getWineFactOTD';

  Future<WineFact> fetchWineFact() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return WineFact.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load wine fact');
    }
  }
}
