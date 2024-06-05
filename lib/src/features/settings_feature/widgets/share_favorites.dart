import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DisplayAndCopyText extends StatelessWidget {
  final String text;

  const DisplayAndCopyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Teile deine Favoriten:',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 391.0,
          height: 44.0,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(text),
              ),
              IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: text));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
