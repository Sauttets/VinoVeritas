import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/heartbutton.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/description.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/taste_pallet.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/back_button.dart' as bb;
import 'package:vinoveritas/src/features/wine_feature/widgets/full_description.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/dropdown_line.dart';


class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widget Testseite'),
        ),
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListView(
            children:  [
             
              const Description(description: "description of somthing boring kadf ou ipuehfpaeiufhpiugh phepf9uhadiufhapdiugh puhfpiuaehf piahedfpihapiudghiuahdfpiuhaipdufh   wiufh paiufh piauhdfpahfüawef apdhfpaieuf paiehfp asdhfpiuh apiufh"),
              
              FullDescription(),
              TastePallet(flavor1: 'Leder', fit1: 'Fisch')
             //füge weitere Widgets hinzu
            ],
          ),
        ),
      ),
    );
  }
}