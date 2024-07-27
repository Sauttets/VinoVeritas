import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';

class WineSearchBar extends StatelessWidget {
  const WineSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Spacings.vertical,
        left: Spacings.horizontal, 
        right: Spacings.horizontal, 
      ),
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(Spacings.roundEnd),
          border: Border.all(
            color: AppColors.primaryGrey,
          ),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Suche...',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: Spacings.widgetHorizontal),
          ),
        ),
      ),
    );
  }
}
