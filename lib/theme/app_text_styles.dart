import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTextStyle {
  ///FontSize
  static const TextStyle _fontSize20 = TextStyle(fontSize: 20);
  static const TextStyle _fontSize16 = TextStyle(fontSize: 16);
  static const TextStyle _fontSize14 = TextStyle(fontSize: 14);
  static const TextStyle _fontSize12 = TextStyle(fontSize: 12);

  static const TextStyle _fontWeight600 =
      TextStyle(fontWeight: FontWeight.w600);

  ///Font Family
  static const TextStyle _fontInter = TextStyle(fontFamily: "Inter", height: 1);

  ///FontStyle
  static TextStyle font20primary600 = _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize20)
      .copyWith(color: AppColor.primary);
  static TextStyle font16selected600 = _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize16)
      .copyWith(color: AppColor.selected);
  static TextStyle font16white =
      _fontInter.merge(_fontSize16).copyWith(color: AppColor.white);
  static TextStyle font16desSelected =
      _fontInter.merge(_fontSize16).copyWith(color: AppColor.desSelected);
  static TextStyle font14desSelected600 = _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize14)
      .copyWith(color: AppColor.desSelected);
  static TextStyle font14selected600 = _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize14)
      .copyWith(color: AppColor.selected);
  static TextStyle font12selected600 = _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize12)
      .copyWith(color: AppColor.selected);
  static TextStyle font12desSelected600 = _fontInter
      .merge(_fontWeight600)
      .merge(_fontSize12)
      .copyWith(color: AppColor.desSelected);
}
