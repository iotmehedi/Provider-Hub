import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/consts/textstyle.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/provider_registration_screen/payment_screens/presentation/controller/payment_controller.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

import '../../../../../widget/custom_elevatedButton/custom_eleveted_button.dart';

class PlanSelectionWidgetOne extends StatelessWidget {
  final PaymentController controller;
  const PlanSelectionWidgetOne({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.ph,
              globalText28(
                  text: "Best Plan for you",
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              globalText16(
                  text:
                      "You have to choose a package for registering as a provider. Kindly choose one.",
                  color: AppColors.textGreyColor),
              20.ph,
              Column(
                children: [
                  Obx(()=> InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: (){
                      controller.planSelection.value = false;
                    },
                    child: Container(
                      height: AppSizes.newSize(22.8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.appColors),
                          color: controller.planSelection.value == false ? AppColors.appColors : Colors.transparent,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomSimpleText(
                                    text: "US \$${controller.registerController.firstPrice.value}",
                                    fontSize: AppSizes.newSize(4.0),
                                    color: controller.planSelection.value == false ? AppColors.white : AppColors.appColors,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomSimpleText(
                                    text: " / month",
                                    fontSize: AppSizes.newSize(3.0),
                                    color: controller.planSelection.value == false ? AppColors.white : AppColors.appColors,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: CustomSimpleText(
                                  text: "Select Plan",
                                  color: controller.planSelection.value == false ? AppColors.white : AppColors.appColors,
                                  textAlign: TextAlign.end,
                                  alignment: Alignment.centerRight,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                  40.ph,
                  Obx(()=> InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: (){
                      controller.planSelection.value = true;
                    },
                    child: Container(
                      height: AppSizes.newSize(22.8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: controller.planSelection.value == true ? AppColors.appColors : Colors.transparent,
                        border: Border.all(color: AppColors.appColors),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomSimpleText(
                                    text: "US \$${controller.registerController.secondPrice.value}",
                                    fontSize: AppSizes.newSize(4.0),
                                    color: controller.planSelection.value == true ? AppColors.white : AppColors.appColors,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomSimpleText(
                                    text: " / month",
                                    fontSize: AppSizes.newSize(3.0),
                                    color: controller.planSelection.value == true ? AppColors.white : AppColors.appColors,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: CustomSimpleText(
                                  text: "Select Plan",
                                  color: controller.planSelection.value == true ? AppColors.white : AppColors.appColors,
                                  textAlign: TextAlign.end,
                                  alignment: Alignment.centerRight,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),),
                ],
              ),
            ],
          ),
    );
  }
}
