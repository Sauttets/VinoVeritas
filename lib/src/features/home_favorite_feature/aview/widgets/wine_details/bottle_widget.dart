import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/heartbutton.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/model/wine_model.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';

class BottleWidget extends StatelessWidget {
  final Wine wine;

  const BottleWidget({
    super.key,
    required this.wine,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double bottleHeight = screenWidth * 0.65;

    return Container(
      width: screenWidth,
      color: AppColors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(Spacings.widgetPaddingAll),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  wine.imageURL,
                  height: bottleHeight,
                  errorBuilder: (context, error, stackTrace) {
                    String bottleImage;
                    switch (wine.type.toLowerCase()) {
                      case 'white':
                        bottleImage = 'assets/images/WeissweinFlasche.png';
                        break;
                      case 'rose':
                        bottleImage = 'assets/images/RoseweinFlasche.png';
                        break;
                      case 'red':
                      default:
                        bottleImage = 'assets/images/RotweinFlasche.png';
                        break;
                    }
                    return Image.asset(
                      bottleImage,
                      height: bottleHeight,
                    );
                  },
                ),
                const SizedBox(width: Spacings.widgetHorizontal),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: Spacings.widgetVertical),
                        child: Text(
                          wine.name,
                          style: const TextStyle(
                            fontSize: Spacings.loginTextSize2,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: screenWidth * 0.15,
              top: bottleHeight * 0.4,
              child: HeartButton(wine: wine),
            ),
          ],
        ),
      ),
    );
  }
}
