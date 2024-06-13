import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';

class FilterSort extends StatefulWidget {
  const FilterSort({Key? key}) : super(key: key);

  @override
  _FilterSortState createState() => _FilterSortState();
}

class _FilterSortState extends State<FilterSort> {
  String selectedWineType = 'Rotwein';
  String selectedSortOption = 'Beliebteste zuerst';
  bool isExpanded = false;

  void selectWineType(String type) {
    setState(() {
      selectedWineType = type;
    });
  }

  void selectSortOption(String option) {
    setState(() {
      selectedSortOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(Spacings.horizontal),
              decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: BorderRadius.circular(Spacings.cornerRadius),
                border: Border.all(color: AppColors.primaryGrey),
              ),
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
          if (isExpanded) ...[
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(Spacings.horizontal),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryWhite,
                    borderRadius: BorderRadius.circular(Spacings.cornerRadius),
                    border: Border.all(color: AppColors.primaryGrey),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            buildFilterOption('Rotwein', selectedWineType, selectWineType),
                            //buildDivider(),
                            buildFilterOption('Weißwein', selectedWineType, selectWineType),
                            //buildDivider(),
                            buildFilterOption('Rosé', selectedWineType, selectWineType),
                            //buildDivider(),
                            buildFilterOption('Andere', selectedWineType, selectWineType),
                          ],
                        ),
                      ),
                      const VerticalDivider(thickness: 1, color: AppColors.primaryGrey),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            buildFilterOption('Preis (Niedrig - Hoch)', selectedSortOption, selectSortOption),
                            //buildDivider(),
                            buildFilterOption('Beliebteste zuerst', selectedSortOption, selectSortOption),
                            //buildDivider(),
                            buildFilterOption('Im Angebot', selectedSortOption, selectSortOption),
                            //buildDivider(),
                            buildFilterOption('Preis (Hoch - Niedrig)', selectedSortOption, selectSortOption),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget buildFilterOption(String text, String selectedValue, Function(String) onSelect) {
    bool isSelected = text == selectedValue;
    return GestureDetector(
      onTap: () => onSelect(text),
      child: Container(
        padding: const EdgeInsets.all(Spacings.horizontal),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed : AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(Spacings.cornerRadius),
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

  Widget buildDivider() {
    return const Padding(
      padding:  EdgeInsets.symmetric(vertical: Spacings.vertical),
      child: Divider(color: AppColors.primaryGrey, thickness: Spacings.lineHorizontalThickness),
    );
  }
}
