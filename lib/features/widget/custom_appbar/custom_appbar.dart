import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final String? fontFamily;
  final double? fontSize;
  final Color? textColor;
  final bool? needTitleCenter;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBackPressed,
    this.fontFamily,
    this.fontSize,
    this.textColor,
    this.needTitleCenter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      centerTitle: needTitleCenter ?? true,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style:
             TextStyle(fontWeight: FontWeight.w600, fontFamily: fontFamily ?? "Podkova", fontSize: fontSize ?? 20, color: textColor ?? AppColors.appColors),
      ),
      leading: onBackPressed != null
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBackPressed,
        color: AppColors.white,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
