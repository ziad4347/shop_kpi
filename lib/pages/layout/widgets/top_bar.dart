import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../theme/app_color.dart';
import '../../../theme/app_text_styles.dart';
import 'side_bar_items/siderbar_item_model.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;

  const TopBar({super.key, required this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    final currentRoute =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    return AppBar(
      leading: IconButton(
        onPressed: onMenuPressed,
        tooltip: "open menu",
        icon: const Icon(
          Icons.menu_rounded,
          color: AppColor.selected,
          size: 24,
        ),
      ),
      toolbarHeight:  ResponsiveValue<double?>(
        context,
        conditionalValues: [
          const Condition.largerThan(name: TABLET, value: 70)
        ],
      ).value,
      title: Row(
        children: [
          Text(
            sideBarMenu
                .firstWhere((element) =>
                    currentRoute.contains(element.navigationPath ?? ''))
                .name,
            style: AppTextStyle.font16selected600,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 65);
}
