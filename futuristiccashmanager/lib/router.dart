import 'pages/pages.dart';
import 'utils/magic_strings.dart';
import 'widgets/main_nav.dart';
import 'package:go_router/go_router.dart';
import './utils/extensions.dart';

final router = GoRouter(initialLocation: RouteName.home.toRoute, routes: [
  ShellRoute(
    builder: (context, state, child) => MainNav(
      child: child,
    ),
    routes: [
      GoRoute(
        path: RouteName.home.toRoute,
        name: RouteName.home.name,
        // builder: (context, state) => const Home(),
        pageBuilder: (context, state) => const NoTransitionPage(child: Home()),
        routes: [
          GoRoute(
            path: RouteName.expenses.name,
            name: RouteName.expenses.name,
            builder: (context, state) => const Expenses(),
          )
        ],
      ),
      GoRoute(
        path: RouteName.payments.toRoute,
        name: RouteName.payments.name,
        // builder: (context, state) => const Payments(),
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: Payments()),
      ),
      GoRoute(
        path: RouteName.dialogs.toRoute,
        name: RouteName.dialogs.name,
        // builder: (context, state) => const Dialogs(),
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: Dialogs()),
      ),
      GoRoute(
        path: RouteName.services.toRoute,
        name: RouteName.services.name,
        // builder: (context, state) => const Services(),
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: Services()),
      ),
      GoRoute(
        path: RouteName.atms.toRoute,
        name: RouteName.atms.name,
        builder: (context, state) => const ATMs(),
        pageBuilder: (context, state) => const NoTransitionPage(child: ATMs()),
      ),
    ],
  ),
]);
