import 'package:flutter/material.dart';
import 'package:news_app_api/core/utils/colors.dart';
import 'package:news_app_api/core/utils/text_style.dart';

showSnackbarDialog({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.white,
      content: Text(
        message,
        style: getBodyStyle(color: AppColors.primary),
      ),
    ),
  );
}
