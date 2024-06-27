// wine_fact_model.dart
class WineFact {
  final String fact;

  WineFact({required this.fact});

  factory WineFact.fromJson(Map<String, dynamic> json) {
    return WineFact(
      fact: json['fact'],
    );
  }
}
