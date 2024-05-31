import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/description.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/taste_pallet.dart';


class TestPage extends StatelessWidget {
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
              TastePallet(flavor1: 'Dunkle Beeren', flavor2: 'Zimt', flavor3: 'Leder', fit1: 'Wildschwein', fit2: 'Reh', fit3: 'Fisch',),
              const Description(description: "description of somthing boring kadf ou ipuehfpaeiufhpiugh phepf9uhadiufhapdiugh puhfpiuaehf piahedfpihapiudghiuahdfpiuhaipdufh   wiufh paiufh piauhdfpahfüawef apdhfpaieuf paiehfp asdhfpiuh apiufh"),
              // Füge hier weitere Widgets hinzu
            ],
          ),
        ),
      ),
    );
  }
}