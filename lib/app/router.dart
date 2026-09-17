import 'package:go_router/go_router.dart';

import '../features/database_connection/presentation/connection_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/database-connection',
  routes: [
    GoRoute(
      path: '/database-connection',
      builder: (context, state) => const ConnectionPage(),
    ),
  ],
);
