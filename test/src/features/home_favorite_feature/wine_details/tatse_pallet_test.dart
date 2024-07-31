import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/aview/wine_detail/widgets/taste_pallet.dart';
import 'package:vinoveritas/util/static_text.dart';
import 'package:vinoveritas/util/taste_maps.dart';


void main() {
  testWidgets('TastePallet displays correct information', (WidgetTester tester) async {
    const tastePallet = TastePallet(
      flavor1: 'Fruchtig',
      flavor2: 'Blumig',
      flavor3: 'Erdig',
      fit1: 'Käse',
      fit2: 'Fisch',
      fit3: 'Rindfleisch',
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: tastePallet,
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text(StaticText.taste), findsOneWidget);
    expect(find.text(StaticText.fitsTo), findsOneWidget);
    expect(find.text('Fruchtig'), findsOneWidget);
    expect(find.text('Blumig'), findsOneWidget);
    expect(find.text('Erdig'), findsOneWidget);
    expect(find.text('Käse'), findsOneWidget);
    expect(find.text('Fisch'), findsOneWidget);
    expect(find.text('Rindfleisch'), findsOneWidget);

    expect(
      find.byWidgetPredicate(
        (widget) => widget is Icon && widget.icon == tasteIcons['Fruchtig'] && widget.color == tasteColors['Fruchtig'],
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Icon && widget.icon == tasteIcons['Blumig'] && widget.color == tasteColors['Blumig'],
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Icon && widget.icon == tasteIcons['Erdig'] && widget.color == tasteColors['Erdig'],
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Icon && widget.icon == fitsforIcons['Käse'] && widget.color == fitsColors['Käse'],
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Icon && widget.icon == fitsforIcons['Fisch'] && widget.color == fitsColors['Fisch'],
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Icon && widget.icon == fitsforIcons['Rindfleisch'] && widget.color == fitsColors['Rindfleisch'],
      ),
      findsOneWidget,
    );
  });

  testWidgets('TastePallet displays only non-null flavors and fits', (WidgetTester tester) async {
    const tastePallet = TastePallet(
      flavor1: 'Fruchtig',
      flavor2: null,
      flavor3: 'Erdig',
      fit1: 'Käse',
      fit2: null,
      fit3: 'Rindfleisch',
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: tastePallet,
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text(StaticText.taste), findsOneWidget);
    expect(find.text(StaticText.fitsTo), findsOneWidget);

    expect(find.text('Fruchtig'), findsOneWidget);
    expect(find.text('Erdig'), findsOneWidget);
    expect(find.text('Käse'), findsOneWidget);
    expect(find.text('Rindfleisch'), findsOneWidget);
    expect(find.text('Blumig'), findsNothing);
    expect(find.text('Fisch'), findsNothing);

    expect(
      find.byWidgetPredicate(
        (widget) => widget is Icon && widget.icon == tasteIcons['Fruchtig'] && widget.color == tasteColors['Fruchtig'],
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Icon && widget.icon == tasteIcons['Erdig'] && widget.color == tasteColors['Erdig'],
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Icon && widget.icon == fitsforIcons['Käse'] && widget.color == fitsColors['Käse'],
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Icon && widget.icon == fitsforIcons['Rindfleisch'] && widget.color == fitsColors['Rindfleisch'],
      ),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate(
        (widget) => widget is Icon && widget.icon == tasteIcons['Blumig'] && widget.color == tasteColors['Blumig'],
      ),
      findsNothing,
    );
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Icon && widget.icon == fitsforIcons['Fisch'] && widget.color == fitsColors['Fisch'],
      ),
      findsNothing,
    );
  });
}
