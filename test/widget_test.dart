import 'package:flutter_test/flutter_test.dart';
import 'package:water_tracker/main.dart';

void main() {
  testWidgets('Water Tracker app starts', (WidgetTester tester) async {
    await tester.pumpWidget(const WaterTrackerApp());

    expect(find.byType(WaterTrackerApp), findsOneWidget);
  });
}