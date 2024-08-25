import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/provider_registration_screen/payment_screens/presentation/controller/payment_controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

import '../../../../../../const/routes/route_name.dart';
import '../../../../../../const/routes/router.dart';
import '../../../../../../const/utils/consts/app_assets.dart';
import '../../../../../widget/custom_elevatedButton/custom_eleveted_button.dart';
import '../../../../../widget/custom_svg/custom_svg_widget.dart';
import '../widget/custom_textformfield_widget.dart';

class CreditCardEnrollScreen extends StatelessWidget {
  CreditCardEnrollScreen({super.key});
  var controller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: CustomAppBar(
            title: "Credit/Debit Card",
            fontSize: AppSizes.size16,
            textColor: AppColors.white,
            onBackPressed: () {
              Navigator.pop(context);
            },
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                 Column(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomSimpleText(
                                      text: "Add a new card",
                                      fontSize: AppSizes.size14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textGreyColor,
                                    ),
                                    10.ph,
                                    Image.asset(
                                      AppAssets.visa,
                                      height: 18,
                                      width: 64,
                                    )
                                  ],
                                ),
                                CustomSvgWidget(
                                  image: AppAssets.security,
                                  height: AppSizes.newSize(2.4),
                                  width: AppSizes.newSize(9.3),
                                ),
                              ],
                            ),
                            30.ph,
                            CustomTextformfieldWidget(hintText: "Card Number"),
                            10.ph,
                            CustomTextformfieldWidget(hintText: "Card Holder Name"),
                            10.ph,
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextformfieldWidget(
                                      hintText: "Expiration (MM/YY)"),
                                ),
                                Expanded(child: SizedBox())
                              ],
                            ),
                            20.ph,
                            Row(
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      CustomTextformfieldWidget(
                                        hintText: "CVV",
                                        needSuffixIcon: true,
                                      ),
                                      Positioned(
                                        right: 0,
                                        bottom: 17,
                                        child: Icon(
                                          Icons.info_outline,
                                          size: 14.19,
                                          color: AppColors.hintTextColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(child: SizedBox())
                              ],
                            ),
                            40.ph,
                            CustomSimpleText(
                              text: "Save Card",
                              fontWeight: FontWeight.bold,
                              fontSize: AppSizes.size14,
                              color: AppColors.hintTextColor,
                            ),
                            20.ph,
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: CustomSimpleText(
                                    text:
                                        "I acknowledge that my card information is saved in my ShopMart accountfor subsequent transactions.",
                                    fontSize: AppSizes.size12,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.hintTextColor,
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: CupertinoSwitch(
                                      value: controller.switchOn.value,
                                      activeColor: AppColors.appColors,
                                      trackColor: AppColors.textGreyColor,
                                      onChanged: (value) {
                                        controller.switchOn.value = value;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                Positioned(
                    bottom: 60,
                    child: SizedBox(
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomSimpleText(
                                  text: "Subtotal:",
                                  fontSize: AppSizes.size16,
                                  color: AppColors.textGreyColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomSimpleText(
                                  text: "US \$50",
                                  fontSize: AppSizes.size12,
                                  color: AppColors.textGreyColor,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomSimpleText(
                                  text: "Total Amount:",
                                  fontSize: AppSizes.size16,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomSimpleText(
                                  text: "US \$50",
                                  fontSize: AppSizes.size16,
                                  color: AppColors.appColors,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 48,
                      child: CustomElevatedButton(
                          text: CustomSimpleText(
                            text: "Pay Now",
                            fontSize: 20,
                            color: AppColors.white,
                          ),
                          onPress: () {
                            RouteGenerator.pushNamed(
                                context, Routes.homepage);
                          },
                          backgroundColor: AppColors.appColors,
                          elevatedButtonSideBorderColor: AppColors.appColors),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
