import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSimpleText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  const CustomSimpleText({super.key, required this.text, this.fontWeight, this.color, this.fontSize, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      textAlign: textAlign ?? TextAlign.start,
      style: GoogleFonts.roboto(
        letterSpacing: 0.2,
        color: color ?? Colors.black,
        fontSize: fontSize ?? 16.0,
        fontWeight: fontWeight ?? FontWeight.w600,
      ),
    );
  }
}
