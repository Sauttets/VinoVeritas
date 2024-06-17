import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';

class FilterSort extends StatefulWidget {
  const FilterSort({super.key});

  @override
  _FilterSortState createState() => _FilterSortState();
}

class _FilterSortState extends State<FilterSort> {
  String? selectedWineType;
  String? selectedSortOption;
  bool isExpanded = false;

  void selectWineType(String type) {
    setState(() {
      if (selectedWineType == type) {
        selectedWineType = null; // Deselection
      } else {
        selectedWineType = type; // Selection
      }
    });
  }

  void selectSortOption(String option) {
    setState(() {
      if (selectedSortOption == option) {
        selectedSortOption = null; // Deselection
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
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5 - Spacings.horizontal * 2,
                padding: const EdgeInsets.all(Spacings.horizontal),
                decoration: BoxDecoration(
                  color: AppColors.primaryWhite,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.primaryGrey),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter & Sortieren',
                        style: TextStyle(fontSize: Spacings.textFontSize, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.tune, color: AppColors.primaryGrey),
                    ],
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
                            buildFilterOption('Rotwein', selectedWineType, selectWineType),
                            const SizedBox(height: Spacings.horizontal),
                            buildFilterOption('Weißwein', selectedWineType, selectWineType),
                            const SizedBox(height: Spacings.horizontal),
                            buildFilterOption('Rosé', selectedWineType, selectWineType),
                            const SizedBox(height: Spacings.horizontal),
                            buildFilterOption('Andere', selectedWineType, selectWineType),
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
                            buildFilterOption('Preis (Niedrig - Hoch)', selectedSortOption, selectSortOption),
                            const SizedBox(height: Spacings.horizontal),
                            buildFilterOption('Beliebteste zuerst', selectedSortOption, selectSortOption),
                            const SizedBox(height: Spacings.horizontal),
                            buildFilterOption('Im Angebot', selectedSortOption, selectSortOption),
                            const SizedBox(height: Spacings.horizontal),
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
        padding: const EdgeInsets.all(Spacings.horizontal),
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
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
