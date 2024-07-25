import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/controller/wine_cubit.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/model/favlist_tupel.dart';
import 'package:vinoveritas/util/app_colors.dart';

class FavoriteListSelector extends StatefulWidget {
  final List<FavlistTupel> wineLists;

  const FavoriteListSelector({super.key, required this.wineLists});

  @override
  FavoriteListSelectorState createState() => FavoriteListSelectorState();
}

class FavoriteListSelectorState extends State<FavoriteListSelector> {
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
          border: Border.all(color: AppColors.primaryGrey),
          borderRadius: BorderRadius.circular(50),
          color: AppColors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _selectedWineList,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: AppColors.black, fontSize: 16),
            isDense: true,
            onChanged: (String? newValue) {
              setState(() {
                _selectedWineList = newValue!;
                final selectedWineList = widget.wineLists.firstWhere((wineList) => wineList.name == newValue);
                context.read<WineCubit>().fetchFavlistWines(selectedWineList.shareCode);
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
