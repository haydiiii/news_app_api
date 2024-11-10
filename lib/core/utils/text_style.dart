import 'package:flutter/material.dart';
import 'package:news_app_api/core/utils/colors.dart';

TextStyle getTitleStyle({
  Color? color,
  FontWeight? fontWeight,
  double? fontsize,
}) {
  return TextStyle(
    fontSize: fontsize ?? 20,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? AppColors.primary,
  );
}

TextStyle getBodyStyle(
    {Color? color, FontWeight? fontWeight, double? fontsize}) {
  return TextStyle(
    fontSize: fontsize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? AppColors.white,
  );
}

TextStyle getSmallStyle(
    {Color? color, FontWeight? fontWeight, double? fontsize}) {
  return TextStyle(
    fontSize: fontsize ?? 14,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? AppColors.grey,
  );
}
