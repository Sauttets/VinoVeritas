import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';

class Description extends StatelessWidget {
  final String description;

  const Description({
    super.key, 
    required this.description,
    });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Beschreibung:',
            style: TextStyle(
              fontSize: Spacings.titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              fontSize: Spacings.textFontSize,
            ),
          ),
        ],
      );
}