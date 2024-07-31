import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/static_text.dart';

class WineFactOfTheDay extends StatelessWidget {
  final String fact;

  const WineFactOfTheDay({super.key, required this.fact});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(Spacings.cornerRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            StaticText.wineFactOfTheDay,
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
