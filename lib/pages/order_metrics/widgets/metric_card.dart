import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:shop_kpi/theme/app_color.dart';
import 'package:shop_kpi/theme/app_text_styles.dart';

class MetricCard extends StatefulWidget {
  final Widget? icon;

  final String value;
  final String title;
  final Color? tileColor;
  const MetricCard({
    super.key,
    this.icon,
    required this.value,
    required this.title,
    this.tileColor,
  });

  @override
  State<MetricCard> createState() => _MetricCardState();
}

class _MetricCardState extends State<MetricCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final cardPadding = responsiveValue<double>(
      context,
      xs: 12,
      sm: 12,
      md: 14,
      lg: 16,
    );

    final content = [
      Container(
          constraints: BoxConstraints.tight(const Size.square(60)),
          padding: const EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: FittedBox(child: widget.icon)),

      const SizedBox(width: 14),

      // Info
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Value
            Text(widget.value,
                style: AppTextStyle.font16selected600.copyWith(
                    fontSize: responsiveValue<double>(
                  context,
                  xs: 18,
                  md: 20,
                  lg: 20,
                ))),
            const SizedBox(height: 15),
            Text(widget.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.font16desSelected.copyWith(
                    fontSize: responsiveValue<double>(
                  context,
                  xs: 14,
                  md: 16,
                  lg: 16,
                ))),
          ],
        ),
      ),
    ];

    final tileColor = widget.tileColor ?? AppColor.primary;
    final tileBorderRadius = BorderRadiusDirectional.circular(8);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      cursor: SystemMouseCursors.click,
      child: Material(
        color: tileColor,
        elevation: isHovering ? 4.75 : 0,
        borderRadius: tileBorderRadius,
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: EdgeInsetsDirectional.all(cardPadding + 2),
          // decoration: widget.tileDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: content.reversed.toList(),
          ),
        ),
      ),
    );
  }
}
