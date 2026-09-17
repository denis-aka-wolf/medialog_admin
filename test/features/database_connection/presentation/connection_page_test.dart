import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medialog_admin/features/database_connection/presentation/connection_page.dart';

void main() {
  Widget buildPage() {
    return const MaterialApp(home: ConnectionPage());
  }

  testWidgets('shows database connection fields', (tester) async {
    await tester.pumpWidget(buildPage());

    expect(find.text('Соединение'), findsOneWidget);
    expect(find.text('Тип сервера'), findsOneWidget);
    expect(find.text('Имя сервера'), findsOneWidget);
    expect(find.text('Имя базы данных'), findsOneWidget);
    expect(find.text('Логин'), findsOneWidget);
    expect(find.text('Имя пользователя'), findsOneWidget);
    expect(find.text('Пароль'), findsOneWidget);
    expect(find.text('Start'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });

  testWidgets('server type contains MSSQL and ORACLE', (tester) async {
    await tester.pumpWidget(buildPage());

    await tester.tap(find.text('MSSQL'));
    await tester.pumpAndSettle();

    expect(find.text('MSSQL'), findsWidgets);
    expect(find.text('ORACLE'), findsOneWidget);
  });

  testWidgets('required fields are validated', (tester) async {
    await tester.pumpWidget(buildPage());

    await tester.tap(find.text('Start'));
    await tester.pump();

    expect(find.text('Обязательное поле'), findsNWidgets(4));
  });

  testWidgets('password field hides entered text', (tester) async {
    await tester.pumpWidget(buildPage());

    final passwordField = find.byKey(const Key('password-field'));

    await tester.enterText(passwordField, 'secret');

    final textField = tester.widget<TextField>(
      find.descendant(of: passwordField, matching: find.byType(TextField)),
    );

    expect(textField.obscureText, isTrue);
  });
}
