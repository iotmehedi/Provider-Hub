import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../main.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? color, elevatedButtonSideBorderColor;
  final Color? backgroundColor;
  final VoidCallback? onPress;
  final text;
  const CustomElevatedButton(
      {super.key, this.color, this.onPress, this.backgroundColor, this.text, this.elevatedButtonSideBorderColor});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(

          style: ElevatedButton.styleFrom(
            elevation: 0,
              backgroundColor: backgroundColor ?? color,
              minimumSize: Size(MediaQuery.of(context).size.width, 60),
              maximumSize: Size(MediaQuery.of(context).size.width, 60),

              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(
                    color: elevatedButtonSideBorderColor ?? Colors.blue, // Set your border color here
                    width: 2.0, // Set the border width here
                  ),)),
          onPressed:  onPress,
          child: text,
        );

  }
}
