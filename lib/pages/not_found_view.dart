import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shop_kpi/theme/app_color.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Text(
              "Not Found",
              textAlign: TextAlign.center,
              style: textTheme.headlineLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8.0),
            Text(
              "This page doesn't exist or was removed! \nWe suggest you back to home",
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium
                  ?.copyWith(color: theme.colorScheme.onTertiary),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                backgroundColor: AppColor.primary,
                foregroundColor: AppColor.white,
                textStyle: textTheme.headlineSmall,
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
              ),
              onPressed: () => context.go('/orders-metrics'),
              label: const Text('Go Back'),
            )
          ],
        ),
      ),
    );
  }
}
