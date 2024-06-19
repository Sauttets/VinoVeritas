import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/wine_card.dart';

class WineListSelector extends StatefulWidget {
  final String selfName;
  final WineFavList wineFavList;

  const WineListSelector({
    super.key,
    required this.wineFavList,
    required this.selfName,
  });

  @override
  _WineListSelectorState createState() => _WineListSelectorState();
}

class _WineListSelectorState extends State<WineListSelector> {
  late String selectedList;
  late WineFavList wineFavList;
  bool isExpanded = false;
  bool isFilterExpanded = false;
  String? selectedWineType;
  String? selectedSortOption;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    wineFavList = widget.wineFavList;
    selectedList = wineFavList.attributes.keys.firstWhere(
      (key) => key == widget.selfName,
      orElse: () => wineFavList.attributes.keys.first,
    );
  }

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

  void _toggleDropdown() {
    if (isExpanded) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      isExpanded = true;
    });
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    setState(() {
      isExpanded = false;
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: offset.dx,
        top: offset.dy + size.height,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height),
          child: Material(
            elevation: 4.0,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: wineFavList.attributes.length > 4 ? 200.0 : double.infinity,
              ),
              child: wineFavList.attributes.length > 4
                  ? Scrollbar(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children: wineFavList.attributes.keys.map((String key) {
                          return Column(
                            children: [
                              if (key != selectedList)
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedList = key;
                                      _closeDropdown();
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: Spacings.horizontal,
                                        vertical: Spacings.vertical),
                                    child: Text(
                                      key,
                                      style: TextStyle(
                                        fontWeight: key == selectedList
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              if (key != wineFavList.attributes.keys.last)
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7.0),
                                  child: Divider(
                                    color: AppColors.primaryGrey,
                                    thickness: Spacings.lineHorizontalThickness,
                                  ),
                                ),
                            ],
                          );
                        }).toList(),
                      ),
                    )
                  : Column(
                      children: wineFavList.attributes.keys.map((String key) {
                        return Column(
                          children: [
                            if (key != selectedList)
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedList = key;
                                    _closeDropdown();
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Spacings.horizontal,
                                      vertical: Spacings.vertical),
                                  child: Text(
                                    key,
                                    style: TextStyle(
                                      fontWeight: key == selectedList
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            if (key != wineFavList.attributes.keys.last)
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 7.0),
                                child: Divider(
                                  color: AppColors.primaryGrey,
                                  thickness: Spacings.lineHorizontalThickness,
                                ),
                              ),
                          ],
                        );
                      }).toList(),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: Spacings.vertical),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CompositedTransformTarget(
                      link: _layerLink,
                      child: GestureDetector(
                        onTap: _toggleDropdown,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5 -
                              2 * Spacings.horizontal,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryGrey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Spacings.horizontal,
                                    vertical: Spacings.horizontal),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        selectedList,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
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
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFilterExpanded = !isFilterExpanded;
                          if (isFilterExpanded) isExpanded = false;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5 -
                            2 * Spacings.horizontal,
                        padding: const EdgeInsets.all(Spacings.horizontal),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Filter & Sortieren',
                              style: TextStyle(
                                  fontSize: Spacings.textFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.tune, color: AppColors.primaryGrey),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (isFilterExpanded)
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
                                buildFilterOption('Rotwein', selectedWineType,
                                    selectWineType),
                                const SizedBox(height: Spacings.horizontal),
                                buildFilterOption('Weißwein', selectedWineType,
                                    selectWineType),
                                const SizedBox(height: Spacings.horizontal),
                                buildFilterOption(
                                    'Rosé', selectedWineType, selectWineType),
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
                                buildFilterOption('Preis (Niedrig - Hoch)',
                                    selectedSortOption, selectSortOption),
                                const SizedBox(height: Spacings.horizontal),
                                buildFilterOption('Preis (Hoch - Niedrig)',
                                    selectedSortOption, selectSortOption),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: Spacings.horizontal),
                Expanded(
                  child: WinePage(
                    wineEntries: wineFavList.attributes[selectedList]!,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilterOption(
      String text, String? selectedValue, Function(String) onSelect) {
    bool isSelected = text == selectedValue;
    return GestureDetector(
      onTap: () => onSelect(text),
      child: Container(
        padding: const EdgeInsets.all(Spacings.horizontal),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed : AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              color: isSelected ? AppColors.primaryRed : AppColors.primaryGrey),
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

  Widget buildSortOption(String text, String sortType) {
    return GestureDetector(
      onTap: () {
        // Add your sort logic here
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}


class WineFavList {
  final Map<String, List<WineEntry>> attributes;
  WineFavList(this.attributes);
}
