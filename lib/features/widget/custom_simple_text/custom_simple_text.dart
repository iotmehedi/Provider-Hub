import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSimpleText extends StatelessWidget {
  final String text;
  final Color? color, decorationColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextDecoration? textDecoration;
  const CustomSimpleText(
      {super.key,
      required this.text,
      this.fontWeight,
      this.color,
      this.fontSize,
      this.textAlign,
      this.maxLines,
      this.textDecoration,
        this.decorationColor
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 2,
      textAlign: textAlign ?? TextAlign.start,
      style: GoogleFonts.roboto(
        letterSpacing: 0.2,
        color: color ?? Colors.black,
        fontSize: fontSize ?? 16.0,
        fontWeight: fontWeight ?? FontWeight.w600,
        decoration: textDecoration ?? TextDecoration.none,
        decorationColor: decorationColor ?? Colors.transparent
      ),
    );
  }
}
