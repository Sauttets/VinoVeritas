import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/wine_details/supermarket_selector.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/static_text.dart';

void main() {
  testWidgets('SupermarketSelector displays correct information', (WidgetTester tester) async {
    // Arrange
    const name = 'Edeka';
    const address = 'Main Street 1';
    const postalCode = '12345';
    const price = '€10.99';

    await tester.pumpWidget(
      MaterialApp(
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

    // Check if the supermarket image is displayed
    expect(find.byType(SupermarketImg), findsOneWidget);

    // Check if the texts are displayed
    expect(find.text(name), findsOneWidget);
    expect(find.text('$address · $postalCode'), findsOneWidget);
    expect(find.text(StaticText.price + price), findsOneWidget);

    // Check if the arrow icon is displayed
    expect(find.byType(Icon), findsOneWidget);
  });
}
