import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezlotto/helper/constants.dart';
import 'package:freezlotto/helper/font_styles.dart';

class FLText extends StatelessWidget {
  FLText(
      {this.text,
      this.fontSize = 12,
      this.bold = false,
      this.semiBold = false,
      this.maxLines,
      this.underline = false,
      this.textAlign,
      this.overflow = TextOverflow.ellipsis,
      this.color = Colors.black});

  final String text;
  final double fontSize;
  final bool bold;
  final bool semiBold;
  final int maxLines;
  final bool underline;
  final TextAlign textAlign;
  final Color color;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text == null ? " " : text,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: false,
      style: new TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          fontFamily: SEMI_BOLD_FONT,
          decoration: underline ? TextDecoration.underline : null,
          // fontFamily: Constants.segoe_font,
          ),
      textAlign: textAlign,
    );
  }
}
