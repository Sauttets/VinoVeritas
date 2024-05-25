import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/facts_feature/widgets/expandable_wine_fact_card.dart';
import 'package:vinoveritas/src/features/facts_feature/widgets/wine_fact_card.dart';

class WineFactsHome extends StatelessWidget {
  final List<Map<String, String>> wineFacts = [
    {
      'title': 'Trockene und liebliche Weine',
      'content': 'Inhalt zu trockenen und liebliche Weinen.'
    },
    {
      'title': 'Säuregehalt und Frische im Wein',
      'content': 'Inhalt zu Säuregehalt und Frische im Wein.'
    },
    {
      'title': 'Aromenviefalt: Von fruchtig bis würzig',
      'content': 'Inhalt zu Aromenviefalt: Von fruchtig bis würzig.'
    },
    {
      'title': 'Tannine: Struktur und Geschmack',
      'content': 'Inhalt zu Tannine: Struktur und Geschmack.'
    },
    {
      'title': 'Einfluss des Terroirs auf den Geschmack',
      'content': 'Inhalt zu Einfluss des Terroirs auf den Geschmack.'
    },
    {'title': 'Weinreifung', 'content': 'Inhalt zu Weinreifung.'},
  ];

  WineFactsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wine Facts'),
          bottom: const TabBar(
            indicatorColor: Colors.red,
            tabs: [
              Tab(text: 'Weinbau'),
              Tab(text: 'Kellerei'),
              Tab(text: 'Geschmack'),
              Tab(text: 'Sonstiges'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            WineFactsTab(wineFacts: wineFacts),
            WineFactsTab(wineFacts: wineFacts),
            WineFactsTab(wineFacts: wineFacts),
            WineFactsTab(wineFacts: wineFacts),
          ],
        ),
      ),
    );
  }
}

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
