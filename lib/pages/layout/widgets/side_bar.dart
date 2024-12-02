import 'package:flutter/material.dart';

import '../../../../../config/app_config.dart';
import '../../../theme/app_color.dart';
import '../../../theme/app_text_styles.dart';
import 'side_bar_items/side_bar_items.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SideBar extends StatelessWidget {
  final bool iconOnly;
  const SideBar({super.key, required this.iconOnly});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: iconOnly ? 80 : 300,
    
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:iconOnly?12: 20, vertical: 30),
        child: Column(
          children: [
            ///Header
            Column(
              children: [
                Row(
                  mainAxisAlignment: iconOnly
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                     Icon(
                     MdiIcons.chartBubble,
                      size: 32,
                      color: AppColor.primary,
                    ),
                    if (!iconOnly)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 9),
                        child: Text(
                          AppConfig.appName,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.font20primary600,
                        ),
                      )
                  ],
                ),
                const SizedBox(height: 15),
                const Divider(),
                const SizedBox(height: 15),
              ],
            ),

            Expanded(
              child: SideBarItems(iconOnly: iconOnly),
            )
          ],
        ),
      ),
    );
  }
}
