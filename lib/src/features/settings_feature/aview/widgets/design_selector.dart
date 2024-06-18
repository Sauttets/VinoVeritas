import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: 80, // Adjusted height to avoid overflow
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 18,
              padding: const EdgeInsets.only(left: 10), // Add left padding here
              child: const Text(
                'Design :',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 46, // Adjusted height to accommodate all content
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: AppColors.primaryWhite,
                  borderRadius: BorderRadius.circular(50), // Same corner radius as buttons
                ),
                child: Row(
                  children: [
                    _buildButton(0, 'Automatisch'),
                    _buildButton(1, 'Hellmodus'),
                    _buildButton(2, 'Dunkelmodus'),
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
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryRed : AppColors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                color: isSelected ? AppColors.primaryWhite : AppColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
