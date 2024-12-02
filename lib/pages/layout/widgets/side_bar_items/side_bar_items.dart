import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../theme/app_color.dart';
import '../../../../theme/app_text_styles.dart';
import 'siderbar_item_model.dart';

class SideBarItems extends StatefulWidget {
  final bool iconOnly;
  const SideBarItems({super.key, required this.iconOnly});

  @override
  State<SideBarItems> createState() => _SideBarItemsState();
}

class _SideBarItemsState extends State<SideBarItems> {
  String _currentRoute = '';

  @override
  Widget build(BuildContext context) {
    _currentRoute =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    return ListView.separated(
      itemCount: sideBarMenu.length,
      itemBuilder: (BuildContext context, int index) => _SectionTitle(
        onTap: () {
          _handleNavigation(context, menu: sideBarMenu[index]);
        },
        currentRoute: _currentRoute,
        iconOnly: widget.iconOnly,
        sidebarItemModel: sideBarMenu[index],
      ),
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 10),
    );
  }

  void _handleNavigation(
    BuildContext context, {
    required SidebarItemModel menu,
  }) {
    String? route = menu.navigationPath;

    if (route == null || route.isEmpty) {
      return;
    }

    if (_currentRoute == route) return;

    context.go(route);
    Scaffold.of(context).closeDrawer();
  }
}

class _SectionTitle extends StatefulWidget {
  final String currentRoute;
  final SidebarItemModel sidebarItemModel;
  final Function()? onTap;
  final bool iconOnly;
  const _SectionTitle(
      {required this.currentRoute,
      required this.sidebarItemModel,
      required this.onTap,
      this.iconOnly = false});

  @override
  _SectionTitleState createState() => _SectionTitleState();
}

class _SectionTitleState extends State<_SectionTitle> {
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.currentRoute
        .contains(widget.sidebarItemModel.navigationPath ?? "");
    return widget.iconOnly
        ? Material(
            color: isSelected ? AppColor.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAlias,
            child: Tooltip(
              message: widget.sidebarItemModel.name,
              child: InkWell(
                onTap: widget.onTap,
                mouseCursor: SystemMouseCursors.click,
                child: SizedBox(
                  width: 80,
                  height: 56,
                  child: Center(
                    child: Icon(
                      widget.sidebarItemModel.iconPath,
                      size: 23,
                      color: isSelected ? AppColor.white : AppColor.desSelected,
                    ),
                  ),
                ),
              ),
            ),
          )
        : ListTile(
            onTap: widget.onTap,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            minVerticalPadding: 15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            selected: isSelected,
            selectedTileColor: AppColor.primary,
            title: Row(
              children: [
                Icon(
                  widget.sidebarItemModel.iconPath,
                  size: 20,
                  color: isSelected ? AppColor.white : AppColor.desSelected,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10.0),
                  child: Text(
                    widget.sidebarItemModel.name,
                    overflow: TextOverflow.ellipsis,
                    style: isSelected
                        ? AppTextStyle.font16white
                        : AppTextStyle.font16desSelected,
                  ),
                )
              ],
            ),
          );
  }
}
