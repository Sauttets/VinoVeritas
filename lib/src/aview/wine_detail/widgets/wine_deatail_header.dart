import 'package:flutter/material.dart';
import 'package:vinoveritas/src/model/home_and_favorite/wine_model.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'attribut_indicator.dart';
import 'bottle_widget.dart';

class WineDetailsHeader extends StatelessWidget {
  final Wine wine;

  const WineDetailsHeader({super.key, required this.wine});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double topPadding = screenWidth * 0.25;

    double cheapestPrice = wine.supermarkets.isNotEmpty
        ? wine.supermarkets.map((supermarket) => supermarket.price).reduce((value, element) => value < element ? value : element)
        : 0.0;

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: AttributeIndicator(
            price: cheapestPrice,
            volume: wine.volume.toInt(),
            trockenValue: wine.dryness,
            sauerValue: wine.acidity,
            tanninValue: wine.tanninLevel,
          ),
        ),
        Positioned(
          left: Spacings.widgetHorizontal,
          child: BottleWidget(
            wine: wine,
          ),
        ),
      ],
    );
  }
}
