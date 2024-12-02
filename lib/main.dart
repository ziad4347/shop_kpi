import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_strategy/url_strategy.dart';

import 'config/app_config.dart';
import 'config/app_routes.dart';
import 'providers/orders_provider.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  ResponsiveGridBreakpoints.value = ResponsiveGridBreakpoints(
    sm: 576,
    md: 1240,
    lg: double.infinity,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrdersProvider()..loadOrders(),
      child: MaterialApp.router(
        title: AppConfig.appName,
        theme: appTheme,
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 576, name: MOBILE),
            const Breakpoint(start: 577, end: 1239, name: TABLET),
            const Breakpoint(start: 1240, end: 1439, name: DESKTOP),
            const Breakpoint(start: 1440, end: double.infinity, name: '4K'),
          ],
        ),
        routerConfig: AppRoute.routerConfig,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
