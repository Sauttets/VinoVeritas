import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/homepage_feature/aview/widgets/filter_sort_taste.dart';
import 'package:vinoveritas/src/features/homepage_feature/aview/widgets/search_bar.dart';
import 'package:vinoveritas/src/features/homepage_feature/aview/widgets/wine_dropdown.dart';
import 'package:vinoveritas/src/features/homepage_feature/aview/widgets/wine_grid_view.dart';
import 'package:vinoveritas/src/features/homepage_feature/controller/wine_cubit.dart';
import 'package:vinoveritas/src/features/homepage_feature/controller/wine_state.dart';
import 'package:vinoveritas/src/features/homepage_feature/model/favlist_tupel.dart';
import 'package:vinoveritas/src/features/homepage_feature/repository/wine_repository.dart';
import 'package:vinoveritas/src/services/persistence_service/isar_service.dart';
import 'package:vinoveritas/util/app_colors.dart';

class WinePageLayout extends StatefulWidget {
  final bool showFavList;

  const WinePageLayout({super.key, required this.showFavList});

  @override
  WinePageLayoutState createState() => WinePageLayoutState();
}

class WinePageLayoutState extends State<WinePageLayout> {
  late Future<List<FavlistTupel>> _wineLists;
  late String initialShareCode;

  @override
  void initState() {
    super.initState();
    _wineLists = IsarService().getSharedLists().then((lists) {
      if (lists.isNotEmpty) {
        initialShareCode = lists.first.shareCode;
      } else {
        initialShareCode = ''; // Or any default value you want to use
      }
      return lists;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryWhite, // Set your desired background color here
        body: FutureBuilder<List<FavlistTupel>>(
          future: _wineLists,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No wine lists available'));
            } else {
              return BlocProvider(
                create: (context) => WineCubit(
                  wineRepository: WineRepository(),
                  favlist: widget.showFavList,
                  shareCode: initialShareCode,
                )..fetchWines(),
                child: Column(
                  children: [
                    const WineSearchBar(),
                    const FilterSortTaste(),
                    if (widget.showFavList) WineDropdown(wineLists: snapshot.data!),
                    Expanded(
                      child: BlocBuilder<WineCubit, WineState>(
                        builder: (context, state) {
                          if (state is WineLoading && state.wines.isEmpty) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (state is WineError && state.wines.isEmpty) {
                            return Center(child: Text(state.message));
                          } else {
                            return WineGridView(wines: state.wines, hasReachedMax: state.hasReachedMax);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
