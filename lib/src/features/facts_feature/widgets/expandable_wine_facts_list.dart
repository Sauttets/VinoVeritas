import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/facts_feature/widgets/expandable_wine_fact_card.dart';

class WineFactsTab extends StatelessWidget {
  final List<Map<String, String>> wineFacts;

  const WineFactsTab({super.key, required this.wineFacts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: wineFacts.length,
      itemBuilder: (context, index) {
        return ExpandableWineFactCard(
          title: wineFacts[index]['title']!,
          content: wineFacts[index]['content']!,
        );
      },
    );
  }
}
