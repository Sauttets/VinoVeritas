import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/filter_sort_taste.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/search_bar.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/wine_card.dart';
import 'package:vinoveritas/src/features/homepage_feature/controller/wine_cubit.dart';
import 'package:vinoveritas/src/features/homepage_feature/controller/wine_state.dart';
import 'package:vinoveritas/src/features/homepage_feature/model/wine_model.dart';
import 'package:vinoveritas/src/features/homepage_feature/repository/wine_repository.dart';

class WinePageLayout extends StatelessWidget {
  const WinePageLayout({super.key});

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

class WineGridView extends StatefulWidget {
  final List<Wine> wines;
  final bool hasReachedMax;

  const WineGridView({super.key, required this.wines, required this.hasReachedMax});

  @override
  _WineGridViewState createState() => _WineGridViewState();
}

class _WineGridViewState extends State<WineGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<WineCubit>().fetchWines();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.75,
      ),
      itemCount: widget.hasReachedMax ? widget.wines.length : widget.wines.length + 1,
      itemBuilder: (context, index) {
        if (index >= widget.wines.length) {
          return Center(child: Text('No more wines'));
        } else {
          return WineCard(wine: widget.wines[index]);
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
