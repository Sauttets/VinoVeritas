import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/taste_maps.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/controller/wine_cubit.dart';

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
        selectedWineType = 'all'; 
      } else {
        selectedWineType = type;
      }
      context.read<WineCubit>().applyFilters(color: selectedWineType);
    });
  }

  void selectSortOption(String option) {
    setState(() {
      if (selectedSortOption == option) {
        selectedSortOption = 'most-liked';
      } else {
        selectedSortOption = option; 
      }
      context.read<WineCubit>().applyFilters(sort: selectedSortOption);
    });
  }

  void toggleSelection(String option) {
    setState(() {
      if (selectedOption == option) {
        selectedOption = null;
      } else {
        selectedOption = option;
      }
      context.read<WineCubit>().applyFilters(fitOrFlavour: selectedOption);
    });
  }

  Widget buildOptionChip(String option) {
    bool isSelected = selectedOption == option;
    return GestureDetector(
      onTap: () => toggleSelection(option),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Spacings.widgetHorizontal, vertical: Spacings.buttonSpacing),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed : AppColors.white,
          borderRadius: BorderRadius.circular(Spacings.roundEnd),
          border: Border.all(color: isSelected ? AppColors.primaryRed : AppColors.primaryGrey),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              selectedCategory == 'Essen' ? fitsforIcons[option] : tasteIcons[option],
              color: selectedCategory == 'Essen' ? fitsColors[option] : tasteColors[option],
              size: Spacings.sortIconSize,
            ),
            const SizedBox(width: Spacings.widgetHorizontal),
            Text(
              option,
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.black,
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
          selectedOption = null;
        });
        context.read<WineCubit>().applyFilters();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Spacings.widgetHorizontal, vertical: Spacings.buttonSpacing),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed : AppColors.white,
          borderRadius: BorderRadius.circular(Spacings.roundEnd),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.primaryText,
            fontSize: Spacings.textFontSize,
          ),
        ),
      ),
    );
  }

  Widget buildFilterOption(String text, String selectedValue, void Function(String) onSelect) {
    bool isSelected = text == selectedValue;
    return GestureDetector(
      onTap: () => onSelect(text),
      child: Container(
        padding: const EdgeInsets.only(left: Spacings.widgetPaddingAll, right: Spacings.widgetPaddingAll, top: Spacings.buttonSpacing, bottom: Spacings.buttonSpacing),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed : AppColors.white,
          borderRadius: BorderRadius.circular(Spacings.roundEnd),
          border: Border.all(color: isSelected ? AppColors.primaryRed : AppColors.primaryGrey),
        ),
        child: Text(
          _getDisplayName(text),
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.primaryText,
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
                  padding: const EdgeInsets.symmetric(horizontal: Spacings.widgetHorizontal, vertical: Spacings.widgetVertical/2),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(Spacings.roundEnd),
                    border: Border.all(color: AppColors.primaryGrey),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Essen & Geschmack',
                        style: TextStyle(color: AppColors.primaryText, fontSize: Spacings.textFontSize),
                      ),
                      Icon(
                        isTasteMenuExpanded ? Icons.expand_less : Icons.expand_more,
                        color: AppColors.primaryGrey,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: Spacings.widgetHorizontal),
              GestureDetector(
                onTap: toggleFilterSortExpansion,
                child: IntrinsicWidth(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: Spacings.widgetHorizontal, vertical: Spacings.widgetVertical/2),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(Spacings.roundEnd),
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
            const SizedBox(height: Spacings.horizontal),
            Container(
              padding: const EdgeInsets.all(Spacings.horizontal),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(Spacings.filterCorner),
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
              padding: const EdgeInsets.all(Spacings.widgetPaddingAll),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(Spacings.filterCorner),
                border: Border.all(color: AppColors.primaryGrey),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryGrey),
                      borderRadius: BorderRadius.circular(Spacings.roundEnd),
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
                    runSpacing: Spacings.buttonSpacing,
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
