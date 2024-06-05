import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/set_username.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/design_selector.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false, // This line removes the back button
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120.0), // Increase the height
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SetUsername(), // Replace TextField with SetUsername
              ),
              DesignSelector(
                selectedIndex: selectedIndex,
                onTabSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
