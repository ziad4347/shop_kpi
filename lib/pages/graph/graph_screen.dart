import 'package:flutter/material.dart';

import 'widgets/orders_chart.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {

    
    return  const Scaffold(
     
      body: Padding(
        padding: EdgeInsets.all(30),
     
        child: OrdersChart(),
      ),
    );
  }
}
