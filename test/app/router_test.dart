import 'package:flutter_test/flutter_test.dart';
import 'package:medialog_admin/app/app.dart';
import 'package:medialog_admin/features/database_connection/presentation/connection_page.dart';

void main() {
  testWidgets('initial route opens Database Connection page', (tester) async {
    await tester.pumpWidget(const MedialogAdminApp());

    expect(find.byType(ConnectionPage), findsOneWidget);
  });
}
