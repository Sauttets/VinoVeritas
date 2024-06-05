import 'package:flutter/material.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/heartbutton.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/back_button.dart'
    as bb;
import 'package:vinoveritas/src/features/wine_feature/widgets/share_button.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/attributSlider.dart';

class WineDetailScreen extends StatelessWidget {
  const WineDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Spacings.horizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailHeadline(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WinePic(),
                  Expanded(
                    child: DetailBox(),
                  ),
                ],
              ),
            ],
          ),
        ),
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
      padding: EdgeInsets.all(Spacings.horizontal),
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(Spacings.cornerRadius),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 72),
             SizedBox(
              height: 200, // Die Höhe erstreckt sich über die gesamte Höhe des Containers
              child: Container(
                width: Spacings.lineHorizontalThickness,
                color: Colors.grey,
                margin: const EdgeInsets.symmetric(vertical: Spacings.horizontal),
                padding: const EdgeInsets.all(Spacings.horizontal),
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: DetailText(),
            ),
          ],
        ),
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
          SizedBox(height: Spacings.vertical),
          AttributSlider(
            leftLabel: 'Sauer',
            rightLabel: 'Basisch',
            position: 0.5,
          ),
          SizedBox(height: Spacings.vertical),
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
