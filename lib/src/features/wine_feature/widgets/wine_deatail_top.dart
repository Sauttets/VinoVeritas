import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/attribut_slider.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/bottle_widget.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/wine_data.dart';

class WineDetailTop extends StatelessWidget {
  final Wine wine;

  const WineDetailTop({super.key, required this.wine});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double topPadding = screenWidth * 0.25;

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: AttSlider(
            price: wine.supermarkets.isNotEmpty ? wine.supermarkets[0].price : 0.0,
            volume: wine.volume,
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
