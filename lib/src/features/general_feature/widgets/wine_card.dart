import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/heartbutton.dart';
import 'package:vinoveritas/src/features/homepage_feature/model/wine_model.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:go_router/go_router.dart';

class WineCard extends StatelessWidget {
  final Wine wine;

  const WineCard({
    super.key,
    required this.wine,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth / 2;
    final cardHeight = cardWidth * 6 / 5;

    // Determine the appropriate glass image based on wine type
    String glassImage;
    switch (wine.type.toLowerCase()) {
      case 'weiss':
        glassImage = 'assets/images/WeissweinGlas.png';
        break;
      case 'rose':
        glassImage = 'assets/images/RoseweinGlas.png';
        break;
      case 'rot':
      default:
        glassImage = 'assets/images/RotweinGlas.png';
        break;
    }

    // Determine the appropriate fallback bottle image based on wine type
    String bottleImage;
    switch (wine.type.toLowerCase()) {
      case 'weiss':
        bottleImage = 'assets/images/WeissweinFlasche.png';
        break;
      case 'rose':
        bottleImage = 'assets/images/RoseweinFlasche.png';
        break;
      case 'rot':
      default:
        bottleImage = 'assets/images/RotweinFlasche.png';
        break;
    }

    double? cheapestPrice;
    if (wine.supermarkets.isNotEmpty) {
      cheapestPrice = wine.supermarkets
          .map((supermarket) => supermarket.price)
          .reduce((value, element) => value < element ? value : element);
    }

    return GestureDetector(
      onTap: () {
        context.push('/wine-details', extra: wine);
      },
      child: Container(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  HeartButton(isLiked: wine.isLiked,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wine.year.toString(),
                    style: const TextStyle(
                      fontSize: Spacings.textFontSize,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    wine.name,
                    style: const TextStyle(
                      fontSize: Spacings.titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${wine.volume} ml',
                    style: const TextStyle(
                      fontSize: Spacings.textFontSize,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            if (cheapestPrice != null)
              Positioned(
                bottom: 16,
                left: 16,
                child: Text(
                  '\$${cheapestPrice.toStringAsFixed(2)}',
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
                  glassImage,
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
                child: Image.network(
                  wine.imageURL,
                  height: cardHeight * 1 / 2,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      bottleImage,
                      height: cardHeight * 1 / 2,
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class WinePage extends StatelessWidget {
  final List<Wine> wines;

  const WinePage({super.key, required this.wines});

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
        itemCount: wines.length,
        itemBuilder: (context, index) {
          final wine = wines[index];
          return WineCard(wine: wine);
        },
      ),
    );
  }
}
