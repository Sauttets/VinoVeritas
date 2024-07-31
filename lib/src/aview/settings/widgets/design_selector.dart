import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/static_text.dart';

class DesignSelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const DesignSelector({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacings.widgetHorizontal),
      child: SizedBox(
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: Spacings.widgetHorizontal),
              child: const Text(
                StaticText.design,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: Spacings.textFontSize,
                  color: AppColors.primaryText,
                ),
              ),
            ),
            SizedBox(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(Spacings.roundEnd),
                ),
                child: Row(
                  children: [
                    _buildButton(0, StaticText.autoMode),
                    _buildButton(1, StaticText.lightMode),
                    _buildButton(2, StaticText.darkMode),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(int index, String text) {
    bool isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTabSelected(index);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: Spacings.widgetVertical),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryRed : AppColors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: Spacings.textFontSize,
                color: isSelected ? AppColors.contrastOnRed : AppColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
