import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? logoutButton;
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
    this.needTitleCenter,
    this.logoutButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      centerTitle: needTitleCenter ?? true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: fontFamily ?? "Podkova",
                fontSize: fontSize ?? 20,
                color: textColor ?? AppColors.appColors),
          ),
        ],
      ),
      leading: onBackPressed != null
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBackPressed,
              color: AppColors.white,
            )
          : null,
      actions: logoutButton != null
          ? [
              IconButton(
                  onPressed: logoutButton,
                  icon: Column(
                    children: [
                      Icon(
                        Icons.logout,
                        color: AppColors.white,
                      ),
                      2.ph,
                      CustomSimpleText(
                        text: "Sign Out",
                        fontSize: AppSizes.size11,
                        color: AppColors.white,
                        alignment: Alignment.centerLeft,
                      )
                    ],
                  )),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
