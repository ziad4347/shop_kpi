import 'package:flutter/material.dart';

class OrderMetricModel {
  final String title;
  final String value;
  final Widget icon;
  final Color color;

  OrderMetricModel(
      {required this.title,
      required this.value,
      required this.icon,
      required this.color});
}
