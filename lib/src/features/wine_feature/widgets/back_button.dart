import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';

class BackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackButton ({
    super.key, 
    this.onPressed
    });

  @override
   Widget build(BuildContext context) {
    return Container(
      width: Spacings.buttonContainerSize,
      height: Spacings.buttonContainerSize,
      decoration: const BoxDecoration(
        color: AppColors.primaryWhite,
        shape: BoxShape.circle,
        /* boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ], */
      ),
      child: Center(
        child: IconButton(
          icon: const Icon(Icons.undo, color: AppColors.primaryText, size: Spacings.buttonSize),
          onPressed: onPressed,
        ),
      ),
    );
  }
}