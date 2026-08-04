import 'package:flutter_test/flutter_test.dart';

import 'package:saegim/main.dart';

void main() {
  testWidgets('Splash screen shows title and subtitle', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('새김'), findsOneWidget);
    expect(find.text('당신에게 하지 못한 말을 남기는 공간'), findsOneWidget);
  });
}
