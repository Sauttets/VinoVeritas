import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/FilterSortTaste.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/search_bar.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/wine_card.dart';

class LikePageLayout extends StatefulWidget {
  const LikePageLayout({super.key});

  @override
  LikePageLayoutState createState() => LikePageLayoutState();
}

class LikePageLayoutState extends State<LikePageLayout> {
  List<WineEntry> _wineEntries = [];

  @override
  void initState() {
    super.initState();
    _wineEntries = _getWineEntries('1'); // Initialize with the first wine list
  }

  List<WineEntry> _getWineEntries(String id) {
    // Replace with actual logic to get wine entries based on id
    if (id == '1') {
      return [
        WineEntry(
          year: '2019',
          name: 'Tanz der Tanine',
          volume: '750ml',
          price: '34,00€',
          wineImagePath: 'assets/images/RotweinFlasche.png',
          glassImagePath: 'assets/images/RotweinGlas.png',
        ),
        WineEntry(
          year: '2019',
          name: 'Tanz der Tanine',
          volume: '750ml',
          price: '34,00€',
          wineImagePath: 'assets/images/RotweinFlasche.png',
          glassImagePath: 'assets/images/RotweinGlas.png',
        ),
      ];
    } else if (id == '2') {
      return [
        WineEntry(
          year: '2020',
          name: 'Bilbos Best',
          volume: '750ml',
          price: '40,00€',
          wineImagePath: 'assets/images/WeißweinFlasche.png',
          glassImagePath: 'assets/images/WeißweinGlas.png',
        ),
        WineEntry(
          year: '2020',
          name: 'Bilbos Best',
          volume: '750ml',
          price: '40,00€',
          wineImagePath: 'assets/images/WeißweinFlasche.png',
          glassImagePath: 'assets/images/WeißweinGlas.png',
        ),
      ];
    } else if (id == '3') {
      return [
        WineEntry(
          year: '2021',
          name: 'Frodos Favorite',
          volume: '750ml',
          price: '50,00€',
          wineImagePath: 'assets/images/RoseweinFlasche.png',
          glassImagePath: 'assets/images/RoseweinGlas.png',
        ),
        WineEntry(
          year: '2021',
          name: 'Frodos Favorite',
          volume: '750ml',
          price: '50,00€',
          wineImagePath: 'assets/images/RoseweinFlasche.png',
          glassImagePath: 'assets/images/RoseweinGlas.png',
        ),
      ];
    } else if (id == '4') {
      return [
        WineEntry(
          year: '2022',
          name: 'Sams Selection',
          volume: '750ml',
          price: '60,00€',
        ),
        WineEntry(
          year: '2022',
          name: 'Sams Selection',
          volume: '750ml',
          price: '60,00€',
        ),
      ];
    } else {
      return [];
    }
  }

  void _onWineListChanged(FavlistTupel selectedWineList) {
    setState(() {
      _wineEntries = _getWineEntries(selectedWineList.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<FavlistTupel> wineLists = [
      FavlistTupel(id: '1', name: 'Gandalfs Weinliste'),
      FavlistTupel(id: '2', name: 'Bilbos Weinliste'),
      FavlistTupel(id: '3', name: 'Frodos Weinliste'),
      FavlistTupel(id: '4', name: 'Sams Weinliste'),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const WineSearchBar(),
            const FilterSortTaste(),
            WineDropdown(wineLists: wineLists, onChanged: _onWineListChanged),
            Expanded(
              child: WinePage(wineEntries: _wineEntries),
            ),
          ],
        ),
      ),
    );
  }
}

class FavlistTupel {
  final String id;
  final String name;

  FavlistTupel({required this.id, required this.name});
}

class WineDropdown extends StatefulWidget {
  final List<FavlistTupel> wineLists;
  final ValueChanged<FavlistTupel> onChanged;

  const WineDropdown({super.key, required this.wineLists, required this.onChanged});

  @override
  WineDropdownState createState() => WineDropdownState();
}

class WineDropdownState extends State<WineDropdown> {
  late String _selectedWineList;

  @override
  void initState() {
    super.initState();
    _selectedWineList = widget.wineLists.first.name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(50),
          color: Colors.white, // Background color set to white
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _selectedWineList,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            isDense: true,
            onChanged: (String? newValue) {
              setState(() {
                _selectedWineList = newValue!;
                final selectedWineList = widget.wineLists.firstWhere((wineList) => wineList.name == newValue);
                widget.onChanged(selectedWineList);
              });
            },
            items: widget.wineLists.map<DropdownMenuItem<String>>((FavlistTupel favlistTupel) {
              return DropdownMenuItem<String>(
                value: favlistTupel.name,
                child: Text(favlistTupel.name),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
