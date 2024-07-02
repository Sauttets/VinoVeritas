import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/homepage_feature/controller/wine_cubit.dart';

class FavlistTupel {
  final String shareCode;
  final String name;

  FavlistTupel({required this.shareCode, required this.name});
}

class WineDropdown extends StatefulWidget {
  const WineDropdown({super.key});

  @override
  WineDropdownState createState() => WineDropdownState();
}

class WineDropdownState extends State<WineDropdown> {
  late String _selectedWineList;

  @override
  void initState() {
    super.initState();
    _selectedWineList = wineLists.first.name;
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
                final selectedWineList = wineLists.firstWhere((wineList) => wineList.name == newValue);
                context.read<WineCubit>().fetchFavlistWines(selectedWineList.shareCode);
              });
            },
            items: wineLists.map<DropdownMenuItem<String>>((FavlistTupel favlistTupel) {
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

  List<FavlistTupel> wineLists = [
    FavlistTupel(shareCode: '1', name: 'Gandalfs Weinliste'),
    FavlistTupel(shareCode: '2', name: 'Bilbos Weinliste'),
    FavlistTupel(shareCode: '3', name: 'Frodos Weinliste'),
    FavlistTupel(shareCode: '4', name: 'Sams Weinliste'),
  ];
}
