import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/filter/filter_sort_taste.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/filter/search_bar.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/favorite_page/favorite_list_selector.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/wine_card_grid.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/controller/wine_cubit.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/controller/wine_state.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/model/favlist_tupel.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/repository/wine_repository.dart';
import 'package:vinoveritas/src/services/persistence_service/isar_service.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/static_text.dart';

class HomeFavPage extends StatefulWidget {
  final bool showFavList;

  const HomeFavPage({super.key, required this.showFavList});

  @override
  HomeFavPageState createState() => HomeFavPageState();
}

class HomeFavPageState extends State<HomeFavPage> {
  late Future<List<FavlistTupel>> _wineLists;
  late String initialShareCode;

  @override
  void initState() {
    super.initState();
    _wineLists = IsarService().getSharedLists().then((lists) {
      if (lists.isNotEmpty) {
        initialShareCode = lists.first.shareCode;
      } else {
        initialShareCode = '';
      }
      return lists;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: FutureBuilder<List<FavlistTupel>>(
          future: _wineLists,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryRed),
              ));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text(StaticText.noWineLists));
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
                    if (widget.showFavList) FavoriteListSelector(wineLists: snapshot.data!),
                    Expanded(
                      child: BlocBuilder<WineCubit, WineState>(
                        builder: (context, state) {
                          if (state is WineLoading && state.wines.isEmpty) {
                            return const Center(child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryRed),
                            ));
                          } else if (state is WineError && state.wines.isEmpty) {
                            return Center(child: Text(state.message));
                          } else {
                            return WineCardGrid(wines: state.wines, hasReachedMax: state.hasReachedMax);
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
