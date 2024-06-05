import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';

class HeartButton extends StatelessWidget {
  const HeartButton({super.key});

  @override
  Widget build(BuildContext context) {
    // double buttonSize = 50.0; // Size of the heart icon
    // double containerSize = 68.0; // Size of the container

    return LikeButton(
      size: Spacings.buttonContainerSize, // Increase the size of the button
      isLiked: false,
      animationDuration: const Duration(milliseconds: 0),
      likeBuilder: (bool isLiked) {
        return Container(
          width: Spacings.buttonContainerSize,
          height: Spacings.buttonContainerSize,
          decoration: const BoxDecoration(
            color: AppColors.primaryGrey,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0), // Add padding at the top
            child: Center(
              child: Icon(
                Icons.favorite,
                color: isLiked ? AppColors.heartRed : AppColors.primaryWhite,
                size: Spacings.buttonSize, // Set the size of the heart icon
              ),
            ),
          ),
        );
      },
    );
  }
}
