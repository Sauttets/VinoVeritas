import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';

class HeartButton extends StatefulWidget {
  const HeartButton({super.key});

  @override
  HeartButtonState createState() => HeartButtonState();
}

class HeartButtonState extends State<HeartButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryGrey,
        ),
        child: Center(
          child: Transform.translate(
            offset: const Offset(0, 3), // Move the heart 2 pixels down
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
