import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/dropdown_line.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/taste_pallet.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/description.dart';

class FullDescription extends StatefulWidget {
  @override
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
              const Description(description: "description of somthing boring kadf ou ipuehfpaeiufhpiugh phepf9uhadiufhapdiugh puhfpiuaehf piahedfpihapiudghiuahdfpiuhaipdufh   wiufh paiufh piauhdfpahfüawef apdhfpaieuf paiehfp asdhfpiuh apiufh"),
              TastePallet(flavor1: 'Leder', fit1: 'Fisch'),
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
