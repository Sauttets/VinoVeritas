import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/facts_feature/aview/widgets/expandable_wine_fact_card.dart';

class WineFactsTab extends StatelessWidget {
  final List<Map<String, String>> wineFacts;
  final int tabIndex;

  const WineFactsTab({super.key, required this.wineFacts, required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: wineFacts.length,
      itemBuilder: (context, index) {
        return ExpandableWineFactCard(
          key: ValueKey('$tabIndex-$index'),
          title: wineFacts[index]['title']!,
          content: wineFacts[index]['content']!,
        );
      },
    );
  }
}
