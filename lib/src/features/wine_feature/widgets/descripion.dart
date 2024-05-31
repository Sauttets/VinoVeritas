import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/dropdown_line.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/taste_pallet.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/description.dart';

class Description extends StatefulWidget {
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widget Testseite'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListView(
            children: [
              GestureDetector(
                onTap: _toggleExpanded,
                child: DropDownIndicator(down: !_isExpanded),
              ),
              if (_isExpanded) ...[
                TastePallet(
                  flavor1: 'Dunkle Beeren',
                  flavor2: 'Zimt',
                  flavor3: 'Leder',
                  fit1: 'Wildschwein',
                  fit2: 'Rind',
                  fit3: 'Schwein',
                ),
                Description(description: "Beschreibung des Weins"),
                GestureDetector(
                  onTap: _toggleExpanded,
                  child: DropDownIndicator(down: true),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}