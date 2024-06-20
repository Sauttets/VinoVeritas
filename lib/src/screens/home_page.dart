import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/filter_sort_taste.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/search_bar.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/wine_card.dart';


class WinePageLayout extends StatelessWidget {

  const WinePageLayout({super.key});

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



final wineEntries = [
  WineEntry(
    year: '2019',
    name: 'Tanz der Tanine',
    volume: '750ml',
    price: '34,00€',
    wineImagePath: 'assets/images/RotweinFlasche.png',
    glassImagePath: 'assets/images/RotweinGlas.png',
  ),
  WineEntry(
    year: '2019',
    name: 'Tanz der Tanine',
    volume: '750ml',
    price: '34,00€',
    wineImagePath: 'assets/images/RotweinFlasche.png',
    glassImagePath: 'assets/images/RotweinGlas.png',
  ),
  WineEntry(
    year: '2018',
    name: 'Weißwein Wunder',
    volume: '750ml',
    price: '29,00€',
    wineImagePath: 'assets/images/WeißweinFlasche.png',
    glassImagePath: 'assets/images/WeißweinGlas.png',
  ),
];
