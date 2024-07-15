import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/taste_maps.dart';
import 'package:vinoveritas/src/features/homepage_feature/controller/wine_cubit.dart';

class FilterSortTaste extends StatefulWidget {
  const FilterSortTaste({super.key});

  @override
  FilterSortTasteState createState() => FilterSortTasteState();
}

class FilterSortTasteState extends State<FilterSortTaste> {
  String? selectedWineType = 'all';
  String? selectedSortOption = 'most-liked';
  bool isFilterSortExpanded = false;
  bool isTasteMenuExpanded = false;
  String selectedCategory = 'Essen';
  String? selectedOption;

  List<String> get options => selectedCategory == 'Essen' ? fitsforIcons.keys.toList() : tasteIcons.keys.toList();

  void toggleFilterSortExpansion() {
    setState(() {
      isFilterSortExpanded = !isFilterSortExpanded;
      if (isFilterSortExpanded) isTasteMenuExpanded = false;
    });
  }

  void toggleTasteMenuExpansion() {
    setState(() {
      isTasteMenuExpanded = !isTasteMenuExpanded;
      if (isTasteMenuExpanded) isFilterSortExpanded = false;
    });
  }

  void selectWineType(String type) {
    setState(() {
      if (selectedWineType == type) {
        selectedWineType = 'all'; // Default selection
      } else {
        selectedWineType = type; // Selection
      }
      context.read<WineCubit>().applyFilters(color: selectedWineType);
    });
  }

  void selectSortOption(String option) {
    setState(() {
      if (selectedSortOption == option) {
        selectedSortOption = 'most-liked'; // Default selection
      } else {
        selectedSortOption = option; // Selection
      }
      context.read<WineCubit>().applyFilters(sort: selectedSortOption);
    });
  }

  void toggleSelection(String option) {
    setState(() {
      if (selectedOption == option) {
        selectedOption = null; // Deselect if already selected
      } else {
        selectedOption = option; // Select new option
      }
      context.read<WineCubit>().applyFilters(fitOrFlavour: selectedOption);
    });
  }

  Widget buildOptionChip(String option) {
    bool isSelected = selectedOption == option;
    return GestureDetector(
      onTap: () => toggleSelection(option),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: Spacings.buttonSpacing),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed : AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: isSelected ? AppColors.primaryRed : AppColors.primaryGrey),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              selectedCategory == 'Essen' ? fitsforIcons[option] : tasteIcons[option],
              color: selectedCategory == 'Essen' ? fitsColors[option] : tasteColors[option],
              size: 20.0,
            ),
            const SizedBox(width: 8),
            Text(
              option,
              style: TextStyle(
                color: isSelected ? AppColors.primaryWhite : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryButton(String category) {
    bool isSelected = selectedCategory == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
          selectedOption = null; // Deselect the current option when category changes
        });
        context.read<WineCubit>().applyFilters(fitOrFlavour: null);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: Spacings.buttonSpacing),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed : AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected ? AppColors.primaryWhite : AppColors.primaryText,
            fontSize: Spacings.textFontSize,
          ),
        ),
      ),
    );
  }

  Widget buildFilterOption(String text, String selectedValue, Function(String) onSelect) {
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
          _getDisplayName(text),
          style: TextStyle(
            color: isSelected ? AppColors.primaryWhite : Colors.black,
          ),
        ),
      ),
    );
  }

  String _getDisplayName(String value) {
    switch (value) {
      case 'all':
        return 'Alle';
      case 'red':
        return 'Rotwein';
      case 'white':
        return 'Weißwein';
      case 'rose':
        return 'Rosé';
      case 'most-liked':
        return 'Beliebteste zuerst';
      case 'low-high':
        return 'Preis (Niedrig - Hoch)';
      case 'high-low':
        return 'Preis (Hoch - Niedrig)';
      default:
        return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacings.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: toggleTasteMenuExpansion,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.primaryWhite,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColors.primaryGrey),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Essen & Geschmack',
                        style: TextStyle(color: AppColors.primaryText, fontSize: Spacings.textFontSize),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        isTasteMenuExpanded ? Icons.expand_less : Icons.expand_more,
                        color: AppColors.primaryGrey,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: toggleFilterSortExpansion,
                child: IntrinsicWidth(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
            ],
          ),
          if (isFilterSortExpanded) ...[
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
                          buildFilterOption('all', selectedWineType!, selectWineType),
                          const SizedBox(height: Spacings.buttonSpacing),
                          buildFilterOption('red', selectedWineType!, selectWineType),
                          const SizedBox(height: Spacings.buttonSpacing),
                          buildFilterOption('white', selectedWineType!, selectWineType),
                          const SizedBox(height: Spacings.buttonSpacing),
                          buildFilterOption('rose', selectedWineType!, selectWineType),
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
                          buildFilterOption('most-liked', selectedSortOption!, selectSortOption),
                          const SizedBox(height: Spacings.buttonSpacing),
                          buildFilterOption('low-high', selectedSortOption!, selectSortOption),
                          const SizedBox(height: Spacings.buttonSpacing),
                          buildFilterOption('high-low', selectedSortOption!, selectSortOption),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (isTasteMenuExpanded) ...[
            const SizedBox(height: Spacings.horizontal),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.primaryGrey),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryGrey), // Add border here
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildCategoryButton('Essen'),
                        const SizedBox(width: 8),
                        buildCategoryButton('Geschmack'),
                      ],
                    ),
                  ),
                  const SizedBox(height: Spacings.vertical),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      for (int i = 0; i < options.length; i += 2)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(child: buildOptionChip(options[i])),
                            const SizedBox(width: 8),
                            if (i + 1 < options.length)
                              Expanded(child: buildOptionChip(options[i + 1])),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
