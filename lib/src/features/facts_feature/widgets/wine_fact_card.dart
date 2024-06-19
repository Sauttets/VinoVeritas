import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';

class WineFactCard extends StatelessWidget {
  final String fact;

  const WineFactCard({super.key, required this.fact});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Makes the container take the full width of the screen
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ensures the column takes minimum height needed
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Weinfakt des Tages:',
            style: TextStyle(
              color: AppColors.black,
              fontSize: Spacings.titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            fact,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: Spacings.textFontSize,
            ),
          ),
        ],
      ),
    );
  }
}
