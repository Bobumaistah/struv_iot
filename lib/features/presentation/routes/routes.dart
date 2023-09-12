import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';
import 'goroute_widget.dart';

final router = GoRouter(
  routes: [
    goRoute(
      name: 'home',
      path: '/',
      child: const HomePage(),
    ),
  ],
  initialLocation: '/',
  debugLogDiagnostics: true,
  routerNeglect: true,
);
