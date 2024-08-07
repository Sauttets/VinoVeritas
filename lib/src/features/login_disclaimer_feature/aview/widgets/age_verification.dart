import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/static_text.dart';

class AgeVerificationCheckbox extends StatefulWidget {
  const AgeVerificationCheckbox({super.key});

  @override
  AgeVerificationCheckboxState createState() => AgeVerificationCheckboxState();
}

class AgeVerificationCheckboxState extends State<AgeVerificationCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Theme(
              data: ThemeData(
                unselectedWidgetColor: AppColors.primaryGrey,
              ),
              child: Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
                activeColor: AppColors.primaryRed,
              ),
            ),
            const Expanded(
              child: Text(
                StaticText.ageVerification,
                softWrap: true,
              ),
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isChecked ? AppColors.primaryRed : AppColors.primaryGrey,
          ),
          onPressed: isChecked
              ? () {
                  context.go('/home');
                }
              : null,
          child: Text(
            StaticText.ageVerificationButton,
            style: TextStyle(
              color: isChecked ? AppColors.white : AppColors.primaryText,
            ),
          ),
        ),
      ],
    );
  }
}
