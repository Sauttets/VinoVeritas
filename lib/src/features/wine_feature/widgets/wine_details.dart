import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/description.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/full_description.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/supermarket_selector.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/taste_pallet.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/heartbutton.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/share_button.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/attribut_slider.dart';

const double wineWight = 100;
const double wineHeight = 368;
const double detailboxHeight = wineHeight -
    (10 * Spacings.horizontal +
        Spacings.titleFontSize +
        Spacings.textFontSize * 6 +
        2 * Spacings.vertical);

class WineDetails extends StatelessWidget {
  final String name;
  final String price;
  final String volume;
  final double dryness;
  final double acidity;
  final double taste;
  final String image;
  final TastePallet tastePallet;
  final Description description;
  final SupermarketSelector supermarket;

  const WineDetails(
      {super.key,
      required this.name,
      required this.price,
      required this.volume,
      required this.dryness,
      required this.acidity,
      required this.taste,
      required this.image,
      required this.tastePallet,
      required this.description,
      required this.supermarket});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                WineDetail1(
                    name: name,
                    price: price,
                    volume: volume,
                    dryness: dryness,
                    acidity: acidity,
                    taste: taste,
                    image: image),
                 Positioned(
                  top: detailboxHeight +10,
                  right: Spacings.horizontal -10, // Position von rechts gemessen
                  child: Row(
                    children: [
                      const ShareButton(),// Platz zwischen den Icons
                      Transform.scale(
                        scale: 0.50, // Scale down to 25%
                        child: const HeartButton(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            FullDescription(tastePallet: tastePallet, description: description),
            supermarket,
          ],
        ),
    );
  }
}

class WineDetail1 extends StatelessWidget {
  final String name;
  final String price;
  final String volume;
  final double dryness;
  final double acidity;
  final double taste;
  final String image;

  const WineDetail1(
      {super.key,
      required this.name,
      required this.price,
      required this.volume,
      required this.dryness,
      required this.acidity,
      required this.taste,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50), // Zusätzlicher Platz für die Flasche
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: DetailBox(
                        name: name,
                        price: price,
                        volume: volume,
                        dryness: dryness,
                        acidity: acidity,
                        taste: taste),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: Spacings.vertical,
                child: WinePic(
                  image: image,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailBox extends StatelessWidget {
  final String name;
  final String price;
  final String volume;
  final double dryness;
  final double acidity;
  final double taste;

  const DetailBox(
      {super.key,
      required this.name,
      required this.price,
      required this.volume,
      required this.dryness,
      required this.acidity,
      required this.taste});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacings.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: detailboxHeight, // Höhe der DetailBox
            decoration: const BoxDecoration(
              color: AppColors.backgroundColor,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Spacings.horizontal),
              child: DetailHeadline(name: name),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryWhite,
              borderRadius: BorderRadius.circular(Spacings.cornerRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(Spacings.horizontal),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: wineWight),
                  const SizedBox(width: Spacings.vertical),
                  const Line(),
                  const SizedBox(
                      width:
                          Spacings.horizontal), // Platz zwischen den Elementen
                  Expanded(
                    child: DetailText(
                        price: price,
                        volume: volume,
                        dryness: dryness,
                        acidity: acidity,
                        taste: taste),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailHeadline extends StatelessWidget {
  final String name;

  const DetailHeadline({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacings.horizontal),
      alignment: Alignment.center, // Center the content vertically
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Center the content vertically
        children: [
          const SizedBox(
              width: wineWight +
                  Spacings.vertical +
                  Spacings.lineHorizontalThickness),
          Expanded(
            // Wrap the Text widget with Expanded to enable wrapping
            child: Text(
              name,
              style: const TextStyle(
                fontSize: Spacings.titleFontSize,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
              maxLines: 2, // Allow a maximum of 2 lines
              overflow:
                  TextOverflow.ellipsis, // Show ellipsis if text is too long
            ),
          ),
        ],
      ),
    );
  }
}

class DetailText extends StatelessWidget {
  final String price;
  final String volume;
  final double dryness;
  final double acidity;
  final double taste;

  const DetailText({
    super.key,
    required this.price,
    required this.volume,
    required this.dryness,
    required this.acidity,
    required this.taste,
  })  : assert(dryness >= 0.0 && dryness <= 1.0,
            'Dryness must be between 0 and 1'),
        assert(acidity >= 0.0 && acidity <= 1.0,
            'Acidity must be between 0 and 1'),
        assert(taste >= 0.0 && taste <= 1.0, 'Taste must be between 0 and 1');

  @override
  Widget build(BuildContext context) {
    String description = '$price € – $volume ml';

    return Container(
      // Änderung hier
      padding: const EdgeInsets.symmetric(horizontal: Spacings.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: Spacings.horizontal),
          Text(
            description,
            style: const TextStyle(
              fontSize: Spacings.titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: Spacings.horizontal),
          AttributSlider(
            leftLabel: 'Trocken',
            rightLabel: 'Lieblich',
            position: dryness,
          ),
          const SizedBox(height: Spacings.horizontal),
          AttributSlider(
            leftLabel: 'Sauer',
            rightLabel: 'Basisch',
            position: acidity,
          ),
          const SizedBox(height: Spacings.horizontal),
          AttributSlider(
            leftLabel: 'Widerlich',
            rightLabel: 'Lecker',
            position: taste,
          ),
          const SizedBox(height: Spacings.horizontal),
        ],
      ),
    );
  }
}

class WinePic extends StatelessWidget {
  final String image;

  const WinePic({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wineWight,
      height: wineHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Spacings.cornerRadius),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Spacings.lineHorizontalThickness,
      height: 5 * Spacings.horizontal +
          Spacings.titleFontSize +
          Spacings.textFontSize * 6,
      color: AppColors.primaryGrey,
      margin: const EdgeInsets.symmetric(vertical: Spacings.horizontal),
      padding: const EdgeInsets.all(Spacings.horizontal),
    );
  }
}
