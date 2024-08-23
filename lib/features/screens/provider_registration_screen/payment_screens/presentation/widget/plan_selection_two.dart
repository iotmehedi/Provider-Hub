import 'package:flutter/material.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

class PlanSelectionTwo extends StatelessWidget {
  const PlanSelectionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          20.ph,
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomSimpleText(
                  text: "Provider Hub - Provider monthly plan",
                  fontSize: AppSizes.newSize(1.8),
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
                CustomSimpleText(
                  text: "US \$50",
                  fontSize: AppSizes.newSize(2.5),
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                CustomSimpleText(
                  text: "Next Payment 5th January, 2024",
                  fontSize: AppSizes.newSize(1.3),
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
