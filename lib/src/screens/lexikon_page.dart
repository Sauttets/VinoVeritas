import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/facts_feature/widgets/wine_fact_card.dart';
import 'package:vinoveritas/src/features/facts_feature/widgets/static_wine_facts.dart';

class LexiconPage extends StatelessWidget {
  final String fact;

  const LexiconPage({super.key, required this.fact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0), // Additional padding above
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: WineFactCard(
                  fact: fact, // Use the fact passed to the constructor
                ),
              ),
              const Expanded(
                child: StaticWineFacts(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
