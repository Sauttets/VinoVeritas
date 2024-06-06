import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';

class AttributSlider extends StatelessWidget {
  final String leftLabel;
  final String rightLabel;
  final double position;

  const AttributSlider(
      {super.key,
      required this.leftLabel,
      required this.rightLabel,
      required this.position})
      ;

//: assert(position >= 0.0 && position <= 1.0,
//            'Position must be between 0 and 1')

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(leftLabel, style: const TextStyle(fontSize: 16)),
              Text(rightLabel, style: const TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              FractionallySizedBox(
                widthFactor: position,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.heartRed,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
