import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/heartbutton.dart';
import 'package:vinoveritas/src/features/homepage_feature/model/wine_model.dart';
import 'package:vinoveritas/src/features/homepage_feature/repository/wine_repository.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:go_router/go_router.dart';

class WineCard extends StatefulWidget {
  final Wine wine;

  const WineCard({super.key, required this.wine});

  @override
  _WineCardState createState() => _WineCardState();
}

class _WineCardState extends State<WineCard> {
  late Future<bool> _isImageValid;
  final WineRepository wineRepository = WineRepository();

  @override
  void initState() {
    super.initState();
    _isImageValid = wineRepository.isImageValid(widget.wine.imageURL);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth / 2;
    final cardHeight = cardWidth * 6 / 5;

    // Determine the appropriate glass image based on wine type
    String glassImage;
    switch (widget.wine.type.toLowerCase()) {
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
    switch (widget.wine.type.toLowerCase()) {
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
    if (widget.wine.supermarkets.isNotEmpty) {
      cheapestPrice = widget.wine.supermarkets
          .map((supermarket) => supermarket.price)
          .reduce((value, element) => value < element ? value : element);
    }

    return GestureDetector(
      onTap: () {
        context.push('/wine-details', extra: widget.wine);
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
                  HeartButton(wine: widget.wine),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.wine.year.toString(),
                    style: const TextStyle(
                      fontSize: Spacings.textFontSize,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.wine.name,
                    style: const TextStyle(
                      fontSize: Spacings.titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${widget.wine.volume} ml',
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
                '\$${cheapestPrice?.toStringAsFixed(2)}',
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
                child: FutureBuilder<bool>(
                  future: _isImageValid,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError || !snapshot.data!) {
                      return Image.asset(
                        bottleImage,
                        height: cardHeight * 1 / 2,
                        fit: BoxFit.contain,
                      );
                    } else {
                      return Image.network(
                        widget.wine.imageURL,
                        height: cardHeight * 1 / 2,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            bottleImage,
                            height: cardHeight * 1 / 2,
                            fit: BoxFit.contain,
                          );
                        },
                      );
                    }
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
