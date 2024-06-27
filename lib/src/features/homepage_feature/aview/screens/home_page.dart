// wine_page_layout.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/filter_sort_taste.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/search_bar.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/wine_card.dart';
import 'package:vinoveritas/src/features/homepage_feature/controller/wine_cubit.dart';
import 'package:vinoveritas/src/features/homepage_feature/controller/wine_state.dart';
import 'package:vinoveritas/src/features/homepage_feature/repository/wine_repository.dart';

class WinePageLayout extends StatelessWidget {
  const WinePageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: BlocProvider(
            create: (context) => WineCubit(wineRepository: WineRepository())..fetchWines(),
            child: Column(
              children: [
                const WineSearchBar(),
                const FilterSortTaste(),
                Expanded(
                  child: BlocBuilder<WineCubit, WineState>(
                    builder: (context, state) {
                      if (state is WineLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is WineLoaded) {
                        return NotificationListener<ScrollNotification>(
                          onNotification: (ScrollNotification scrollInfo) {
                            if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !state.hasReachedMax) {
                              context.read<WineCubit>().fetchMoreWines();
                            }
                            return false;
                          },
                          child: GridView.builder(
                            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16.0,
                              mainAxisSpacing: 16.0,
                              childAspectRatio: 0.83, // 5:6 aspect ratio
                            ),
                            itemCount: state.wines.length,
                            itemBuilder: (context, index) {
                              final wine = state.wines[index];
                              return WineCard(wine: wine);
                            },
                          ),
                        );
                      } else if (state is WineError) {
                        return Center(child: Text(state.message));
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
