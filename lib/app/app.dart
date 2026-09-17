import 'package:flutter/material.dart';

import 'router.dart';
import 'theme/app_theme.dart';

class MedialogAdminApp extends StatelessWidget {
  const MedialogAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Medialog Admin',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
