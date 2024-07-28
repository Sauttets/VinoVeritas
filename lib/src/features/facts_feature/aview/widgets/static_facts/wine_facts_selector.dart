import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';

class WineFactsSelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const WineFactsSelector({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonWidth = screenWidth / 4 - 5; 

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(Spacings.roundEnd),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildButton(0, 'Weinbau', buttonWidth),
              _buildButton(1, 'Kellerei', buttonWidth),
              _buildButton(2, 'Geschmack', buttonWidth),
              _buildButton(3, 'Sonstiges', buttonWidth),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildButton(int index, String text, double width) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        onTabSelected(index);
      },
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: Spacings.widgetVertical),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed : AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
