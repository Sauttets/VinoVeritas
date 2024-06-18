import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/tasteMaps.dart';

class TasteMenue extends StatefulWidget {
  const TasteMenue({super.key});

  @override
  _TasteMenueState createState() => _TasteMenueState();
}

class _TasteMenueState extends State<TasteMenue> {
  bool isExpanded = false;
  String selectedCategory = 'Essen';
  List<String> selectedEssen = [];
  List<String> selectedGeschmack = [];

 List<String> get foodOptionsLeft {
    final options = fitsforIcons.keys.toList();
    final midpoint = (options.length + 1) ~/ 2;
    return options.take(midpoint).toList();
  }

  List<String> get tasteOptionsLeft {
    final options = tasteIcons.keys.toList();
    final midpoint = (options.length + 1) ~/ 2;
    return options.take(midpoint).toList();
  }

  List<String> get foodOptionsRight {
    final options = fitsforIcons.keys.toList();
    final midpoint = (options.length + 1) ~/ 2;
    return options.skip(midpoint).toList();
  }

  List<String> get tasteOptionsRight {
    final options = tasteIcons.keys.toList();
    final midpoint = (options.length + 1) ~/ 2;
    return options.skip(midpoint).toList();
  }

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void toggleSelection(String option, List<String> selectedOptions) {
    setState(() {
      if (selectedOptions.contains(option)) {
        selectedOptions.remove(option);
      } else {
        selectedOptions.add(option);
      }
    });
  }

  Widget buildOptionChip(String option, List<String> selectedOptions) {
    bool isSelected = selectedOptions.contains(option);
    return GestureDetector(
      onTap: () => toggleSelection(option, selectedOptions),
      child: Container(
        padding: const EdgeInsets.all(Spacings.horizontal),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed : AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: isSelected ? AppColors.primaryRed : AppColors.primaryGrey),
        ),
        child: Row(
          children: [
            const SizedBox(height: 16),
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

  @override
  Widget build(BuildContext context) {
    //double buttonHeight = 56.0;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Spacings.horizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(Spacings.horizontal),
                decoration: BoxDecoration(
                  color: AppColors.primaryWhite,
                  //borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.primaryGrey),
                ),
                child: GestureDetector(
                  onTap: toggleExpansion,
                  child: Container(
                    //height: buttonHeight,
                    color: AppColors.primaryWhite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Essen & Geschmack',
                          style: TextStyle(color: AppColors.primaryText, fontSize: Spacings.textFontSize),
                        ),
                        Icon(
                          isExpanded ? Icons.expand_less : Icons.expand_more,
                          color: AppColors.primaryGrey,
                        ),
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
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppColors.primaryGrey),
                        ),
                        child: ToggleButtons(
                          borderWidth: 0,
                          isSelected: [selectedCategory == 'Essen', selectedCategory == 'Geschmack'],
                          onPressed: (index) {
                            setState(() {
                              selectedCategory = index == 0 ? 'Essen' : 'Geschmack';
                            });
                          },
                          borderRadius: BorderRadius.circular(30),
                          selectedColor: AppColors.primaryWhite,
                          fillColor: AppColors.primaryRed,
                          constraints: BoxConstraints(
                            minWidth: (MediaQuery.of(context).size.width - 4 * Spacings.horizontal - 4) / 2,
                            //minHeight: buttonHeight,
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                'Essen',
                                style: TextStyle(
                                  color: selectedCategory == 'Essen' ? AppColors.primaryWhite : AppColors.primaryText,
                                  fontSize: Spacings.textFontSize,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                'Geschmack',
                                style: TextStyle(
                                  color: selectedCategory == 'Geschmack' ? AppColors.primaryWhite : AppColors.primaryText,
                                  fontSize: Spacings.textFontSize,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Spacings.vertical),
                      Row(
                        children: [
                          const Padding(padding: EdgeInsets.all(Spacings.horizontal)),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: selectedCategory == 'Essen'
                                  ? foodOptionsLeft
                                      .map((option) => Column(
                                            children: [
                                              buildOptionChip(option, selectedEssen),
                                              const SizedBox(height: Spacings.vertical),
                                            ],
                                          ))
                                      .toList()
                                  : tasteOptionsLeft
                                      .map((option) => Column(
                                            children: [
                                              buildOptionChip(option, selectedGeschmack),
                                              const SizedBox(height: Spacings.vertical),
                                            ],
                                          ))
                                      .toList(),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: selectedCategory == 'Essen'
                                  ? foodOptionsRight
                                      .map((option) => Column(
                                            children: [
                                              buildOptionChip(option, selectedEssen),
                                              const SizedBox(height: Spacings.vertical),
                                            ],
                                          ))
                                      .toList()
                                  : tasteOptionsRight
                                      .map((option) => Column(
                                            children: [
                                              buildOptionChip(option, selectedGeschmack),
                                              const SizedBox(height: Spacings.vertical),
                                            ],
                                          ))
                                      .toList(),
                            ),
                          ),
                        ],
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
}