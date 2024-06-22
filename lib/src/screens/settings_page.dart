import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/import_favorites.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/location_settings.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/set_username.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/design_selector.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/share_favorites.dart';
import 'package:vinoveritas/src/isar/IsarService.dart';
import 'package:vinoveritas/src/isar/IsarServiceInterface.dart';
import 'package:vinoveritas/util/app_colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  int selectedIndex = 0;
  final IsarServiceInterface _isarService = IsarService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 16.0, // Add padding above the content
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Center(
              // Wrap the Column with a Center widget
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the children vertically
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SetUsername(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SetLocation(isarService: _isarService),
                  ),
                  DesignSelector(
                    selectedIndex: selectedIndex,
                    onTabSelected: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    isarService: _isarService,
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
        ),
      ),
    );
  }
}
