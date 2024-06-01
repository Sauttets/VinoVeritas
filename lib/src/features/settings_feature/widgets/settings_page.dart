import 'package:flutter/material.dart';
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Increase the height as needed
        child: AppBar(
          automaticallyImplyLeading: false, // This line removes the back button
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.0),
            child: DesignSelector(
              selectedIndex: selectedIndex,
              onTabSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      body: Center(child: Text('Selected design index: $selectedIndex')),
    );
  }
}
