import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../main.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? color, elevatedButtonSideBorderColor;
  final Color? backgroundColor;
  final VoidCallback? onPress;
  final double? width;
  final double? height;
  final double? borderRadius;
  final text;
  const CustomElevatedButton(
      {super.key, this.color, this.onPress, this.backgroundColor, this.text, this.elevatedButtonSideBorderColor, this.width, this.height, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(

      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor ?? color,
          minimumSize: Size(width ?? MediaQuery.of(context).size.width, height ??60),
          maximumSize: Size(width ?? MediaQuery.of(context).size.width, height ??60),

          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 10),side: BorderSide(
            color: elevatedButtonSideBorderColor ?? Colors.blue, // Set your border color here
            width: 2.0, // Set the border width here
          ),)),
      onPressed:  onPress,
      child: text,
    );

  }
}
