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
  // ignore: library_private_types_in_public_api
  _ExpandableWineFactCardState createState() => _ExpandableWineFactCardState();
}

class _ExpandableWineFactCardState extends State<ExpandableWineFactCard> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Spacings.horizontal, vertical: 3.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Spacings.horizontal),
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
                              fontSize: Spacings.titleFontSize,
                              fontWeight: FontWeight.bold,
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
