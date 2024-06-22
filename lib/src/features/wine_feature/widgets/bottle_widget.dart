import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';

class BottleWidget extends StatelessWidget {
  final String title;
  final String? imagePath;

  const BottleWidget({
    super.key,
    required this.title,
    this.imagePath,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imagePath ?? 'assets/images/RotweinFlasche.png',
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0), // Padding from the top side
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: Spacings.titleFontSize, // You can adjust the font size as needed
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
