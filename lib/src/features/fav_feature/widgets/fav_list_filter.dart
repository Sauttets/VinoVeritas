/* import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/fav_feature/widgets/fav_liste.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/filter_feature.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/search_bar.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/wine_card.dart';

class WineListPage extends StatefulWidget {
  final List<WineEntry> wineEntries;
  final List<WineFavList> wineFavLists;

  const WineListPage({
    Key? key,
    required this.wineEntries,
    required this.wineFavLists,
  }) : super(key: key);

  @override
  _WineListPageState createState() => _WineListPageState();
}

class _WineListPageState extends State<WineListPage> {
  String selectedList = '';
  bool isFilterExpanded = false;
  bool isListExpanded = false;

  void handleListExpanded(bool expanded) {
    if (expanded && isFilterExpanded) {
      setState(() {
        isFilterExpanded = false;
      });
    }
  }

  void handleFilterExpanded(bool expanded) {
    if (expanded && isListExpanded) {
      setState(() {
        isListExpanded = false;
      });
    }
  }

  void handleSelectedListChanged(String list) {
    setState(() {
      selectedList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const WineSearchBar(),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: WineListSelector(
                    wineFavLists: widget.wineFavLists,
                    selfName: selectedList,
                    onSelectedListChanged: handleSelectedListChanged,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: FilterSort(onExpanded: handleFilterExpanded),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: widget.wineEntries.length,
                itemBuilder: (context, index) {
                  final wine = widget.wineEntries[index];
                  return WineItemCard(
                    year: wine.year,
                    name: wine.name,
                    volume: wine.volume,
                    price: wine.price,
                    imagePath: wine.imagePath,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 */