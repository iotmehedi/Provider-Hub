import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';

import '../../../const/utils/consts/textstyle.dart';
import '../textfield/textField_widget.dart';

class CustomTextTextfieldColumn extends StatelessWidget {
  final String text, hint;
  final TextEditingController textEditingController;
  final bool? isNeedIcon;
  const CustomTextTextfieldColumn({super.key, required this.text, required this.hint, required this.textEditingController, this.isNeedIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            globalText14(text: text, fontWeight: FontWeight.w500, color: AppColors.white),
            Visibility(
                visible: isNeedIcon == true ? true : false,
                child: Icon(Icons.info, size: 20,color: HexColor("525252"),))
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        CustomSimpleTextField(
            fontWeight: FontWeight.normal,
            fontSize: 16.0,
            hexColor: HexColor('80848A'),
            controller: textEditingController,
            keyboardType: TextInputType.text,
            paddingNeed: true,
            hint: hint,
            textAlign: TextAlign.start),
      ],
    );
  }
}
