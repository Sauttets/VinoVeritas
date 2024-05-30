import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/description.dart';


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
            children: const [
              Description(description: "description of somthing boring kadf ou ipuehfpaeiufhpiugh phepf9uhadiufhapdiugh puhfpiuaehf piahedfpihapiudghiuahdfpiuhaipdufh   wiufh paiufh piauhdfpahfüawef apdhfpaieuf paiehfp asdhfpiuh apiufh")
              // Füge hier weitere Widgets hinzu
            ],
          ),
        ),
      ),
    );
  }
}