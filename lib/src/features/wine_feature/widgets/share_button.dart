import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';

class ShareButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ShareButton ({
    super.key, 
    this.onPressed
    });

  @override
   Widget build(BuildContext context) {
    return Container(
      width: Spacings.buttonContainerSize,
      height: Spacings.buttonContainerSize,
      decoration: const BoxDecoration(
        color: AppColors.secondaryGrey,
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
          icon: const Icon(Icons.share_rounded, color: AppColors.primaryText, size: Spacings.buttonSize),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
