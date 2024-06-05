import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/import_favorites.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/location_settings.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/set_username.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/design_selector.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/share_favorites.dart';
import 'package:vinoveritas/util/app_colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SetUsername(),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SetLocation(),
              ),
              DesignSelector(
                selectedIndex: selectedIndex,
                onTabSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: DisplayAndCopyText(
                    text: '22218db8778892345732845uihfh9823823'),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: NewWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
