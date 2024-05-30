import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/facts_feature/widgets/wine_facts_home.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/description.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heart Button Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestPage(),
    );
  }
}

//
/*
WineFactCard(
              title: 'Weinfakt des Tages:',
              content: 'Den ältesten noch trinkbaren Wein trank Jaques Cousteau. Der Meeresforscher fand ihn in einem griechischen Handelsschiff, das 200 vor Christus gesunken war.',

const Description(description: 'Dies ist eine Beschriebung die absolut nicht weiter hilft',)
*/