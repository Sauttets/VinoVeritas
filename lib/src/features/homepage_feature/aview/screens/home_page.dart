import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/filter_sort_taste.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/search_bar.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/wine_dropdown.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/wine_grid_view.dart';
import 'package:vinoveritas/src/features/homepage_feature/controller/wine_cubit.dart';
import 'package:vinoveritas/src/features/homepage_feature/controller/wine_state.dart';
import 'package:vinoveritas/src/features/homepage_feature/repository/wine_repository.dart';

class WinePageLayout extends StatelessWidget {
  final bool showFavList;

  const WinePageLayout({super.key, required this.showFavList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => WineCubit(wineRepository: WineRepository())..fetchWines(),
          child: Column(
            children: [
              const WineSearchBar(),
              const FilterSortTaste(),
              if (showFavList) const WineDropdown(),
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
        ),
      ),
    );
  }
}