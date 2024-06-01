import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';

class DropDownLine extends StatelessWidget {
  final bool down;

  const DropDownLine({super.key, required this.down});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Spacings.vertical),
      color: AppColors.backgroundColor,
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
