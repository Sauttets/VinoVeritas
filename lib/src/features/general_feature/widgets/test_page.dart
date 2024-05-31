import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/heartbutton.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/description.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/back_button.dart' as bb;
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
              const DropDownIndicator(down: true),
              const Description(description: "description of somthing boring kadf ou ipuehfpaeiufhpiugh phepf9uhadiufhapdiugh puhfpiuaehf piahedfpihapiudghiuahdfpiuhaipdufh   wiufh paiufh piauhdfpahfüawef apdhfpaieuf paiehfp asdhfpiuh apiufh"),
              bb.BackButton(onPressed: () {
                // Hier wird die Platzhalterfunktionalität ausgeführt
                print('Back button pressed');
              },),
              const HeartButton(),
              const DropDownIndicator(down: false),
             //füge weitere Widgets hinzu
            ],
          ),
        ),
      ),
    );
  }
}