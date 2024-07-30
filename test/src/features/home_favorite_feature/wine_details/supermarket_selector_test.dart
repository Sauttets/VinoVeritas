import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/wine_details/supermarket_selector.dart';
import 'package:vinoveritas/util/static_text.dart';

void main() {
  testWidgets('SupermarketSelector displays correct information', (WidgetTester tester) async {
    // Arrange
    const name = 'Edeka';
    const address = 'Main Street 1';
    const postalCode = '12345';
    const price = '€10.99';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SupermarketSelector(
            name: name,
            address: address,
            postalCode: postalCode,
            price: price,
          ),
        ),
      ),
    );

    expect(find.byType(SupermarketImg), findsOneWidget);

    expect(find.text(name), findsOneWidget);
    expect(find.text('$address · $postalCode'), findsOneWidget);
    expect(find.text(StaticText.price + price), findsOneWidget);

    expect(find.byType(Icon), findsOneWidget);
  });
}
