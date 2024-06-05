import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/import_favorites.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/location_settings.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/set_username.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/design_selector.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/share_favorites.dart';
import 'package:vinoveritas/util/app_colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPage createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SetUsername(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                DisplayAndCopyText(text: '22218db8778892345732845uihfh9823823'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: NewWidget(),
          ),
        ],
      ),
    );
  }
}
