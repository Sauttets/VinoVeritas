import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';


class AttSlider extends StatelessWidget {
  final double price;
  final int volume;
  final double trockenValue;
  final double sauerValue;
  final double tanninValue;

  const AttSlider({
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
    final indicatorWidth = totalWidth * 0.75; // Adjusted to fit within the card padding

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: leftSpaceWidth), // 1/4 of the total width
                Text(
                  '${price.toStringAsFixed(2)}€  -  $volume ml',
                  style: const TextStyle(fontSize: Spacings.titleFontSize, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildIndicatorRow(context, 'Trockenheit', trockenValue, indicatorWidth, leftSpaceWidth),
            _buildIndicatorRow(context, 'Säuregehalt', sauerValue, indicatorWidth, leftSpaceWidth),
            _buildIndicatorRow(context, 'Tannin Level', tanninValue, indicatorWidth, leftSpaceWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicatorRow(BuildContext context, String leftLabel, double value, double indicatorWidth, double leftSpaceWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0), // Reduce space between sliders
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: leftSpaceWidth), // 1/4 of the total width
              Expanded(
                child: Text(leftLabel),
              ),
            ],
          ),
          const SizedBox(height: 4), // Reduce space between labels and slider
          Row(
            children: [
              SizedBox(width: leftSpaceWidth), // 1/4 of the total width
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 8,
                      width: indicatorWidth,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Positioned(
                      left: (value * (indicatorWidth - 8)).clamp(0, indicatorWidth - 8), // Ensure marker stays within bounds
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: Colors.red,
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