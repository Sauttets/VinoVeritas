import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vinoveritas/src/aview/home_and_favorite/widgets/heartbutton.dart';
import 'package:vinoveritas/src/aview/wine_detail/widgets/bottle_widget.dart';
import 'package:vinoveritas/src/model/home_and_favorite/wine_model.dart';

class MockNetworkImage extends Mock implements ImageProvider {}

void main() {
  testWidgets('BottleWidget displays correct information', (WidgetTester tester) async {
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
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BottleWidget(wine: wine),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Sample Wine'), findsOneWidget);

    expect(find.byWidgetPredicate((widget) => widget is Image && widget.image is NetworkImage), findsOneWidget);

    expect(find.byType(HeartButton), findsOneWidget);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BottleWidget(wine: wine.copyWith(imageURL: '')),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final imageFallback = find.byWidgetPredicate((widget) => widget is Image && widget.image is AssetImage);
    expect(imageFallback, findsOneWidget);
  });
}
