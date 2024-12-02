import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:shop_kpi/theme/app_text_styles.dart';

import '../../../providers/orders_provider.dart';
import '../../../theme/app_color.dart';

class OrdersChart extends StatefulWidget {
  const OrdersChart({super.key});

  @override
  State<OrdersChart> createState() => _OrdersChartState();
}

class _OrdersChartState extends State<OrdersChart> {
  int touchedLineIndex = 5;
  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);
    final ordersGraphData = ordersProvider.ordersGraphData;
    final maxCount = ordersGraphData
        .map((e) => e['count'] ?? 0)
        .reduce((a, b) => a > b ? a : b);
    final theme = Theme.of(context);
    const totalEarningColor = AppColor.primary;
    final double maxY = (maxCount * 1.5).toDouble();
    final double intervalY = maxY / 5;
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: '● ',
                style: TextStyle(color: totalEarningColor),
              ),
              TextSpan(
                text: "Total Orders: ",
                style: AppTextStyle.font14desSelected600,
              ),
              TextSpan(
                text: ordersProvider.totalOrders.toString(),
                style: AppTextStyle.font14selected600,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Flexible(
          child: LineChart(
            LineChartData(
              minX: 1,
              maxX: ordersGraphData.length.toDouble(),
              minY: 0,
              maxY: maxY,
              gridData: FlGridData(
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: theme.colorScheme.outline,
                  strokeWidth: 1,
                  dashArray: [10, 5],
                ),
              ),
              borderData: FlBorderData(show: false),
              lineTouchData: LineTouchData(
                getTouchedSpotIndicator: (barData, spotIndexes) {
                  return spotIndexes
                      .map(
                        (item) => TouchedSpotIndicatorData(
                          const FlLine(color: totalEarningColor),
                          FlDotData(
                            getDotPainter: (p0, p1, p2, p3) {
                              return FlDotCirclePainter(
                                color: Colors.white,
                                strokeWidth: 2.5,
                                strokeColor: p2.color ?? Colors.transparent,
                              );
                            },
                          ),
                        ),
                      )
                      .toList();
                },
                getTouchLineStart: (lineData, index) {
                  touchedLineIndex = index;

                  return 0;
                },
                touchCallback: (touchevent, touchresponse) {
                  if (mounted) {
                    setState(() {});
                  }
                },
                touchTooltipData: LineTouchTooltipData(
                  maxContentWidth: 240,
                  tooltipHorizontalOffset: touchedLineIndex == 0
                      ? 50
                      : touchedLineIndex == ordersGraphData.length - 1
                          ? -50
                          : touchedLineIndex == ordersGraphData.length - 2
                              ? -30
                              : 0,
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((item) {
                      final value = item.bar.spots[item.spotIndex].y;
                      // print(item.bar.spots[item.spotIndex].x);

                      return LineTooltipItem(
                        "",
                        theme.textTheme.bodySmall!,
                        textAlign: TextAlign.start,
                        children: [
                          TextSpan(
                            text:
                                ' ${ordersGraphData[item.spotIndex]['month']}\n',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          /// Text Dot Indicator [used for the replacement of a circle widget. due to the limitation of fl_chart package, LineTooltipItem class doesn't support a widget span]
                          TextSpan(
                            text: '● ',
                            style: TextStyle(color: item.bar.color),
                          ),
                          TextSpan(
                            text: "Total Orders: ",
                            style: AppTextStyle.font12desSelected600,
                          ),

                          TextSpan(
                            text: " $value",
                            style: AppTextStyle.font12selected600,
                          ),
                        ],
                      );
                    }).toList();
                  },
                  tooltipRoundedRadius: 4,
                  getTooltipColor: (touchedSpot) {
                    return Colors.white;
                  },
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: List.generate(
                      ordersGraphData.length,
                      (index) => FlSpot(index.toDouble() + 1,
                          ordersGraphData[index]['count']?.toDouble() ?? 0)),
                  isCurved: true,
                  barWidth: 2,
                  dotData: const FlDotData(show: false),
                  color: totalEarningColor,
                  belowBarData: BarAreaData(
                    show: true,
                    applyCutOffY: true,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [100, 80],
                      tileMode: TileMode.decal,
                      colors: [
                        totalEarningColor.withOpacity(0.075),
                        Colors.white,
                      ],
                    ),
                  ),
                ),
              ],
              titlesData: FlTitlesData(
                topTitles: _getTitlesData(context, show: false),
                rightTitles: _getTitlesData(context, show: false),
                leftTitles: _getTitlesData(
                  context,
                  reservedSize: 30,
                  interval: intervalY,
                  getTitlesWidget: (value, titleMeta) {
                    return Text(
                      "${value.toInt()}",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onTertiary,
                      ),
                    );
                  },
                ),
                bottomTitles: _getTitlesData(
                  context,
                  interval: 2,
                  reservedSize: 30,
                  getTitlesWidget: (value, titleMeta) {
                    return Visibility(
                      visible: value.toInt() > 1,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 10,
                        ),
                        child: Text(
                          "${ordersGraphData[value.toInt() - 1]['month'].split(' ')[0]}",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onTertiary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  AxisTitles _getTitlesData(
    BuildContext context, {
    bool show = true,
    Widget Function(double value, TitleMeta titleMeta)? getTitlesWidget,
    double reservedSize = 22,
    double? interval,
  }) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: show,
        getTitlesWidget: getTitlesWidget ?? defaultGetTitle,
        reservedSize: reservedSize,
        interval: interval,
      ),
    );
  }
}
