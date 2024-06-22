import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/description.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/taste_pallet.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/wine_data.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/full_description.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/supermarket_selector.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/wine_deatail_top.dart';

class WineDetailsPage extends StatelessWidget {
  final Wine wine;

  const WineDetailsPage({super.key, required this.wine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wine.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WineDetailTop(wine: wine),
              FullDescription(
                tastePallet: TastePallet(
                  flavor1: wine.flavours.isNotEmpty ? wine.flavours[0] : '',
                  flavor2: wine.flavours.length > 1 ? wine.flavours[1] : null,
                  flavor3: wine.flavours.length > 2 ? wine.flavours[2] : null,
                  fit1: wine.fitsTo.isNotEmpty ? wine.fitsTo[0] : '',
                  fit2: wine.fitsTo.length > 1 ? wine.fitsTo[1] : null,
                  fit3: wine.fitsTo.length > 2 ? wine.fitsTo[2] : null,
                ),
                description: Description(description: wine.description),
              ),
              const SizedBox(height: 16.0),
              if (wine.supermarkets.isNotEmpty)
                ...wine.supermarkets.map((supermarket) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: SupermarketSelector(
                    imagePath: supermarket.img,
                    name: supermarket.name,
                    address: '${supermarket.street} ${supermarket.houseNumber}, ${supermarket.city}',
                    postalCode: supermarket.postalCode,
                    price: '${supermarket.price.toStringAsFixed(2)}€',
                    distance: '0.5 km', // Example distance
                  ),
                )),
            ],
          ),
        ),
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wine App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WineDetailsPage(
                  wine: Wine(
                    id: 1,
                    name: 'Châteauneuf-du-Pape',
                    year: 2020,
                    country: 'France',
                    type: 'Red',
                    description: 'A full-bodied red wine...',
                    imageURL: 'https://example.com/wine.png',
                    volume: 750,
                    volAlc: 14.5,
                    isLiked: true,
                    dryness: 0.2,
                    acidity: 0.5,
                    tanninLevel: 0.6,
                    flavours: ['Fruchtig', 'Blumig', 'Erdig'],
                    fitsTo: ['Käse', 'Fisch', 'Rindfleisch'],
                    supermarkets: [
                      Supermarket(
                        name: 'Supermarket A',
                        street: 'Street',
                        postalCode: '12345',
                        city: 'City',
                        houseNumber: '1',
                        price: 42.00,
                        img: 'assets/images/Logo_Edeka.png',
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: const Text('Go to Wine Details'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
