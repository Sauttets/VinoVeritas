import 'package:flutter/material.dart';
import 'package:vinoveritas/src/aview/login_disclaimer/widgets/onboarding_age_verification.dart';
import 'package:vinoveritas/src/aview/login_disclaimer/widgets/onboarding_feature_diclaimer.dart';
import 'package:vinoveritas/util/spacings.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Spacings.widgetPaddingAll),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OnboaringFeatureDisclaimer(),
              SizedBox(height: Spacings.widgetVertical),
              OnboardingAgeVerificationDisclaimer(),
            ],
          ),
        ),
      ),
    );
  }
}
