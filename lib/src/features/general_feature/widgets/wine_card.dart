import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';

class WineCard extends StatelessWidget {
  final String year;
  final String name;
  final String volume;
  final String price;
  final int glassImageIndex;
  final int bottleImageIndex;

  final glassImages = [
    'assets/images/RotweinGlas.png',
    'assets/images/WeißweinGlas.png',
    'assets/images/RoseweinGlas.png',
  ];
  final bottleImages = [
    'assets/images/RotweinFlasche.png',
    'assets/images/RoseweinFlasche.png',
    'assets/images/WeißweinFlasche.png',
  ];

  WineCard({super.key, 
    required this.year,
    required this.name,
    required this.volume,
    required this.price,
    required this.glassImageIndex,
    required this.bottleImageIndex,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth / 2, // Half the width of the screen
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: AppColors.black,
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            year,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            name,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            volume,
            style: const TextStyle(
              fontSize: 16.0,
              color: AppColors.primaryGrey,
            ),
          ),
          const SizedBox(height: 8.0),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                child: Image.asset(
                  glassImages[glassImageIndex],
                  height: 80.0, // Adjusted height for the glass
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 40,
                bottom: 0,
                child: Image.asset(
                  bottleImages[bottleImageIndex],
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            price,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}