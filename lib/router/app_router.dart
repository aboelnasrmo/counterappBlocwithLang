import 'package:app1/pages/settings.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const Settings(),
      ),
    ],
  );
}
