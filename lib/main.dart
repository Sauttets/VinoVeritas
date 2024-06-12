import 'package:flutter/material.dart';
import 'package:vinoveritas/src/features/facts_feature/widgets/wine_fact_card.dart';
import 'package:vinoveritas/src/features/facts_feature/widgets/wine_facts_page.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/heartbutton.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/navbar.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/search_bar.dart';
import 'package:vinoveritas/src/features/general_feature/widgets/wine_card.dart';
import 'package:vinoveritas/src/features/settings_feature/widgets/settings_page.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/description.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/full_description.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/share_button.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/supermarket_selector.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/taste_pallet.dart';
import 'package:vinoveritas/src/features/wine_feature/widgets/wine_details.dart';
import 'package:vinoveritas/util/app_colors.dart';
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
        '/page8': (context) => const Page8(),
        '/page9': (context) => const Page9(),
        '/page10': (context) => const Page10(),
        '/page11': (context) => const Page11(),
        '/page12': (context) => const Page12(),
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page8');
              },
              child: const Text('Search bar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page9');
              },
              child: const Text('Settingspage'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page10');
              },
              child: const Text('Navbar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page11');
              },
              child: const Text('WineDetails'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page12');
              },
              child: const Text('WineCard'),
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

class Page8 extends StatelessWidget {
  const Page8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('search bar'),
      ),
      body: const Center(
        child: WineSearchBar(),
      ),
    );
  }
}

class Page9 extends StatelessWidget {
  const Page9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Settingspage'),
      ),
      body: const Center(child: SettingsPage()),
    );
  }
}

class Page10 extends StatelessWidget {
  const Page10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navbar'),
      ),
      body: const Center(
        child: CustomNavBar(),
      ),
    );
  }
}


final wineEntries = [
    WineEntry(
      year: '2019',
      name: 'Châteauneuf-du-Pape',
      volume: '850ml',
      price: '42,00€',
      imagePath: 'assets/images/wine.png',
    ),
    WineEntry(
      year: '2019',
      name: 'Château Migraine',
      volume: '750ml',
      price: '13,37€',
      imagePath: 'assets/images/wine.png',
    ),
    // Add more entries as needed
  ];

class Page12 extends StatelessWidget {
  const Page12({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navbar'),
      ),
      body: Center(
        child: WineListPage(wineEntries: wineEntries)
      ),
    );
  }
}




final TastePallet tp = TastePallet(
    flavor1: 'Zimt',
    flavor2: 'Dunkele Beeren',
    flavor3: 'Nelke',
    fit1: 'Wildschwein',
    fit2: 'Rind',
    fit3: 'Schwein');


const SupermarketSelector sms = SupermarketSelector(
    name: 'EDEKA BAUR',
    address: 'Bodanstraße 20-26',
    postalCode: '78462 Konstanz',
    price: '12,34€',
    distance: '1,8km',
    imagePath: 'assets/images/Logo_Edeka.png');

class Page11 extends StatelessWidget {
  const Page11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WineDetails(
              name: 'Château Migraine',
              volume: '750ml',
              price: '13,37€',
              dryness: 0.5,
              acidity: 0.7,
              taste: 0.8,
              image: 'assets/images/wine.png',
              tastePallet: tp,
              description: const Description(
                description:
                    'Ein lebendiger Riesling aus dem deutschen Rheingau, mit blumigen Noten von Aprikose und Pfirsich, begleitet von einer frischen Säure und einer subtilen Mineralität. Ein wahrer Genuss für die Sinne.'),
              supermarket: sms,
            ),
          ],
        ),
      ),
    );
  }
}
