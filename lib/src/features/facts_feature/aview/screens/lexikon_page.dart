// lexicon_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/facts_feature/aview/widgets/static_wine_facts.dart';
import 'package:vinoveritas/src/features/facts_feature/aview/widgets/wine_fact_card.dart';
import 'package:vinoveritas/src/features/facts_feature/controller/wine_fact_cubit.dart';
import 'package:vinoveritas/src/features/facts_feature/wine_fact_repository.dart';

class LexiconPage extends StatelessWidget {
  const LexiconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => WineFactCubit(wineFactRepository: WineFactRepository())..fetchWineFact(),
          child: const Padding(
            padding: EdgeInsets.only(top: 16.0), // Additional padding above
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: WineFactCardSection(),
                ),
                Expanded(
                  child: StaticWineFacts(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WineFactCardSection extends StatelessWidget {
  const WineFactCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WineFactCubit, WineFactState>(
      builder: (context, state) {
        if (state is WineFactLoading) {
          return const CircularProgressIndicator();
        } else if (state is WineFactLoaded) {
          return WineFactCard(fact: state.wineFact.fact);
        } else {
          return const Text('Failed to fetch wine fact');
        }
      },
    );
  }
}
