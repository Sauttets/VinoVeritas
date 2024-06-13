import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/description.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/taste_pallet.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/full_description.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/supermarket_selector.dart';


class TestPage extends StatelessWidget {
  final TastePallet tastePallet = TastePallet(
      flavor1: 'Zimt',
      flavor2: 'Dunkele Beeren',
      flavor3: 'Nelke',
      fit1: 'Wildschwein',
      fit2: 'Rind',
      fit3: 'Schwein');
  final Description description = const Description(
      description:
          'Dies, das, di weiß. Alles doooooo fishdfivezh öudhfgö öeuhh aöoh äu9uf098t evoiyhöogöu räau.');

  TestPage({super.key});

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
              // const sb.ShareButton(),
              // const Description(description: "description of somthing boring kadf ou ipuehfpaeiufhpiugh phepf9uhadiufhapdiugh puhfpiuaehf piahedfpihapiudghiuahdfpiuhaipdufh   wiufh paiufh piauhdfpahfüawef apdhfpaieuf paiehfp asdhfpiuh apiufh"),
              
              FullDescription(tastePallet: tastePallet, description: description),
              // TastePallet(flavor1: 'Leder', fit1: 'Fisch'),
              const SupermarketSelector(
                        name: 'EDEKA BAUR',
                        address: 'Bodanstraße 20-26',
                        postalCode: '78462 Konstanz',
                        price: '12,34€',
                        distance: '1,8km',
                        imagePath: 'assets/images/Logo_Edeka.png', // Beispielpfad für das Bild
                      ),

             //füge weitere Widgets hinzu
            ],
          ),
        ),
      ),
    );
  }
}
