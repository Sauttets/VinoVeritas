import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/facts_feature/widgets/wine_fact_card.dart';
import 'package:vinoveritas/src/features/facts_feature/widgets/static_wine_facts.dart';

class LexiconPage extends StatelessWidget {

  const LexiconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.0), // Additional padding above
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: WineFactCard(
                  fact: fact, // Use the fact passed to the constructor
                ),
              ),
              Expanded(
                child: StaticWineFacts(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const String fact = 'The color of a wine is determined by the grape variety and the winemaking process.';