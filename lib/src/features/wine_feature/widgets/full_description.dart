import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/dropdown_line.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/taste_pallet.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/description.dart';
import 'package:vinoveritas/util/spacings.dart';

class FullDescription extends StatefulWidget {
  final TastePallet tastePallet;
  final Description description;

  const FullDescription({super.key, 
  required this.tastePallet, 
  required this.description
  });

  @override
  // ignore: library_private_types_in_public_api
  _FullDescriptionState createState() => _FullDescriptionState();
}

class _FullDescriptionState extends State<FullDescription> {
  bool _isExpanded = true;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_isExpanded)
              GestureDetector(
                onTap: _toggleExpanded,
                child: const DropDownLine(down: true),
              ),
            if (!_isExpanded) ...[
              const SizedBox(
                height: Spacings.horizontal,
              ),
              widget.tastePallet,
              widget.description,
              GestureDetector(
                onTap: _toggleExpanded,
                child: const DropDownLine(down: false),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
