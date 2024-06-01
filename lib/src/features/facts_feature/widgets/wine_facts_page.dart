import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/facts_feature/widgets/expandable_wine_facts_list.dart';
import 'package:vinoveritas/src/features/facts_feature/widgets/wine_facts_selector.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/static_text.dart';

class WineFactsPage extends StatefulWidget {
  const WineFactsPage({super.key});

  @override
  _WineFactsPageState createState() => _WineFactsPageState();
}

class _WineFactsPageState extends State<WineFactsPage> {
  int selectedIndex = 0;

  List<List<Map<String, String>>> wineFactsTab = StaticText().wineFactsTabs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wine Facts'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
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
      body: WineFactsTab(wineFacts: wineFactsTab[selectedIndex]),
    );
  }
}
