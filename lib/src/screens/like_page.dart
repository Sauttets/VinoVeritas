import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/filter_sort_taste.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/search_bar.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/wine_card.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/wine_data.dart';

class LikePageLayout extends StatefulWidget {
  const LikePageLayout({super.key});

  @override
  LikePageLayoutState createState() => LikePageLayoutState();
}

class LikePageLayoutState extends State<LikePageLayout> {
  List<Wine> _wines = [];

  @override
  void initState() {
    super.initState();
    _wines = _getWines('1'); // Initialize with the first wine list
  }

  List<Wine> _getWines(String id) {
    // Replace with actual logic to get wines based on id
    if (id == '1') {
      return [
        Wine(
          id: 1,
          name: 'Tanz der Tanine',
          year: 2019,
          country: 'Germany',
          type: 'rot',
          description: 'A rich red wine with a hint of oak.',
          imageURL: 'assets/images/RotweinFlasche.png',
          volume: 750,
          volAlc: 13.5,
          isLiked: true,
          dryness: 5.0,
          acidity: 4.5,
          tanninLevel: 4.0,
          flavours: ['Fruchtig', 'Kräutrig', 'Buttrig'],
          fitsTo: ['Rindfleisch', 'Lamm', 'Käse'],
          supermarkets: [
            Supermarket(
              name: 'Supermarket A',
              street: '123 Wine St',
              postalCode: '12345',
              city: 'Wineland',
              houseNumber: '1',
              price: 34.00,
              img: 'assets/images/Logo_Edeka.png',
            ),
          ],
        ),
      ];
    } else if (id == '2') {
      return [
        Wine(
          id: 2,
          name: 'Bilbos Best',
          year: 2020,
          country: 'Germany',
          type: 'weiss',
          description: 'A smooth white wine with floral notes.',
          imageURL: 'assets/images/WeißweinFlasche.png',
          volume: 750,
          volAlc: 12.0,
          isLiked: true,
          dryness: 0.4,
          acidity: 0.2,
          tanninLevel: 0.87,
          flavours: ['Fruchtig', 'Kräutrig', 'Buttrig'],
          fitsTo: ['Rindfleisch', 'Lamm', 'Käse'],
          supermarkets: [
            Supermarket(
              name: 'Supermarket B',
              street: '456 Wine Rd',
              postalCode: '67890',
              city: 'Grapeville',
              houseNumber: '2',
              price: 40.00,
              img: 'assets/images/Logo_Edeka.png',
            ),
          ],
        ),
      ];
    } else {
      return [];
    }
  }

  void _onWineListChanged(FavlistTupel selectedWineList) {
    setState(() {
      _wines = _getWines(selectedWineList.id);
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
              child: WinePage(wines: _wines),
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
