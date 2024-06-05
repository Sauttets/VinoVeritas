import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/heartbutton.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/back_button.dart'
    as bb;
import 'package:vinoveritas/src/features/wine_feature/widgets/share_button.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/attributSlider.dart';

class WineDetailScreen extends StatelessWidget {
  const WineDetailScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(Spacings.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              WineDetail1(),
              Positioned(
                top: 265 -
                    200 +
                    Spacings.buttonContainerSize /
                        2, // Position von oben gemessen
                right: Spacings.horizontal, // Position von rechts gemessen
                child: Row(
                  children: [
                    ShareButton(),
                    SizedBox(
                        width: Spacings.horizontal), // Platz zwischen den Icons
                    HeartButton(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WineDetail1 extends StatelessWidget {
  const WineDetail1({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50), // Zusätzlicher Platz für die Flasche
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: DetailBox(),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: Spacings.vertical,
                child: WinePic(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailHeadline extends StatelessWidget {
  const DetailHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Änderung hier
      padding: const EdgeInsets.all(Spacings.horizontal),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 72 + Spacings.vertical + Spacings.lineHorizontalThickness),
          Text(
            'Weinname',
            style: TextStyle(
              fontSize: Spacings.titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailBox extends StatelessWidget {
  const DetailBox({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacings.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 265 -
                (200 -
                    Spacings.horizontal +
                    Spacings.textFontSize), // Höhe der DetailBox
            decoration: const BoxDecoration(
              color: AppColors.backgroundColor,
            ),
            child: const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Spacings.horizontal),
              child: DetailHeadline(),
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
            child: const Padding(
              padding: EdgeInsets.all(Spacings.horizontal),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 72),
                  SizedBox(width: Spacings.vertical),
                  Line(),
                  SizedBox(
                      width:
                          Spacings.horizontal), // Platz zwischen den Elementen
                  Expanded(
                    child: DetailText(),
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


class DetailText extends StatelessWidget {
  const DetailText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Änderung hier
      padding: const EdgeInsets.symmetric(horizontal: Spacings.horizontal),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '42,00€ – 850ml',
            style: TextStyle(
              fontSize: Spacings.titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Spacings.horizontal),
          AttributSlider(
            leftLabel: 'Trocken',
            rightLabel: 'Lieblich',
            position: 0.3,
          ),
          SizedBox(height: Spacings.horizontal),
          AttributSlider(
            leftLabel: 'Sauer',
            rightLabel: 'Basisch',
            position: 0.5,
          ),
          SizedBox(height: Spacings.horizontal),
          AttributSlider(
            leftLabel: 'Widerlich',
            rightLabel: 'Lecker',
            position: 0.9,
          ),
        ],
      ),
    );
  }
}

class WinePic extends StatelessWidget {
  const WinePic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 265,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Spacings.cornerRadius),
        child: Image.asset(
          'assets/images/wine.png',
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
      height: 5 * Spacings.horizontal + Spacings.titleFontSize + Spacings.textFontSize * 6,
      color: AppColors.primaryGrey,
      margin: const EdgeInsets.symmetric(vertical: Spacings.horizontal),
      padding: const EdgeInsets.all(Spacings.horizontal),
    );
  }
}
