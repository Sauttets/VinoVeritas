import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/static_text.dart';

class DisplayAndCopyText extends StatelessWidget {
  final String text;
  

  const DisplayAndCopyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacings.widgetVertical),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            StaticText.shareFavorites,
            style: TextStyle(
              fontSize: Spacings.textFontSize,
              color: AppColors.primaryText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacings.edge),
            child: Container(
              height: Spacings.textFieldHeight,
                padding: const EdgeInsets.only(left: Spacings.widgetHorizontal),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(Spacings.cornerRadius),
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
          ),
        ],
      ),
    );
  }
}
