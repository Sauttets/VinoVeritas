
import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';

class WineItemCard extends StatelessWidget {
  final String year;
  final String name;
  final String volume;
  final String price;
  final String? imagePath;

  const WineItemCard({
    super.key,
    required this.year,
    required this.name,
    required this.volume,
    required this.price,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = (screenWidth / 2) - 16; // Adjust padding as needed

    return SizedBox(
      width: cardWidth,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                year,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGrey,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                volume,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGrey,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: AppColors.primaryGrey,
                          thickness: 1,
                          endIndent: 20, // Shorten the line
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    imagePath ?? 'assets/images/wine.png',
                    height: 135, // Adjusted image size to fit better
                    width: 50,
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0), // Reduced padding at the bottom
                child: Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WineEntry {
  final String year;
  final String name;
  final String volume;
  final String price;
  final String? imagePath;

  WineEntry({
    required this.year,
    required this.name,
    required this.volume,
    required this.price,
    this.imagePath,
  });
}


class WineListPage extends StatelessWidget {
  final List<WineEntry> wineEntries;

  const WineListPage({
    super.key,
    required this.wineEntries,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: wineEntries.length,
        itemBuilder: (context, index) {
          final wine = wineEntries[index];
          return WineItemCard(
            year: wine.year,
            name: wine.name,
            volume: wine.volume,
            price: wine.price,
            imagePath: wine.imagePath,
          );
        },
      ),
    );
  }
}