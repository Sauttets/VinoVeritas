import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/homepage_feature/model/wine_model.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/attribut_slider.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/bottle_widget.dart';

class WineDetailTop extends StatelessWidget {
  final Wine wine;

  const WineDetailTop({super.key, required this.wine});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double topPadding = screenWidth * 0.25;

    // Find the cheapest price from the list of supermarkets
    double cheapestPrice = wine.supermarkets.isNotEmpty
        ? wine.supermarkets.map((supermarket) => supermarket.price).reduce((value, element) => value < element ? value : element)
        : 0.0;

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: AttSlider(
            price: cheapestPrice,
            volume: wine.volume.toInt(),
            trockenValue: wine.dryness,
            sauerValue: wine.acidity,
            tanninValue: wine.tanninLevel,
          ),
        ),
        Positioned(
          left: 16.0,
          bottom: 0,
          child: BottleWidget(
            title: wine.name,
            imagePath: wine.imageURL,
            isLiked: wine.isLiked,  
          ),
        ),
      ],
    );
  }
}
