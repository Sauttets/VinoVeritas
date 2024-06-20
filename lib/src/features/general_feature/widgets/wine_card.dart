import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/heartbutton.dart';
import 'package:vinoveritas/util/spacings.dart';

class WineEntry {
  final String year;
  final String name;
  final String volume;
  final String price;
  final String? wineImagePath;
  final String? glassImagePath;

  WineEntry({
    required this.year,
    required this.name,
    required this.volume,
    required this.price,
    this.wineImagePath,
    this.glassImagePath,
  });
}

class WineCard extends StatelessWidget {
  final String year;
  final String name;
  final String volume;
  final String price;
  final String? wineImagePath;
  final String? overlayImagePath;

  const WineCard({
    super.key,
    required this.year,
    required this.name,
    required this.volume,
    required this.price,
    this.wineImagePath,
    this.overlayImagePath,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth / 2;
    final cardHeight = cardWidth * 6 / 5;

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              HeartButton(),
            ],
            )
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text(
                  year,
                  style: const TextStyle(
                    fontSize: Spacings.textFontSize,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: Spacings.titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  volume,
                  style: const TextStyle(
                    fontSize: Spacings.textFontSize,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Text(
              price,
              style: const TextStyle(
                fontSize: Spacings.titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50.0, bottom: 12.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                overlayImagePath ?? 'assets/images/RotweinGlas.png',
                height: cardHeight * 3 / 10,
                fit: BoxFit.contain,
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25.0, bottom: 12.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                wineImagePath ?? 'assets/images/RotweinFlasche.png',
                height: cardHeight * 10 / 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WinePage extends StatelessWidget {
  final List<WineEntry> wineEntries;

  const WinePage({super.key, required this.wineEntries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
          padding: const EdgeInsets.only(left: Spacings.horizontal, right: Spacings.horizontal),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.83, // 5:6 aspect ratio
          ),
          itemCount: wineEntries.length,
          itemBuilder: (context, index) {
            final wineEntry = wineEntries[index];
            return WineCard(
              year: wineEntry.year,
              name: wineEntry.name,
              volume: wineEntry.volume,
              price: wineEntry.price,
              wineImagePath: wineEntry.wineImagePath,
              overlayImagePath: wineEntry.glassImagePath,
            );
          },
        ),
      );
  }
}
