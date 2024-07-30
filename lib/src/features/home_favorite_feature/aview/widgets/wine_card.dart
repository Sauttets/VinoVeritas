import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/heartbutton.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/model/wine_model.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/repository/wine_repository.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:go_router/go_router.dart';

class WineCard extends StatefulWidget {
  final Wine wine;

  const WineCard({super.key, required this.wine});

  @override
  WineCardState createState() => WineCardState();
}

class WineCardState extends State<WineCard> {
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

    String bottleImage;
    String glassImage;
    switch (widget.wine.type.toLowerCase()) {
      case 'white':
        glassImage = 'assets/images/WeissweinGlas.png';
        bottleImage = 'assets/images/WeissweinFlasche.png';
        break;
      case 'rose':
        glassImage = 'assets/images/RoseweinGlas.png';
        bottleImage = 'assets/images/RoseweinFlasche.png';
        break;
      case 'red':
      default:
        glassImage = 'assets/images/RotweinGlas.png';
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
          color: AppColors.white,
          borderRadius: BorderRadius.circular(Spacings.cardBorderRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(Spacings.buttonSpacing),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  HeartButton(wine: widget.wine),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Spacings.wineCardPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.wine.year.toString(),
                    style: const TextStyle(
                      fontSize: Spacings.textFontSize,
                      color: AppColors.primaryGrey,
                    ),
                  ),
                  const SizedBox(height: Spacings.widgetVertical),
                  Text(
                    widget.wine.name,
                    style: const TextStyle(
                      color: AppColors.primaryText,
                      fontSize: Spacings.titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: Spacings.widgetVertical),
                  Text(
                    '${widget.wine.volume} ml',
                    style: const TextStyle(
                      fontSize: Spacings.textFontSize,
                      color: AppColors.primaryGrey,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: Spacings.wineCardPadding,
              left: Spacings.wineCardPadding,
              child: Text(
                '${cheapestPrice?.toStringAsFixed(2)}€',
                style: const TextStyle(
                  color: AppColors.primaryText,
                  fontSize: Spacings.titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: cardWidth / 4.5, bottom: Spacings.widgetVertical),
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
              padding: EdgeInsets.only(right: cardWidth / 9, bottom: Spacings.widgetVertical),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FutureBuilder<bool>(
                  future: _isImageValid,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryGrey),
                      );
                    } else if (snapshot.hasError || !snapshot.data!) {
                      return Image.asset(
                        bottleImage,
                        height: cardHeight / 2,
                        fit: BoxFit.contain,
                      );
                    } else {
                      return Image.network(
                        widget.wine.imageURL,
                        height: cardHeight / 2,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            bottleImage,
                            height: cardHeight / 2,
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
