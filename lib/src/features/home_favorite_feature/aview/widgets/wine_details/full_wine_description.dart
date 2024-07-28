import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/wine_details/dropdown_line.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/wine_details/taste_pallet.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/wine_details/description.dart';
import 'package:vinoveritas/util/spacings.dart';

class FullWineDescription extends StatefulWidget {
  final TastePallet tastePallet;
  final Description description;

  const FullWineDescription({super.key, 
  required this.tastePallet, 
  required this.description
  });

  @override
  FullWineDescriptionState createState() => FullWineDescriptionState();
}

class FullWineDescriptionState extends State<FullWineDescription> {
  bool _isExpanded = true;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
