import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/homepage_feature/controller/wine_cubit.dart';
import 'package:vinoveritas/src/features/homepage_feature/model/wine_model.dart';
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
        context.read<WineCubit>().toggleFavorite(widget.wine);
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
            offset: const Offset(0, 1), // Move the heart 2 pixels down
            child: Icon(
              Icons.favorite,
              color: isPressed ? AppColors.heartRed : AppColors.primaryWhite,
              size: 25, // Increase the size of the heart
            ),
          ),
        ),
      ),
    );
  }
}
