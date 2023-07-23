import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String textString;
  FontWeight? textFontWeight;
  double? textFontSize;
  Color? textColor;
  String? textFamily;
  TextAlign? textAlign;
  CustomText(
      {super.key,
      required this.textString,
      this.textFontWeight,
      this.textFontSize,
      this.textColor,
      this.textAlign,
      this.textFamily});

  @override
  Widget build(BuildContext context) {
    return Text(
      textString,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
          // fontFamily: textFamily ?? 'Comfortaa',
          fontSize: textFontSize ?? 12,
          color: textColor ?? Colors.black87,
          fontWeight: textFontWeight ?? FontWeight.w600),
    );
  }
}
