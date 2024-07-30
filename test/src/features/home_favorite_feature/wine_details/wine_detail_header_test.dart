import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/wine_details/attribut_indicator.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/wine_details/bottle_widget.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/wine_details/wine_deatail_header.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/model/wine_model.dart';
import 'package:vinoveritas/util/spacings.dart';

void main() {
  testWidgets('WineDetailsHeader displays correctly', (WidgetTester tester) async {
    final wine = Wine(
      id: 1,
      name: 'Sample Wine',
      year: 2020,
      country: 'France',
      type: 'red',
      description: 'A nice red wine.',
      imageURL: 'https://example.com/wine.jpg',
      volume: 750.0,
      volAlc: 13.5,
      isLiked: false,
      dryness: 0.5,
      acidity: 0.4,
      tanninLevel: 0.6,
      flavours: ['Cherry', 'Oak'],
      fitsTo: ['Beef', 'Pasta'],
      supermarkets: [
        Supermarket(
          name: 'Supermarket A',
          street: 'Main St',
          postalCode: '12345',
          city: 'City',
          houseNumber: '10',
          price: 15.0,
        ),
        Supermarket(
          name: 'Supermarket B',
          street: 'Second St',
          postalCode: '54321',
          city: 'Another City',
          houseNumber: '20',
          price: 12.0,
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WineDetailsHeader(wine: wine),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(BottleWidget), findsOneWidget);

    final positionedBottleWidget = find.descendant(
      of: find.byType(Positioned),
      matching: find.byType(BottleWidget),
    );

    expect(positionedBottleWidget, findsOneWidget);

    final positionedWidget = tester.widget<Positioned>(
      find.ancestor(
        of: find.byType(BottleWidget),
        matching: find.byType(Positioned),
      ),
    );
    expect(positionedWidget.left, equals(Spacings.widgetHorizontal));

    expect(find.byType(AttributeIndicator), findsOneWidget);

    final attributeIndicator = tester.widget<AttributeIndicator>(find.byType(AttributeIndicator));
    expect(attributeIndicator.price, equals(12.0));
    expect(attributeIndicator.volume, equals(750));
    expect(attributeIndicator.trockenValue, equals(0.5));
    expect(attributeIndicator.sauerValue, equals(0.4));
    expect(attributeIndicator.tanninValue, equals(0.6));
  });
}
