import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';

class WineSearchBar extends StatelessWidget {
  const WineSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Spacings.horizontal, right: Spacings.horizontal, top: 28),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Suche...',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          ),
        ),
      ),
    );
  }
}
