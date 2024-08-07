import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/controller/wine_cubit.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/model/wine_model.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/wine_card.dart';
import 'package:vinoveritas/util/spacings.dart';

class WineCardGrid extends StatefulWidget {
  final List<Wine> wines;
  final bool hasReachedMax;

  const WineCardGrid({super.key, required this.wines, required this.hasReachedMax});

  @override
  WineCardGridState createState() => WineCardGridState();
}

class WineCardGridState extends State<WineCardGrid> {
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
        crossAxisSpacing: Spacings.widgetHorizontal,
        mainAxisSpacing: Spacings.widgetVertical,
        childAspectRatio: 0.75,
      ),
      itemCount: widget.hasReachedMax ? widget.wines.length : widget.wines.length + 1,
      itemBuilder: (context, index) {
        if (index >= widget.wines.length) {
          return const Center(child: Text(''));
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
