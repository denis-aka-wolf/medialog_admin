import 'package:flutter_test/flutter_test.dart';
import 'package:medialog_admin/app/app.dart';
import 'package:medialog_admin/features/database_connection/presentation/connection_page.dart';

void main() {
  testWidgets('application starts with database connection screen', (
    tester,
  ) async {
    await tester.pumpWidget(const MedialogAdminApp());

    expect(find.byType(ConnectionPage), findsOneWidget);
    expect(find.text('Соединение'), findsOneWidget);
    expect(find.text('Логин'), findsOneWidget);
    expect(find.text('Start'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });
}
