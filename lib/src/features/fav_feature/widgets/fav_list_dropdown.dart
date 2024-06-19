import 'package:flutter/material.dart';
import 'package:vinoveritas/src/screens/like_page.dart';

class WineDropdown extends StatefulWidget {
  final List<FavlistTupel> wineLists;

  const WineDropdown({super.key, required this.wineLists});

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