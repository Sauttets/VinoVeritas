import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';

class WineFactCard extends StatelessWidget {
  final String title;
  final String content;

  const WineFactCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacings.horizontal),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Spacings.cornerRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: Spacings.titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                content,
                style: const TextStyle(
                  fontSize: Spacings.textFontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
