import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/static_text.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/controller/wine_cubit.dart';

class WineSearchBar extends StatefulWidget {
  const WineSearchBar({super.key});

  @override
  WineSearchBarState createState() => WineSearchBarState();
}

class WineSearchBarState extends State<WineSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Spacings.vertical,
        left: Spacings.horizontal,
        right: Spacings.horizontal,
      ),
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(Spacings.roundEnd),
          border: Border.all(
            color: AppColors.primaryGrey,
          ),
        ),
        child: TextField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: StaticText.searchHint,
            hintStyle: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.normal,
            ),
            prefixIcon: Icon(Icons.search, color: AppColors.primaryText),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: Spacings.widgetHorizontal),
          ),
          onSubmitted: (query) {
            context.read<WineCubit>().applyFilters(searchQuery: query);
          },
        ),
      ),
    );
  }
}
