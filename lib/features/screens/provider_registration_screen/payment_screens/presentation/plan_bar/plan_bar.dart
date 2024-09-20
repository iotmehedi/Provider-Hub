import 'package:flutter/material.dart';
import 'package:provider_hub/const/utils/consts/app_assets.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

import '../../../../../../const/utils/consts/app_colors.dart';

class PlanBar extends StatelessWidget {
  final String title1, title2, title3, from;
  final Color color1, color2, color3, titleColor1, titleColor2, titleColor3;
  const PlanBar(
      {super.key,
      required this.title1,
      required this.title2,
      required this.title3,
      required this.color1,
      required this.color2,
      required this.color3,
      required this.titleColor1,
      required this.titleColor2,
      required this.titleColor3,
      this.from = ''});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Image.asset(AppAssets.arrowOne),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: from == "two" ||  from == "three"
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          AppAssets.arrowFour,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fitWidth,
                        ),
                        CustomSimpleText(
                          text: title2,
                          color: titleColor2,
                          fontWeight: FontWeight.w400,
                          fontSize: AppSizes.size12,
                          alignment: Alignment.center,
                        )
                      ],
                    )
                  : Image.asset(AppAssets.arrowTwo),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100)),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                     from == "three" ? AppAssets.arrowFive : AppAssets.arrowThreee,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                    CustomSimpleText(
                      text: title3,
                      color: titleColor3,
                      fontWeight: FontWeight.w400,
                      fontSize: AppSizes.size12,
                      alignment: Alignment.center,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
