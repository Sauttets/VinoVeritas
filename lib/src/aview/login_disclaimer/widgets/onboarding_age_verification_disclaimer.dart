import 'package:flutter/material.dart';
import 'package:vinoveritas/src/aview/login_disclaimer/widgets/age_verification.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/static_text.dart';

class OnboardingAgeVerificationDisclaimer extends StatelessWidget {
  const OnboardingAgeVerificationDisclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacings.widgetPaddingAll),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(Spacings.cardBorderRadius),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StaticText.ageVerificationTitle,
            style: TextStyle(fontSize: Spacings.titleFontSize, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Spacings.widgetHorizontal),
          Text(
            StaticText.ageVerificationText1,
            style: TextStyle(fontSize: Spacings.textFontSize),
          ),
          SizedBox(height: Spacings.widgetVertical),
          Text(
            StaticText.ageVerificationText2,
            style: TextStyle(fontSize: Spacings.textFontSize),
          ),
          SizedBox(height: Spacings.widgetVertical),
          AgeVerificationCheckboxButtonWidget(),
        ],
      ),
    );
  }
}
