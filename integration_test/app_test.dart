import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Menu', () {
    testWidgets('Verifica Menu', (tester) async {
      app.main(); // Inicia o app
      await tester.pumpAndSettle(); // Aguarda o carregamento inicial

      // Verifica elementos do menu
      expect(find.text("Clientes"), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);

      // Abre o menu
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle(); // Aguarda a animação do menu abrir

      // Verifica se o menu foi aberto corretamente
      expect(find.text('Menu'), findsOneWidget);
      expect(find.text('Gerenciar clientes'), findsOneWidget);
      expect(find.text('Tipos de clientes'), findsOneWidget);
      expect(find.text('Sair'), findsOneWidget);

      // Navegação para Tipos de Clientes
      await tester.tap(find.text("Tipos de clientes"));
      await tester.pumpAndSettle(); // Aguarda a animação da navegação

      // Verifica elementos na nova tela
      expect(find.text('Platinum'), findsOneWidget);
      expect(find.text('Golden'), findsOneWidget);
      expect(find.text('Titanium'), findsOneWidget);
      expect(find.text('Diamond'), findsOneWidget);

      // Navegação para Cadastrar Tipo cliente
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle(); // Aguarda a animação para a nova tela

      // Verifica o AlertDialog
      expect(
          find.byWidgetPredicate((widget) =>
              (widget is AlertDialog) &&
              (widget.title is Text) &&
              ((widget.title as Text).data == 'Cadastrar tipo')),
          findsOneWidget);

      // Insere o texto no campo de texto
      await tester.enterText(find.byType(TextFormField), "Teste1");

      // Seleciona um ícone
      await tester.tap(find.text("Selecionar icone"));
      await tester.pumpAndSettle(); // Aguarda a animação do seletor de ícone

      // Seleciona um ícone específico
      await tester.tap(find.byIcon(Icons.card_giftcard));

      // Salva as informações
      await tester.tap(find.text("Salvar"));
      await tester.pumpAndSettle(); // Aguarda a animação de salvamento

      // Cadastrar cliente
      expect(find.byIcon(Icons.menu), findsOneWidget);
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      await tester.pump(Duration(seconds: 10));
      await tester.tap(find.text("Gerenciar clientes"));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(FloatingActionButton));
      expect(
          find.byWidgetPredicate((widget) =>
              (widget is AlertDialog) &&
              (widget.title is Text) &&
              ((widget.title as Text).data == 'Cadastrar tipo')),
          findsOneWidget);

      // Insere o texto no campo de texto
      final nome = find.byWidgetPredicate((widget) =>
          (widget is TextFormField) &&
          (widget.controller is TextEditingController) &&
          ((widget.controller as TextEditingController).text == "nomeInput"));

      await tester.enterText(nome, "Rafaela");
    });
  });
}
