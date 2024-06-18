import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';

class FilterSort extends StatefulWidget {
  const FilterSort({super.key});

  @override
  FilterSortState createState() => FilterSortState();
}

class FilterSortState extends State<FilterSort> {
  String? selectedWineType = 'Alle';
  String? selectedSortOption = 'Beliebteste zuerst';
  bool isExpanded = false;

  void selectWineType(String type) {
    setState(() {
      if (selectedWineType == type) {
        selectedWineType = 'Alle'; // Default selection
      } else {
        selectedWineType = type; // Selection
      }
    });
  }

  void selectSortOption(String option) {
    setState(() {
      if (selectedSortOption == option) {
        selectedSortOption = 'Beliebteste zuerst'; // Default selection
      } else {
        selectedSortOption = option; // Selection
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Spacings.horizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: IntrinsicWidth(
                  child: Container(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primaryWhite,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColors.primaryGrey),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sortieren  ',
                          style: TextStyle(fontSize: Spacings.textFontSize),
                        ),
                        Icon(Icons.tune, color: AppColors.primaryGrey),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (isExpanded) ...[
              const SizedBox(height: Spacings.horizontal), // Vertical spacing
              Container(
                padding: const EdgeInsets.all(Spacings.horizontal),
                decoration: BoxDecoration(
                  color: AppColors.primaryWhite,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.primaryGrey),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            buildFilterOption('Alle', selectedWineType, selectWineType),
                            const SizedBox(height: Spacings.buttonSpacing),
                            buildFilterOption('Rotwein', selectedWineType, selectWineType),
                            const SizedBox(height: Spacings.buttonSpacing),
                            buildFilterOption('Weißwein', selectedWineType, selectWineType),
                            const SizedBox(height: Spacings.buttonSpacing),
                            buildFilterOption('Rosé', selectedWineType, selectWineType),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        thickness: 1,
                        color: AppColors.primaryGrey,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            buildFilterOption('Beliebteste zuerst', selectedSortOption, selectSortOption),
                            const SizedBox(height: Spacings.buttonSpacing),
                            buildFilterOption('Preis (Niedrig - Hoch)', selectedSortOption, selectSortOption),
                            const SizedBox(height: Spacings.buttonSpacing),
                            buildFilterOption('Preis (Hoch - Niedrig)', selectedSortOption, selectSortOption),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget buildFilterOption(String text, String? selectedValue, Function(String) onSelect) {
    bool isSelected = text == selectedValue;
    return GestureDetector(
      onTap: () => onSelect(text),
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: Spacings.buttonSpacing, bottom: Spacings.buttonSpacing),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed : AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: isSelected ? AppColors.primaryRed : AppColors.primaryGrey),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? AppColors.primaryWhite : Colors.black,
          ),
        ),
      ),
    );
  }
}
