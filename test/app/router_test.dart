import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:medialog_admin/app/app.dart';
import 'package:medialog_admin/features/home/presentation/home_page.dart';

void main() {
  testWidgets('initial route opens HomePage', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MedialogAdminApp()));

    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
  });
}
