import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/static_text.dart';

class AttributeIndicator extends StatelessWidget {
  final double price;
  final int volume;
  final double trockenValue;
  final double sauerValue;
  final double tanninValue;

  const AttributeIndicator({
    super.key,
    required this.price,
    required this.volume,
    required this.trockenValue,
    required this.sauerValue,
    required this.tanninValue,
  });

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    final leftSpaceWidth = totalWidth * 0.25;
    final indicatorWidth = totalWidth * 0.75;

    return Card(
      elevation: 5,
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: leftSpaceWidth),
                Text(
                  '${price.toStringAsFixed(2)}€  -  $volume ml',
                  style: const TextStyle(fontSize: Spacings.titleFontSize, fontWeight: FontWeight.bold, color: AppColors.primaryText),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildIndicatorRow(context, StaticText.dryness, trockenValue, indicatorWidth, leftSpaceWidth),
            _buildIndicatorRow(context, StaticText.acidity, sauerValue, indicatorWidth, leftSpaceWidth),
            _buildIndicatorRow(context, StaticText.tanninLevel, tanninValue, indicatorWidth, leftSpaceWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicatorRow(BuildContext context, String leftLabel, double value, double indicatorWidth, double leftSpaceWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: leftSpaceWidth),
              Expanded(
                child: Text(leftLabel, style: const TextStyle(color: AppColors.primaryText)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              SizedBox(width: leftSpaceWidth),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 8,
                      width: indicatorWidth,
                      decoration: BoxDecoration(
                        color: AppColors.primaryGrey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Positioned(
                      left: (value * (indicatorWidth - 8)).clamp(0, indicatorWidth - 8),
                      child: Container(
                        height: 8,
                        width: 15,
                        decoration: BoxDecoration(
                          color: AppColors.heartRed,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}