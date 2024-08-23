import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../const/utils/consts/app_colors.dart';
import '../../../../../../const/utils/consts/app_sizes.dart';

class CustomTextformfieldWidget extends StatelessWidget {
  final String hintText;
  final bool? needSuffixIcon;
  const CustomTextformfieldWidget({super.key, required this.hintText, this.needSuffixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration.collapsed(hintText: hintText, hintStyle: GoogleFonts.roboto(
            letterSpacing: 0.2,
            color: AppColors.hintTextColor,
            fontSize: AppSizes.size14,
            fontWeight: FontWeight.normal,
          ),

          )
            ..applyDefaults(Theme.of(context).inputDecorationTheme),
        ),
        Divider()
      ],
    );
  }
}
