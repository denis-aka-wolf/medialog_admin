import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:medialog_admin/app/app.dart';

void main() {
  testWidgets('application starts successfully', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MedialogAdminApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Medialog Admin'), findsWidgets);
  });
}