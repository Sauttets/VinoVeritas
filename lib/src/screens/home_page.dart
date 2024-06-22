import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/filter_sort_taste.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/search_bar.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/wine_card.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/wine_data.dart';


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
                child: WinePage(wines: wines),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// Sample wine data
final wines = [
  Wine(
    id: 1,
    name: 'Tanz der Tanine',
    year: 2019,
    country: 'Germany',
    type: 'rot',
    description: 'A rich red wine with a hint of oak.',
    imageURL: 'assets/images/RotweinFlasche.png',
    volume: 750,
    volAlc: 13.5,
    isLiked: false,
    dryness: 0.15,
    acidity: 0.6,
    tanninLevel: 0.5,
    flavours: ['Fruchtig', 'Kräutrig', 'Buttrig'],
    fitsTo: ['Rindfleisch', 'Lamm', 'Käse'],
    supermarkets: [
      Supermarket(
        name: 'Supermarket A',
        street: '123 Wine St',
        postalCode: '12345',
        city: 'Wineland',
        houseNumber: '1',
        price: 34.00,
      ),
    ],
  ),
  Wine(
    id: 2,
    name: 'Weißwein Wunder',
    year: 2018,
    country: 'Germany',
    type: 'weiss',
    description: 'A crisp white wine with a fruity aroma.',
    imageURL: 'assets/images/WeissweinFlasche.png',
    volume: 750,
    volAlc: 12.0,
    isLiked: true,
    dryness: 0.7,
    acidity: 0.2,
    tanninLevel: 0,
    flavours: ['Fruchtig', 'Kräutrig', 'Buttrig'],
    fitsTo: ['Rindfleisch', 'Lamm', 'Käse'],
    supermarkets: [
      Supermarket(
        name: 'Supermarket B',
        street: '456 Wine Rd',
        postalCode: '67890',
        city: 'Grapeville',
        houseNumber: '2',
        price: 29.00,
      ),
    ],
  ),
];
