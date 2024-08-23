import 'package:flutter/material.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

import '../../../../../../const/utils/consts/app_colors.dart';

class PlanBar extends StatelessWidget {
  final String title1, title2, title3;
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
      required this.titleColor3});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: color1,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Center(
                      child: CustomSimpleText(
                    text: title1,
                    color: titleColor1,
                    fontWeight: FontWeight.w400,
                    fontSize: AppSizes.size12,
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: color2,
                  ),
                  child: Center(
                      child: CustomSimpleText(
                    text: title2,
                    color: titleColor2,
                    fontWeight: FontWeight.w400,
                    fontSize: AppSizes.size12,
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: color3,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Center(
                      child: CustomSimpleText(
                    text: title3,
                    color: titleColor3,
                    fontWeight: FontWeight.w400,
                    fontSize: AppSizes.size12,
                  )),
                ),
              ),
            ],
          ),
          const Positioned(
            bottom: 5, // Position the row 10 pixels from the bottom
            left: 23, // Align the row from the left by 20 pixels
            right: 0,
            top: -5, // Align the row to the right
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 33,
                        weight: 3,
                        fill: 1,
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 98),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 33,
                          weight: 3,
                          fill: 1,
                        )),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 5, // Position the row 10 pixels from the bottom
            left: 20, // Align the row from the left by 20 pixels
            right: 0,
            top: -5, // Align the row to the right
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 33,
                        weight: 10,
                        fill: 1,
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 97.4),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 33,
                          weight: 10,
                          fill: 1,
                        )),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 5, // Position the row 10 pixels from the bottom
            left: 28, // Align the row from the left by 20 pixels
            right: 0,
            top: -5, // Align the row to the right
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 33,
                        weight: 10,
                        fill: 1,
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 97.8),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 33,
                          weight: 10,
                          fill: 1,
                        )),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
