import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/static_text.dart';

class OnboaringFeatureDisclaimer extends StatelessWidget {
  const OnboaringFeatureDisclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacings.widgetPaddingAll),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(Spacings.cornerRadius),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StaticText.featureDisclaimerTitle,
            style: TextStyle(fontSize: Spacings.textFontSize),
          ),
          SizedBox(height: Spacings.disclaimerSpacing),
          Row(
            children: [
              Icon(Icons.wine_bar),
              SizedBox(width: Spacings.widgetVertical),
              Text(
                StaticText.feature1Title,
                style: TextStyle(fontSize: Spacings.titleFontSize, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: Spacings.widgetVertical),
          Text(
            StaticText.feature1Text,
            style: TextStyle(fontSize: Spacings.textFontSize),
          ),
          SizedBox(height: Spacings.disclaimerSpacing),
          Row(
            children: [
              Icon(Icons.favorite_border),
              SizedBox(width: Spacings.widgetVertical),
              Text(
                StaticText.feature2Title,
                style: TextStyle(fontSize: Spacings.titleFontSize, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: Spacings.widgetVertical),
          Text(
            StaticText.feature2Text,
            style: TextStyle(fontSize: Spacings.textFontSize),
          ),
          SizedBox(height: Spacings.disclaimerSpacing),
          Row(
            children: [
              Icon(Icons.menu_book),
              SizedBox(width: Spacings.widgetVertical),
              Text(
                StaticText.feature3Title,
                style: TextStyle(fontSize: Spacings.textFontSize, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: Spacings.widgetVertical),
          Text(
            StaticText.feature3Text,
            style: TextStyle(fontSize: Spacings.textFontSize),
          ),
        ],
      ),
    );
  }
}
