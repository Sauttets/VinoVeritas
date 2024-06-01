import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/facts_feature/widgets/wine_fact_card.dart';
import 'package:vinoveritas/src/features/facts_feature/widgets/wine_facts_page.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/heartbutton.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/test_page.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/description.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/full_description.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/share_button.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/taste_pallet.dart';
import 'package:vinoveritas/util/static_text.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/page1': (context) => const Page1(),
        '/page2': (context) => const Page2(),
        '/page3': (context) => const Page3(),
        '/page4': (context) => const Page4(),
        '/page5': (context) => const Page5(),
        '/page6': (context) => const Page6(),
        '/page7': (context) => const Page7(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page1');
              },
              child: const Text('Weinfakten mit selektor'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page2');
              },
              child: const Text('Like button'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page3');
              },
              child: const Text('Weinfakt des Tages'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page4');
              },
              child: const Text('Share Button'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page5');
              },
              child: const Text('Description'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page6');
              },
              child: const Text('Taste Pallet'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page7');
              },
              child: const Text('Full Description'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weinfakten mit Selektor'),
      ),
      body: const Center(child: WineFactsPage()),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heart Button'),
      ),
      body: const Center(child: HeartButton()),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weinfakt des Tages'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WineFactCard(content: StaticText.wineFactOTD),
          const WineFactCard(
            content: "x",
          ),
        ],
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Button'),
      ),
      body: const Center(
        child: ShareButton(),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Description'),
      ),
      body: const Center(
        child: Description(description: "description"),
      ),
    );
  }
}

class Page6 extends StatelessWidget {
  const Page6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taste Pallet'),
      ),
      body: Center(
        child: TastePallet(flavor1: 'Leder', fit1: 'Fisch'),
      ),
    );
  }
}

final TastePallet tastePallet = TastePallet(
    flavor1: 'Zimt',
    flavor2: 'Dunkele Beeren',
    flavor3: 'Nelke',
    fit1: 'Wildschwein',
    fit2: 'Rind',
    fit3: 'Schwein');
const Description description = Description(
    description:
        'Ein lebendiger Riesling aus dem deutschen Rheingau, mit blumigen Noten von Aprikose und Pfirsich, begleitet von einer frischen Säure und einer subtilen Mineralität. Ein wahrer Genuss für die Sinne.');

class Page7 extends StatelessWidget {
  const Page7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('full Description'),
      ),
      body: Center(
        child:
            FullDescription(tastePallet: tastePallet, description: description),
      ),
    );
  }
}
