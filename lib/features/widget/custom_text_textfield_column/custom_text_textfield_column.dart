import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';

import '../../../const/utils/consts/textstyle.dart';
import '../textfield/textField_widget.dart';

class CustomTextTextfieldColumn extends StatelessWidget {
  final String text, hint;
  final TextEditingController textEditingController;
  const CustomTextTextfieldColumn({super.key, required this.text, required this.hint, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        globalText14(text: text, fontWeight: FontWeight.w500, color: AppColors.white),
        const SizedBox(
          height: 5,
        ),
        CustomSimpleTextField(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            hexColor: HexColor('80848A'),
            controller: textEditingController,
            keyboardType: TextInputType.number,
            paddingNeed: true,
            hint: hint,
            textAlign: TextAlign.start),
      ],
    );
  }
}
