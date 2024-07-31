import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/lexicon_feature/aview/widgets/static_facts/expandable_wine_facts_list.dart';
import 'package:vinoveritas/src/features/lexicon_feature/aview/widgets/static_facts/wine_facts_selector.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';
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
        automaticallyImplyLeading: false,
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
        padding: const EdgeInsets.only(left: Spacings.widgetHorizontal, bottom: Spacings.widgetVertical, right: Spacings.widgetHorizontal),
        child: WineFactsTab(wineFacts: wineFactsTab[selectedIndex], tabIndex: selectedIndex),
      ),
    );
  }
}
