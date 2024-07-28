import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';

class ExpandableWineFactCard extends StatefulWidget {
  final String title;
  final String content;

  const ExpandableWineFactCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  ExpandableWineFactCardState createState() => ExpandableWineFactCardState();
}

class ExpandableWineFactCardState extends State<ExpandableWineFactCard> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Spacings.horizontal),
          border: Border.all(color: AppColors.primaryGrey),
          color: AppColors.white,
        ),
        child: InkWell(
          onTap: _toggleExpanded,
          borderRadius: BorderRadius.circular(Spacings.cornerRadius),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: Spacings.textFontSize,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.primaryGrey,
                    ),
                  ],
                ),
                if (_isExpanded) ...[
                  const SizedBox(height: 8.0),
                  Text(
                    widget.content,
                    style: const TextStyle(
                      fontSize: Spacings.textFontSize,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
