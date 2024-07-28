class StaticText {

  static const String appTitleTop = 'V I N O';
  static const String appTitleBottom = 'VERITAS';
  static const String username = '  Nutzername';
  static const String letsGo = 'Los Gehts!';

  static const String ageVerification = 'Hiermit bestätige ich das ich mindestens 16 Jahre alt bin';
  static const String ageVerificationTitle = 'Wichtiger Hinweis:';
  static const String ageVerificationText1 = 'Uns liegt verantwortungsvoller Genuss sehr am Herzen. Bitte denke daran, Wein immer bewusst und mit Maß zu trinken.';
  static const String ageVerificationText2 = 'Der Konsum von Alkohol ist erst ab 16 Jahren erlaubt. Trinke verantwortungsvoll und vermeide riskante Entscheidungen, wenn du Alkohol getrunken hast.';
  static const String featureDisclaimerTitle = 'Wir freuen uns riesig, dass du hier bist und wünschen dir jede Menge Spaß beim Entdecken neuer Weine und Teilen deiner Favoriten.';
  static const String feature1Title = 'Neue Weine finden:';
  static const String feature1Text = 'Stöbere durch unsere riesige Auswahl und entdecke Weine, die genau deinem Geschmack entsprechen.';
  static const String feature2Title = 'Favoriten teilen:';
  static const String feature2Text = 'Teile deine Lieblingsweine mit Freunden und Familie und sieh, welche Weine ihnen gefallen.';
  static const String feature3Title = 'Neues lernen:';
  static const String feature3Text = 'Lerne alles rund um das Thema Wein. Von Anbaugebieten über Rebsorten bis hin zu Verkostungstipps.';
  static const String ageVerificationButton = 'Weine entdecken';

  static const String design = '  Design:';
  static const String autoMode = 'Automatisch';
  static const String lightMode = 'Hellmodus';
  static const String darkMode = 'Dunkelmodus';
  static const String shareFavorites = '    Teile deine Favoriten:';

  static const String weincode = 'Weincode:';
  static const String importButton = 'Importieren';
  static const String listName = 'Name der Liste:';
  static const String succsessfulImport = 'Favorites imported successfully!';

  static const String searchHint = 'Suche...';
  static const String dryness = 'Trockenheit';
  static const String acidity = 'Säuregehalt';
  static const String tanninLevel = 'Tannin Level';
  static const String descriptionHeader = 'Beschreibung:';
  static const String fallbackAddress = 'Edeka Baur, Reichenaustraße 36, 78467 Konstanz';
  static const String price = 'Preis: ';
  static const String taste = 'Geschmack:';
  static const String fitsTo = 'Passt zu:';
  static const String noWineLists = 'Keine Weinlisten gefunden';
  static const String noShareCode = 'Kein Share-Code gefunden';
  static const String emptyFavList = 'Bitte gehen sie weiter, hier gibt es nichts zu sehen!';
  static const String updateFavoritesFailed = 'Failed to update favorite status';

  static const String sortLabel = 'Sortieren  ';
  static const String filterLabel = 'Essen & Geschmack';
  static const String food = 'Essen';
  static const String tasteProfile = 'Geschmack';

  static const String sortAll = 'Alle';
  static const String sortRed = 'Rotwein';
  static const String sortWhite = 'Weißwein';
  static const String sortRose = 'Roséwein';

  static const String mostPopular = 'Beliebteste zuerst';
  static const String priceLowToHigh = 'Preis aufsteigend';
  static const String priceHighToLow = 'Preis absteigend';

  static const String wineFactOTD =
      "Wusstest du, dass die ältesten Hinweise auf Weinherstellung etwa 8.000 Jahre alt sind? Archäologische Funde deuten darauf hin, dass die Weinproduktion bereits in der Neusteinzeit begann, als Menschen begannen, Trauben anzubauen und zu fermentieren.";  
  
  final List<List<Map<String, String>>> wineFactsTabs = [
    [
      {
        'title': 'Ursprung des Weinbaus',
        'content':
            'Der Weinbau hat seinen Ursprung im Kaukasus vor über 8000 Jahren. Archäologische Funde belegen, dass dort die ersten Trauben kultiviert und zu Wein verarbeitet wurden.'
      },
      {
        'title': 'Rebsorten weltweit',
        'content':
            'Heute gibt es weltweit mehr als 10.000 verschiedene Rebsorten, wobei jede Region ihre eigenen Spezialitäten hat.'
      },
      {
        'title': 'Terroir',
        'content':
            'Das Terroir bezeichnet die spezifischen Umweltbedingungen, wie Boden, Klima und Topografie, die den Charakter eines Weins prägen.'
      },
      {
        'title': 'Biologischer Weinbau',
        'content':
            'Beim biologischen Weinbau werden keine synthetischen Pestizide oder Düngemittel verwendet. Dies fördert die Biodiversität und die Gesundheit der Reben.'
      },
      {
        'title': 'Weinbauregionen',
        'content':
            'Berühmte Weinbauregionen sind Bordeaux in Frankreich, Napa Valley in den USA und die Toskana in Italien. Jede Region hat ihre typischen Weine.'
      },
      {
        'title': 'Lese',
        'content':
            'Die Lese bezeichnet die Ernte der Trauben. Sie kann maschinell oder von Hand erfolgen und hat großen Einfluss auf die Qualität des Weins.'
      },
      {
        'title': 'Phylloxera-Katastrophe',
        'content':
            'Im 19. Jahrhundert wurde der europäische Weinbau von der Reblaus (Phylloxera) nahezu zerstört. Nur durch Pfropfen europäischer Reben auf resistente amerikanische Unterlagen konnte die Katastrophe bewältigt werden.'
      },
      {
        'title': 'Klimawandel',
        'content':
            'Der Klimawandel beeinflusst den Weinbau erheblich. Er führt zu Veränderungen in der Reifung der Trauben und kann neue Herausforderungen und Chancen für Weinbauern mit sich bringen.'
      },
    ],
    [
      {
        'title': 'Traditionelles Stampfen',
        'content':
            'In einigen Kellereien wird Wein noch immer traditionell mit den Füßen gestampft. Diese Methode wird vor allem bei besonderen Weinen angewendet, um die Trauben schonend zu verarbeiten.'
      },
      {
        'title': 'Vergärung',
        'content':
            'Die Vergärung ist ein zentraler Schritt in der Weinherstellung, bei dem Zucker in den Trauben in Alkohol umgewandelt wird. Dieser Prozess kann in Stahltanks, Holzfässern oder Betonbehältern erfolgen.'
      },
      {
        'title': 'Reifung im Barrique',
        'content':
            'Ein Barrique ist ein kleines Eichenholzfass, in dem Wein reift. Der Kontakt mit dem Holz verleiht dem Wein zusätzliche Aromen wie Vanille, Karamell und Rauch.'
      },
      {
        'title': 'Malolaktische Gärung',
        'content':
            'Diese zweite Gärung wandelt scharfe Apfelsäure in weichere Milchsäure um, was dem Wein eine cremigere Textur und einen weicheren Geschmack verleiht.'
      },
      {
        'title': 'Schwefelung',
        'content':
            'Schwefel wird verwendet, um den Wein zu stabilisieren und vor Oxidation und Bakterienbefall zu schützen. Die richtige Dosierung ist hierbei entscheidend.'
      },
      {
        'title': 'Weinfilterung',
        'content':
            'Vor der Abfüllung wird Wein oft gefiltert, um Schwebstoffe zu entfernen und Klarheit zu gewährleisten. Es gibt verschiedene Filtermethoden, die je nach Weinstil eingesetzt werden.'
      },
      {
        'title': 'Flaschengärung',
        'content':
            'Bei der traditionellen Methode der Schaumweinherstellung findet eine zweite Gärung in der Flasche statt. Diese Methode wird auch als Méthode Champenoise bezeichnet und ist typisch für Champagner.'
      },
      {
        'title': 'Kühlgärung',
        'content':
            'Eine niedrigere Gärtemperatur bewahrt frische Fruchtaromen im Wein. Diese Methode wird häufig bei der Herstellung von Weiß- und Roséweinen angewendet.'
      },
    ],
    [
      {
        'title': 'Geschmacksnoten',
        'content':
            'Weine können Geschmacksnoten wie Früchte, Gewürze, Blumen und sogar Erde aufweisen. Diese Aromen entstehen durch die Trauben selbst sowie durch den Herstellungsprozess.'
      },
      {
        'title': 'Süße im Wein',
        'content':
            'Die Süße eines Weins wird durch den Restzuckergehalt bestimmt. Ein hoher Restzuckergehalt führt zu einem süßeren Wein, während ein niedriger Gehalt einen trockenen Wein ergibt.'
      },
      {
        'title': 'Tannine',
        'content': 'Tannine im Wein sorgen für das trockene Gefühl im Mund und stammen aus den Schalen, Kernen und Stielen der Trauben sowie aus Eichenfässern.'
      },
      {
        'title': 'Glasform',
        'content':
            'Der Geschmack eines Weins kann sich je nach Glasform verändern. Verschiedene Glasformen konzentrieren die Aromen unterschiedlich und beeinflussen das Trinkerlebnis.'
      },
      {
        'title': 'Dekantieren',
        'content':
            'Dekantieren bedeutet, den Wein in eine Karaffe umzufüllen, um ihn mit Sauerstoff zu belüften und eventuelles Depot zu entfernen. Dies kann besonders bei älteren Rotweinen wichtig sein.'
      },
      {
        'title': 'Serviertemperatur',
        'content':
            'Die richtige Serviertemperatur ist entscheidend für den Genuss eines Weins. Weißweine werden typischerweise gekühlt serviert, während Rotweine bei Zimmertemperatur am besten schmecken.'
      },
      {
        'title': 'Balance im Wein',
        'content':
            'Ein gut balancierter Wein hat eine harmonische Kombination von Säure, Süße, Tanninen und Alkohol, ohne dass eine Komponente überwiegend ist.'
      },
      {
        'title': 'Alterungspotential',
        'content':
            'Nicht jeder Wein ist für eine lange Lagerung geeignet. Einige Weine entwickeln sich über Jahre hinweg weiter und gewinnen an Komplexität, während andere jung getrunken werden sollten.'
      },
    ],
    [
      {
        'title': 'Antioxidantien im Wein',
        'content':
            'Wein enthält Antioxidantien, wie Resveratrol, die gesundheitsfördernde Eigenschaften haben und das Herz-Kreislauf-System unterstützen können.'
      },
      {
        'title': 'Lagerungstemperatur',
        'content':
            'Die richtige Lagerungstemperatur für Wein liegt zwischen 10-15°C. Zu hohe Temperaturen können den Wein beschädigen und zu niedrige können ihn in einen Ruhezustand versetzen.'
      },
      {
        'title': 'Atmen lassen',
        'content':
            'Rotwein sollte vor dem Servieren „atmen“ dürfen, um sein Aroma zu entfalten. Dies kann durch Dekantieren oder einfaches Öffnen der Flasche einige Zeit vor dem Genuss geschehen.'
      },
      {
        'title': 'Korken',
        'content':
            'Der Korken schützt den Wein vor Oxidation und bewahrt seine Qualität. Naturkorken sind am weitesten verbreitet, aber es gibt auch Schraubverschlüsse und synthetische Korken.'
      },
      {
        'title': 'Wein und Gesundheit',
        'content':
            'Moderater Weinkonsum kann Teil eines gesunden Lebensstils sein, insbesondere im Rahmen der Mittelmeerdiät. Übermäßiger Konsum hingegen kann gesundheitsschädlich sein.'
      },
      {
        'title': 'Wein und Speisen',
        'content':
            'Die richtige Kombination von Wein und Speisen kann das Geschmackserlebnis erheblich steigern. Klassiker sind etwa Rotwein zu rotem Fleisch und Weißwein zu Fisch.'
      },
      {
        'title': 'Weinfehler',
        'content':
            'Wein kann verschiedene Fehler aufweisen, wie Korkgeschmack oder Oxidation. Solche Fehler können den Genuss beeinträchtigen und entstehen durch Produktions- oder Lagerungsprobleme.'
      },
      {
        'title': 'Wein als Investition',
        'content':
            'Manche Weine werden als Investitionsobjekte betrachtet. Seltene und begehrte Jahrgänge können im Wert steigen und auf Auktionen hohe Preise erzielen.'
      },
    ],
  ];

  

  

}
