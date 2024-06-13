import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/wine_card.dart';

class WineListSelector extends StatefulWidget {
  final String selfName;
  final List<WineFavList> wineFavLists;

  const WineListSelector({
    Key? key,
    required this.wineFavLists,
    required this.selfName,
  }) : super(key: key);

  @override
  _WineListSelectorState createState() => _WineListSelectorState();
}

class _WineListSelectorState extends State<WineListSelector> {
  late String selectedList;
  late List<WineFavList> wineFavLists;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    wineFavLists = widget.wineFavLists;
    selectedList = wineFavLists.first.name;
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(Spacings.vertical), // Padding for dropdown menu
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryGrey),
                borderRadius: BorderRadius.circular(Spacings.cornerRadius),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacings.horizontal,
                        vertical: Spacings.horizontal,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedList,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            isExpanded
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: AppColors.primaryGrey,
                          ),
                        ],
                      ),
                    ),
                    if (isExpanded)
                      ...wineFavLists.map((WineFavList list) {
                        return Column(
                          children: [
                            // ignore: avoid_print
                            
                            if (list.name != selectedList)
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedList = list.name;
                                    wineFavLists.remove(list);
                                    wineFavLists.insert(0, list);
                                    isExpanded = false;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Spacings.horizontal,
                                    vertical: Spacings.horizontal,
                                  ),
                                  child: Text(
                                    list.name,
                                    style: TextStyle(
                                      fontWeight: list.name == selectedList
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            if (list != wineFavLists.last)
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 7.0,
                                ),
                                child: Divider(
                                  color: AppColors.primaryGrey,
                                  thickness: Spacings.lineHorizontalThickness,
                                ),
                              ),
                          ],
                        );
                      }).toList(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: WineListPage(
              wineEntries: wineFavLists
                  .firstWhere((list) => list.name == selectedList)
                  .wineEntries,
            ),
          ),
        ],
      ),
    );
  }
}

class WineFavList {
  final String name;
  final List<WineEntry> wineEntries;

  WineFavList({required this.name, required this.wineEntries});
}