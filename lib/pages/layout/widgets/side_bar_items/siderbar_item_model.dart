import 'package:flutter/material.dart';

class SidebarItemModel {
  final String name;
  final IconData iconPath;
  final String? navigationPath;
  final bool isPage;

  SidebarItemModel({
    required this.name,
    required this.iconPath,
    this.navigationPath,
    this.isPage = false,
  });
}

List<SidebarItemModel> get sideBarMenu {
  return <SidebarItemModel>[
    SidebarItemModel(
      name: 'Orders Metrics',
      iconPath: Icons.account_tree_rounded,
      navigationPath: '/orders-metrics',
    ),
    SidebarItemModel(
      name: 'Orders Graph',
      iconPath: Icons.bar_chart_rounded,
      navigationPath: '/graph',
    ),
  ];
}
