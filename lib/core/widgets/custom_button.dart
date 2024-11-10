import 'package:flutter/material.dart';
import 'package:news_app_api/core/utils/text_style.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color? color;
  final Color? textColor;
  final Function() onPressed;
  final OutlinedBorder? shape;

  const CustomButton({
    super.key,
    this.width,
    this.height,
    required this.text,
    this.color,
    this.textColor,
    required this.onPressed,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // شكل افتراضي بزوايا دائرية
              ),
          backgroundColor: color,
        ),
        child: Text(
          text,
          style: getBodyStyle( color: textColor),
        ),
      ),
    );
  }
}
