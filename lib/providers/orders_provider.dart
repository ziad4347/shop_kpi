import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../models/order_metric_mode.dart';
import '../models/order_model.dart';

class OrdersProvider extends ChangeNotifier {
  List<OrderModel> _orders = [];
  List<OrderMetricModel> orderMetrics = [];
  int get totalOrders => _orders.length;

  double get averagePrice {
    if (_orders.isEmpty) return 0.0;
    return _orders.map((o) => o.price).reduce((a, b) => a + b) / totalOrders;
  }

  int get totalReturns => _orders.where((o) => o.status == 'RETURNED').length;

  setOrderMetrics() {
    orderMetrics = [
      OrderMetricModel(
          title: 'Total Orders',
          value: '$totalOrders',
          icon: const Icon(Icons.shopping_cart_rounded,
              color: Color.fromARGB(255, 238, 53, 228)),
          color: const Color(0xffFFD7FD)),
      OrderMetricModel(
          title: 'Average Price',
          value: '\$${averagePrice.toStringAsFixed(2)}',
          icon: const Icon(
            Icons.graphic_eq_rounded,
            color: Color.fromARGB(255, 51, 139, 255),
          ),
          color: const Color(0xffddecff)),
      OrderMetricModel(
          title: 'Number of Returns',
          value: '$totalReturns',
          icon: const Icon(
            Icons.delivery_dining_rounded,
            color: Color.fromARGB(255, 255, 81, 0),
          ),
          color: const Color(0xffFFE5D9)),
    ];
  }

  List<Map<String, dynamic>> get ordersGraphData {
    final Map<String, int> groupedData = {};
    for (int i = 0; i < _orders.length; i++) {
      final order = _orders[i];
      final date = DateTime.parse(order.registered.toString()).toLocal();
      final monthName = DateFormat('MMM').format(date);
      final key = '$monthName ${date.year}';
      groupedData[key] = (groupedData[key] ?? 0) + 1;
    }

    return groupedData.entries
        .map((entry) => {'month': entry.key, 'count': entry.value})
        .toList();
  }

  Future<void> loadOrders() async {
    final String jsonString = await rootBundle.loadString('assets/orders.json');
    _orders = jsonDecode(jsonString)
        .map<OrderModel>((o) => OrderModel.fromJson(o))
        .toList();

    // Sort orders by date
    _orders.sort((a, b) => a.registered.compareTo(b.registered));

    setOrderMetrics();
    notifyListeners();
  }
}
