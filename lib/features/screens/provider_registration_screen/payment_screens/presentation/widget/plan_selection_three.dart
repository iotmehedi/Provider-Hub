import 'package:flutter/material.dart';
import 'package:provider_hub/const/utils/consts/app_assets.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

class PlanSelectionWidgetThree extends StatelessWidget {
  const PlanSelectionWidgetThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.ph,
        CustomSimpleText(
          text: "Payment Methods",
          fontWeight: FontWeight.w400,
          fontSize: AppSizes.size13,
          color: AppColors.white,
        ),
        20.ph,
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.card,
                    width: 25,
                    height: 25,
                  ),
                  20.pw,
                  CustomSimpleText(
                    text: "Credit/Debit Card",
                    fontWeight: FontWeight.w400,
                    fontSize: AppSizes.size13,
                    color: AppColors.textGreyColor,
                  ),
                ],
              ),
            ),
            Expanded(child: Image.asset(AppAssets.visa, height: 18, width: 56,))
          ],
        ),
        5.ph,
        Divider()
      ],
    );
  }
}
