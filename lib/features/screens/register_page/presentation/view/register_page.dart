import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/widget/custom_elevatedButton/custom_eleveted_button.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

import '../../../../../const/routes/route_name.dart';
import '../../../../../const/routes/router.dart';
import '../../../../../const/utils/consts/app_assets.dart';
import '../../../../widget/custom_svg/custom_svg_widget.dart';
import '../controller/register_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  var controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Center(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomSvgWidget(
                      image: AppAssets.logo,
                      height: 217.0,
                      width: 259.0,
                    ),
                    30.ph,
                    CustomElevatedButton(
                        text: CustomSimpleText(
                          text: "Register As a Provider",
                          fontSize: 21,
                          color:
                              controller.selectRegistrationOptions.value != "0"
                                  ? AppColors.appColors
                                  : AppColors.white,
                        ),
                        onPress: () {
                          controller.firstPrice.value = "50";
                          controller.secondPrice.value = "500";
                          controller.selectRegistrationOptions.value = "0";
                          RouteGenerator.pushNamed(context,Routes.providerRegScreen);
                        },
                        backgroundColor:
                            controller.selectRegistrationOptions.value == "0"
                                ? AppColors.appColors
                                : Colors.transparent,
                        elevatedButtonSideBorderColor:
                            controller.selectRegistrationOptions.value == "0"
                                ? Colors.transparent
                                : AppColors.appColors),
                    20.ph,
                    CustomElevatedButton(
                        text: CustomSimpleText(
                          text: "Register As a Trainer",
                          fontSize: 21,
                          color:
                              controller.selectRegistrationOptions.value != "1"
                                  ? AppColors.appColors
                                  : AppColors.white,
                        ),
                        onPress: () {
                          controller.firstPrice.value = "20";
                          controller.secondPrice.value = "220";
                          controller.selectRegistrationOptions.value = "1";
                          RouteGenerator.pushNamed(context,Routes.trainerRegScreen);
                        },
                        backgroundColor:
                            controller.selectRegistrationOptions.value == "1"
                                ? AppColors.appColors
                                : Colors.transparent,
                        elevatedButtonSideBorderColor:
                            controller.selectRegistrationOptions.value == "1"
                                ? Colors.transparent
                                : AppColors.appColors),
                    20.ph,
                    CustomElevatedButton(
                        text: CustomSimpleText(
                          text: "Register As a Consultant",
                          fontSize: 21,
                          color:
                              controller.selectRegistrationOptions.value != "2"
                                  ? AppColors.appColors
                                  : AppColors.white,
                        ),
                        onPress: () {
                          controller.firstPrice.value = "20";
                          controller.secondPrice.value = "220";
                          controller.selectRegistrationOptions.value = "2";
                          RouteGenerator.pushNamed(context,Routes.consultantRegScreen);
                        },
                        backgroundColor:
                            controller.selectRegistrationOptions.value == "2"
                                ? AppColors.appColors
                                : Colors.transparent,
                        elevatedButtonSideBorderColor:
                            controller.selectRegistrationOptions.value == "2"
                                ? Colors.transparent
                                : AppColors.appColors),
                    20.ph,
                    CustomElevatedButton(
                        text: CustomSimpleText(
                          text: "Register As a QDDP",
                          fontSize: 21,
                          color:
                              controller.selectRegistrationOptions.value != "3"
                                  ? AppColors.appColors
                                  : AppColors.white,
                        ),
                        onPress: () {
                          controller.firstPrice.value = "30";
                          controller.secondPrice.value = "330";
                          controller.selectRegistrationOptions.value = "3";
                          RouteGenerator.pushNamed(context,Routes.qddpRegScreen);
                        },
                        backgroundColor:
                            controller.selectRegistrationOptions.value == "3"
                                ? AppColors.appColors
                                : Colors.transparent,
                        elevatedButtonSideBorderColor:
                            controller.selectRegistrationOptions.value == "3"
                                ? Colors.transparent
                                : AppColors.appColors),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
