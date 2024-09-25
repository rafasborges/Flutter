import 'package:client_control/components/hamburger_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing the menu', () {
    testWidgets('Hamburguer menu should have "Menu"', (tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text("Gerenciar clientes"), findsOneWidget);
    });

    testWidgets('Hamburguer menu should have "Tipos de clientes" ',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text('Tipos de clientes'), findsOneWidget);
    });

    testWidgets('Hamburguer menu should have "Sair" ', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text('Sair'), findsOneWidget);
    });
  });
}
