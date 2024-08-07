import 'package:flutter/material.dart';
import 'package:vinoveritas/util/static_text.dart';
import 'package:vinoveritas/util/taste_maps.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';

class TastePallet extends StatelessWidget {
  final String flavor1;
  final String? flavor2;
  final String? flavor3;

  final String fit1;
  final String? fit2;
  final String? fit3;

  const TastePallet({
    super.key,
    required this.flavor1,
    this.flavor2,
    this.flavor3,
    required this.fit1,
    this.fit2,
    this.fit3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 5.0, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Spacings.cornerRadius),
            ),
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(Spacings.horizontal),                
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildColumn(StaticText.taste, flavor1, flavor2, flavor3, true)),
                      Container(
                        width: 1.0,
                        color: AppColors.primaryGrey,
                        margin: const EdgeInsets.symmetric(horizontal: Spacings.horizontal),
                      ),
                      Expanded(child: _buildColumn(StaticText.fitsTo, fit1, fit2, fit3, false)),
                    ],
                  ),
                ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildColumn(String title, String? item1, String? item2, String? item3, bool isFlavorColumn) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: Spacings.titleFontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: Spacings.widgetVertical),
        _buildItem(item1, isFlavorColumn),
        if (item2 != null || item3 != null) const Divider(color: AppColors.primaryGrey),
        _buildItem(item2, isFlavorColumn),
        if (item3 != null) const Divider(color: AppColors.primaryGrey),
        _buildItem(item3, isFlavorColumn),
      ],
    );
  }

  Widget _buildItem(String? item, bool isFlavorColumn) {
    if (item == null) return const SizedBox.shrink();
    IconData? iconData = isFlavorColumn ? tasteIcons[item] : fitsforIcons[item];
    Color? iconColor = isFlavorColumn ? tasteColors[item] : fitsColors[item];
    return Row(
      children: [
        Icon(
          iconData,
          color: iconColor,
          size: Spacings.sortIconSize,
        ),
        const SizedBox(width: Spacings.widgetHorizontal),
        Text(item, style: const TextStyle(color: AppColors.primaryText)),
      ],
    );
  }
}
