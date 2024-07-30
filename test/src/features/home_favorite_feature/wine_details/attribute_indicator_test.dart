import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/aview/widgets/wine_details/attribut_indicator.dart';
import 'package:vinoveritas/util/static_text.dart';

void main() {
  testWidgets('AttributeIndicator displays correct information', (WidgetTester tester) async {
    const attributeIndicator = AttributeIndicator(
      price: 15.50,
      volume: 750,
      trockenValue: 0.7,
      sauerValue: 0.3,
      tanninValue: 0.5,
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: attributeIndicator,
        ),
      ),
    );

    expect(find.text('15.50€  -  750 ml'), findsOneWidget);

    expect(find.text(StaticText.dryness), findsOneWidget);
    expect(find.text(StaticText.acidity), findsOneWidget);
    expect(find.text(StaticText.tanninLevel), findsOneWidget);

    expect(find.byType(Container), findsNWidgets(7));

    final RenderBox box = tester.renderObject(find.byType(AttributeIndicator));
    final totalWidth = box.size.width;
    final indicatorWidth = totalWidth * 0.75;

    final List<Positioned> positionedWidgets = tester.widgetList<Positioned>(find.byType(Positioned)).toList();
    expect(positionedWidgets[0].left, equals((0.7 * (indicatorWidth - 8)).clamp(0, indicatorWidth - 8)));
    expect(positionedWidgets[1].left, equals((0.3 * (indicatorWidth - 8)).clamp(0, indicatorWidth - 8)));
    expect(positionedWidgets[2].left, equals((0.5 * (indicatorWidth - 8)).clamp(0, indicatorWidth - 8)));
  });
}
