import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/controller/home_and_favorite/wine_cubit.dart';
import 'package:vinoveritas/src/model/home_and_favorite/wine_model.dart';
import 'package:vinoveritas/util/app_colors.dart';

class HeartButton extends StatefulWidget {
  final Wine wine;

  const HeartButton({super.key, required this.wine});

  @override
  HeartButtonState createState() => HeartButtonState();
}

class HeartButtonState extends State<HeartButton> {
  late bool isPressed;

  @override
  void initState() {
    super.initState();
    isPressed = widget.wine.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final cubit = context.read<WineCubit>();
        cubit.toggleFavorite(widget.wine);
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: Container(
        width: 33,
        height: 33,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryGrey,
        ),
        child: Center(
          child: Transform.translate(
            offset: const Offset(0, 1),
            child: Icon(
              Icons.favorite,
              color: isPressed ? AppColors.heartRed : AppColors.white,
              size: 25, 
            ),
          ),
        ),
      ),
    );
  }
}
