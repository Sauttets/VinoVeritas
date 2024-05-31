import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';

class TastePallet extends StatelessWidget {
  final String flavor1;
  final String? flavor2;
  final String? flavor3;

  final String fit1;
  final String? fit2;
  final String? fit3;

  final Map<String, IconData> tasteIcons = {
    'Dunkle Beeren': Icons.cake,
    'Zimt': Icons.airplanemode_on,
    'Leder': Icons.local_bar,
    'Nelke': Icons.beach_access,
    'Unterholz': Icons.restaurant,
  };

  final Map<String, IconData> fitsfor = {
    'Wildschwein': Icons.cake,
    'Rind': Icons.security,
    'Schwein': Icons.local_bar,
    'Fisch': Icons.beach_access,
    'Pasta': Icons.restaurant,
    'Reh': Icons.restaurant,
  };

  final Map<String, Color> tasteColors = {
    'Dunkle Beeren': Colors.purple,
    'Zimt': Colors.brown,
    'Leder': Colors.brown.shade700,
    'Nelke': Colors.orange,
    'Unterholz': Colors.green,
  };

  final Map<String, Color> fitsColors = {
    'Wildschwein': Colors.pink,
    'Rind': Colors.red,
    'Schwein': Colors.pinkAccent,
    'Fisch': Colors.blue,
    'Pasta': Colors.yellow,
    'Reh': Colors.brown,
  };

  TastePallet({
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacings.horizontal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Spacings.cornerRadius),
              ),
              color: AppColors.primaryWhite,
              child: Padding(
                padding: const EdgeInsets.all(Spacings.horizontal),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200.0), // Set your desired max height here
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildColumn("Geschmacksnoten:", flavor1, flavor2, flavor3, true)),
                        Container(
                          width: 1.0,
                          color: AppColors.primaryGrey,
                          margin: const EdgeInsets.symmetric(horizontal: Spacings.horizontal),
                        ),
                        Expanded(child: _buildColumn("Passt gut zu:", fit1, fit2, fit3, false)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
          ),
        ),
        const SizedBox(height: 8.0),
        _buildItem(item1, isFlavorColumn),
        if (item2 != null || item3 != null) const Divider(color: AppColors.primaryGrey, height: 20.0),
        _buildItem(item2, isFlavorColumn),
        if (item3 != null) const Divider(color: AppColors.primaryGrey, height: 20.0),
        _buildItem(item3, isFlavorColumn),
      ],
    );
  }

  Widget _buildItem(String? item, bool isFlavorColumn) {
    if (item == null) return const SizedBox.shrink();
    IconData? iconData = isFlavorColumn ? tasteIcons[item] : fitsfor[item];
    Color? iconColor = isFlavorColumn ? tasteColors[item] : fitsColors[item];
    return Row(
      children: [
        Icon(
          iconData,
          color: iconColor,
          size: 20.0,
        ),
        const SizedBox(width: 8.0),
        Text(item),
      ],
    );
  }
}
