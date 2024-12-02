import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'widgets/side_bar.dart';
import 'widgets/top_bar.dart';

class LayoutScreen extends StatefulWidget {
  final Widget child;
  const LayoutScreen({super.key, required this.child});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isIconOnly = false;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    return Scaffold(
      key: scaffoldKey,
      drawer: isDesktop ? null : SideBar(iconOnly: isIconOnly),
      endDrawer: null,
      appBar: isDesktop
          ? null
          : TopBar(
              onMenuPressed: () {
                isIconOnly = false;
                scaffoldKey.currentState?.openDrawer();
                setState(() {});
              },
            ),
      body: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDesktop)
            ResponsiveRowColumnItem(child: SideBar(iconOnly: isIconOnly)),
          ResponsiveRowColumnItem(
            rowFit: FlexFit.tight,
            child: ResponsiveRowColumn(
              layout: ResponsiveRowColumnType.COLUMN,
              children: [
                if (isDesktop)
                  ResponsiveRowColumnItem(
                    child: TopBar(
                      onMenuPressed: () {
                        setState(() {
                          isIconOnly = !isIconOnly;
                        });
                      },
                    ),
                  ),
                ResponsiveRowColumnItem(
                    columnFit: FlexFit.tight,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: widget.child)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
