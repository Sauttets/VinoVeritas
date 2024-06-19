import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/fav_feature/widgets/fav_liste.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/food_and_taste_filter.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/search_bar.dart';


class FavoritePage extends StatelessWidget {
  final String user;
  final WineFavList wineFavList;


  const FavoritePage({super.key, required this.user, required this.wineFavList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0), // Additional padding above
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  const WineSearchBar(),
                  const TasteMenu(),
                  WineListSelector(selfName: user, wineFavList: wineFavList),
                ],)

                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
