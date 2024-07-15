import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/facts_feature/aview/widgets/expandable_wine_facts_list.dart';
import 'package:vinoveritas/src/features/facts_feature/aview/widgets/wine_facts_selector.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/static_text.dart';

class StaticWineFacts extends StatefulWidget {
  const StaticWineFacts({super.key});

  @override
  StaticWineFactsState createState() => StaticWineFactsState();
}

class StaticWineFactsState extends State<StaticWineFacts> {
  int selectedIndex = 0;

  List<List<Map<String, String>>> wineFactsTab = StaticText().wineFactsTabs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false, // This line removes the back button
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: WineFactsSelector( 
            selectedIndex: selectedIndex,
            onTabSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
      ),
      body: Container(
        color: AppColors.backgroundColor,
        padding: const EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
        child: WineFactsTab(wineFacts: wineFactsTab[selectedIndex], tabIndex: selectedIndex),
      ),
    );
  }
}
