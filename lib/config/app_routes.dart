import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:shop_kpi/pages/order_metrics/orders_metrics_screen.dart';

import '../pages/graph/graph_screen.dart';
import '../pages/layout/layout_screen.dart';
import '../pages/not_found_view.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext? get currentContext => navigatorKey.currentContext;

  static Future pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) async {
    return await navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  static Future pushNamed(
    String routeName, {
    Object? arguments,
  }) async {
    return await navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static pop<T>([T? result]) {
    return navigatorKey.currentState?.pop(result);
  }

  static bool get canPop => navigatorKey.currentState?.canPop() ?? false;

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static const _initialPath = '/';
  static final routerConfig = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    initialLocation: _initialPath,
    routes: [
      GoRoute(
        path: _initialPath,
        redirect: (context, state) {
          return '/orders-metrics';
        },
      ),

      ShellRoute(
        navigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
            child: LayoutScreen(child: child),
          );
        },
        routes: [
          GoRoute(
            path: '/orders-metrics',
            redirect: (context, state) async {
              if (state.fullPath == '/') {
                return '/orders-metrics';
              }
              return null;
            },
            pageBuilder: (context, state) => const NoTransitionPage(
              child: OrderMetricsScreen(),
            ),
          ),
          GoRoute(
            path: '/graph',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: GraphScreen(),
            ),
          ),
        ],
      ),

      // Full Screen Pages
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundScreen(),
    ),
  );
}
