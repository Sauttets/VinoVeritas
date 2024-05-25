import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/facts_feature/widgets/wine_facts_home.dart';

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
      home: WineFactsHome(),
    );
  }
}


/*
WineFactCard(
              title: 'Weinfakt des Tages:',
              content: 'Den ältesten noch trinkbaren Wein trank Jaques Cousteau. Der Meeresforscher fand ihn in einem griechischen Handelsschiff, das 200 vor Christus gesunken war.',


*/