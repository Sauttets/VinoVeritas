import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/filter_sort_taste.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/search_bar.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/wine_card.dart';


class WinePageLayout extends StatelessWidget {
  final List<WineEntry> wineEntries;

  const WinePageLayout({super.key, required this.wineEntries});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const WineSearchBar(),
              const FilterSortTaste(),
              Expanded(
                child: WinePage(wineEntries: wineEntries),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
