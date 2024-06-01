import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';

class Description extends StatelessWidget {
  final String description;

  const Description({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: Spacings.horizontal),
    child: Column(
      // Wrap the Card with a Column to control the vertical space
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity, // Breite der Karte auf maximale Breite setzen
          child: Card(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Spacings.cornerRadius),
            ),
            color: AppColors.primaryWhite,
            child: Padding(
              padding: const EdgeInsets.all(Spacings.horizontal),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Beschreibung:",
                    style: TextStyle(
                      fontSize: Spacings.titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: Spacings.horizontal),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: Spacings.textFontSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


}
