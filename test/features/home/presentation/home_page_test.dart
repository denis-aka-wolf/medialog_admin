import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:medialog_admin/features/home/presentation/home_page.dart';

void main() {
  testWidgets('HomePage displays application title', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.text('Medialog Admin'), findsWidgets);
  });
}