import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/homepage_feature/aview/widgets/heartbutton.dart';
import 'package:vinoveritas/src/features/homepage_feature/model/wine_model.dart';
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
    double bottleHeight = screenWidth * 0.65; // Example: 70% of the screen width

    return Container(
      width: screenWidth,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  wine.imageURL,
                  height: bottleHeight, // Dynamic height based on screen width
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/RotweinFlasche.png',
                      height: bottleHeight,
                    );
                  },
                ),
                const SizedBox(width: 16.0), // Padding between the bottle and the title
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0), // Padding from the top side
                        child: Text(
                          wine.name,
                          style: const TextStyle(
                            fontSize: Spacings.titleFontSize * 1.2, // You can adjust the font size as needed
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left, // Align text to the left
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 60,
              top: 110,
              child: HeartButton(wine: wine),
            ),
          ],
        ),
      ),
    );
  }
}
