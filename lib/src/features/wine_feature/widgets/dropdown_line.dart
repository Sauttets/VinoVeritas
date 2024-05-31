import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';

class DropDownIndicator extends StatelessWidget {
  final bool down;

  const DropDownIndicator({Key? key, required this.down}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Spacings.vertical),
      color: AppColors.primaryWhite,
      child: Column(
        children: [
          Icon(
            down ? Icons.arrow_drop_down : Icons.arrow_drop_up,
            color: AppColors.primaryGrey,
            size: Spacings.iconSizeSmall,
          ),
          const Divider(
            color: AppColors.primaryGrey,
            thickness: Spacings.lineBorder,
            indent: Spacings.horizontal,
            endIndent: Spacings.horizontal,
          ),
        ],
      ),
    );
  }
}