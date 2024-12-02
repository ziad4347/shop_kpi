import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../../providers/orders_provider.dart';
import 'widgets/metric_card.dart';

class OrderMetricsScreen extends StatelessWidget {
  const OrderMetricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);
    final padding = responsiveValue<double>(
      context,
      xs: 16,
      lg: 24,
    );
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: ResponsiveGridRow(
          rowSegments: 60,
          children: ordersProvider.orderMetrics
              .map((e) => ResponsiveGridCol(
                    lg: 20,
                    md: 60,
                    xs: 100,
                    child: Padding(
                      padding: EdgeInsets.all(padding / 2.5),
                      child: MetricCard(
                        title: e.title,
                        icon: e.icon,
                        value: e.value,
                        tileColor: e.color,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
