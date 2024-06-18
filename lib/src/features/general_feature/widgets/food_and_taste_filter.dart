import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/tasteMaps.dart';

class TasteMenu extends StatefulWidget {
  const TasteMenu({super.key});

  @override
  TasteMenuState createState() => TasteMenuState();
}

class TasteMenuState extends State<TasteMenu> {
  bool isExpanded = false;
  String selectedCategory = 'Essen';
  String? selectedOption;

  List<String> get options => selectedCategory == 'Essen' ? fitsforIcons.keys.toList() : tasteIcons.keys.toList();

  void toggleExpansion() => setState(() => isExpanded = !isExpanded);

  void toggleSelection(String option) => setState(() => selectedOption = selectedOption == option ? null : option);

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
                fontWeight: FontWeight.bold,
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
      onTap: () => setState(() => selectedCategory = category),
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
                onTap: toggleExpansion,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                        isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: AppColors.primaryGrey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (isExpanded) ...[
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
      ),
    );
  }
}
