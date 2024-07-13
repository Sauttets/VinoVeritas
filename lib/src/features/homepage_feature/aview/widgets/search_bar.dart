import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';

class WineSearchBar extends StatelessWidget {
  const WineSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Spacings.horizontal, 
        right: Spacings.horizontal, 
        top: 28
      ),
      child: Container(
        height: 40.0, // Set the desired height here
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppColors.primaryGrey, // Set the border color here
            width: 1.0, // Set the border width here
          ),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Suche...',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 10.0), // Adjust vertical padding as needed
          ),
        ),
      ),
    );
  }
}
