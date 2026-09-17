import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:medialog_admin/app/theme/app_theme.dart';

void main() {
  test('light theme uses Material 3', () {
    final theme = AppTheme.light;

    expect(theme.useMaterial3, isTrue);
  });

  test('light theme uses light brightness', () {
    final theme = AppTheme.light;

    expect(theme.brightness, Brightness.light);
  });

  test('light theme has a color scheme', () {
    final theme = AppTheme.light;

    expect(theme.colorScheme, isNotNull);
  });
}
