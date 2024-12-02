import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';
import 'app_text_styles.dart';

ThemeData get appTheme => ThemeData(
    useMaterial3: true,
    fontFamily: "inter",
    dividerTheme: const DividerThemeData(
      color: AppColor.divider,
    ),
    appBarTheme:  AppBarTheme(
        shape: const RoundedRectangleBorder(),
        shadowColor: Colors.black,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 65,
        elevation: 0,
        titleTextStyle: AppTextStyle.font14desSelected600,
        titleSpacing: 5,
        backgroundColor: AppColor.background_2,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: AppColor.backGround,
            statusBarIconBrightness: Brightness.dark)),
    drawerTheme: const DrawerThemeData(
      shape: RoundedRectangleBorder(),
      shadowColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      backgroundColor: AppColor.background_2,
    ),
    scaffoldBackgroundColor: AppColor.backGround,
    // highlightColor: Colors.transparent,
    // focusColor: Colors.transparent,
    // hoverColor: Colors.transparent,
    // splashColor: Colors.transparent,
    dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: AppTextStyle.font14selected600,
        menuStyle: const MenuStyle(
            backgroundColor: WidgetStatePropertyAll(AppColor.background_2),
            surfaceTintColor: WidgetStatePropertyAll(Colors.transparent))),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppColor.background_2,
    ),
    colorScheme: const ColorScheme.light(
        primary: AppColor.primary, surface: AppColor.backGround));
