import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';

class HeartButton extends StatefulWidget {
  const HeartButton({super.key});

  @override
  HeartButtonState createState() => HeartButtonState();
}

class HeartButtonState extends State<HeartButton> {
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    double buttonSize = 60.0; // Increase the size of the heart icon
    double containerSize = 80.0; // Adjust the size of the container

    return GestureDetector(
      onTap: toggleLike,
      child: Container(
        width: containerSize,
        height: containerSize,
        decoration: const BoxDecoration(
          color: AppColors.primaryGrey,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Transform.translate(
            offset: const Offset(0, 2), // move the heart a little bit down
            child: Icon(
              Icons.favorite,
              color: isLiked ? AppColors.heartRed : AppColors.primaryWhite,
              size: buttonSize, // Set the size of the heart icon
            ),
          ),
        ),
      ),
    );
  }
}
