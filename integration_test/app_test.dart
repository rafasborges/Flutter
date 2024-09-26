import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Menu', () {
    testWidgets('Verifica Menu', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.menu));
      await Duration(seconds: 5);
      await tester.pumpAndSettle();
      expect(find.text('Menu'), findsOneWidget);
    });
  });
}
