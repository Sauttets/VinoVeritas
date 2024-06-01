import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // Import this for accessing MediaQuery
import 'package:vinoveritas/util/spacings.dart';

class WineFactCard extends StatelessWidget {
  final String content;

  const WineFactCard({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width;
    return Container(
      width: cardWidth,
      padding: const EdgeInsets.symmetric(horizontal: Spacings.horizontal),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Spacings.cornerRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Weinfakt des Tages",
                style: TextStyle(
                  fontSize: Spacings.titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                content,
                style: const TextStyle(
                  fontSize: Spacings.textFontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
