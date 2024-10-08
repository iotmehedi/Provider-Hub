import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/src/hexcolor_base.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final Function(String?)? onChanged;

  const CustomTextField(
      {super.key,
      required this.hint,
      this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.textInputType,
      this.textInputAction,
      required this.obscureText,
      this.validator,
      this.errorText,
      this.onChanged,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      textInputAction: textInputAction,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: hint,
        errorText: errorText,
        border: const OutlineInputBorder(),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(16.0),
          child: prefixIcon,
        ),
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
    );
  }
}

class CustomSimpleTextField extends StatelessWidget {
  final String? hint, suffixText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixIconColor, hintTextColor;
  final bool? paddingNeed, onlyNeedSuffix;
  final TextAlign? textAlign;
  final FontWeight? fontWeight, hintFontWeight;
  final double? fontSize, hintTextFontSize;
  final MaterialColor? color;
  final HexColor? hexColor;
  final String? Function(String?)? validator;
  final bool? obscureText;
  CustomSimpleTextField(
      {super.key,
      this.hint,
      this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.keyboardType,
      this.textInputAction,
      this.prefixIconColor,
      this.paddingNeed,
      this.textAlign,
      this.fontWeight,
      this.fontSize,
      this.color,
      this.hexColor,
      this.validator,
      this.suffixText,
      this.hintTextFontSize,
      this.hintFontWeight,
      this.hintTextColor,
      this.onlyNeedSuffix,
      this.obscureText,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.appColors,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.appColors, width: 1)
      ),
      child: TextFormField(
        obscureText: obscureText ?? false,
        keyboardType: keyboardType ?? TextInputType.number,
        textInputAction: textInputAction,
        textAlign: textAlign ?? TextAlign.start,
        controller: controller,
        validator: validator,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: AppColors.white),
        decoration:
            InputDecoration(
              isDense: false,
              isCollapsed: false,
              hintText: hint,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
          hintTextDirection: TextDirection.ltr,
          suffixText: suffixText,
          suffixStyle: TextStyle(color: Colors.black, fontSize: 20),
              filled: true,
          fillColor: AppColors.deepGrey,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(4),
              ),

          contentPadding: EdgeInsets.only(
              left: 10,
              bottom:  0,
              right: 10, top: 5),
          hintStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                )
        ),

      ),
    );
  }
}
