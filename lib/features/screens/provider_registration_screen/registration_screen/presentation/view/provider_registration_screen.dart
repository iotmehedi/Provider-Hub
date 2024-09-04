import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';
import 'package:provider_hub/features/widget/custom_text_textfield_column/custom_text_textfield_column.dart';

import '../../../../../../const/routes/route_name.dart';
import '../../../../../../const/routes/router.dart';
import '../../../../../../const/utils/consts/app_assets.dart';
import '../../../../../../const/utils/consts/app_sizes.dart';
import '../../../../../widget/custom_elevatedButton/custom_eleveted_button.dart';
import '../../../../../widget/custom_svg/custom_svg_widget.dart';
import '../controller/provider_reg_controller.dart';

class ProviderRegistrationScreen extends StatelessWidget {
  ProviderRegistrationScreen({super.key});
  var controller = Get.put(ProviderRegController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppBar(
          title: "Provider Registration Form",
          onBackPressed: () {
            Navigator.pop(context);
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                10.ph,
                InkWell(
                 onTap:() => controller.showImageSourceDialog(context),
                 child: controller.imagePickerGallery.value.path.isNotEmpty ? ClipRRect(
                   borderRadius: BorderRadius.circular(5),
                   child: Image.file(File(controller.imagePickerGallery.value.path),
                     height: AppSizes.newSize(10.0),
                     width: AppSizes.newSize(10.0),
                     fit: BoxFit.fill,
                   ),
                 ) : CustomSvgWidget(
                    image: AppAssets.uploadPictureAveter,
                    height: AppSizes.newSize(10.0),
                    width: AppSizes.newSize(10.0),
                  ),
               ),
                10.ph,
                CustomSimpleText(
                  text: "Upload Picture",
                  fontSize: AppSizes.size16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
                20.ph,
                CustomTextTextfieldColumn(
                    text: "Provider Name",
                    hint: "Enter name",
                    textEditingController:
                        controller.providerNameController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Services",
                    hint: "Enter Services that you provide",
                    textEditingController:
                        controller.serviceController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Contact Name",
                    hint: "Enter contact name",
                    textEditingController:
                        controller.contactNameController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Contact Number",
                    hint: "Enter contact number",
                    textEditingController:
                        controller.contactController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Contact Email",
                    hint: "Enter contact email",
                    textEditingController:
                        controller.emailController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Office Address",
                    hint: "Enter Office Address",
                    textEditingController:
                        controller.officeAddressController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "License Number",
                    hint: "Enter License Number",
                    textEditingController:
                        controller.licenseNumberController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "NPI Number",
                    hint: "Enter NPI Number",
                    textEditingController:
                        controller.npiNumberController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Password",
                    hint: "Enter password",
                    onPress: (){
                      controller.passwordVisible.value = !controller.passwordVisible.value;
                    },
                    textEditingController:
                        controller.passwordController.value,
                suffixIcon: controller.passwordVisible.value == true ? Icons.visibility_off : Icons.visibility,
                  obscureText: controller.passwordVisible.value,
                ),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Confirm Password",
                    hint: "Enter confirm password",
                    textEditingController:
                        controller.confirmationPasswordController.value,
                  onPress: (){
                    controller.confirmPasswordVisible.value = !controller.confirmPasswordVisible.value;
                  },
                  suffixIcon: controller.confirmPasswordVisible.value == true ? Icons.visibility_off : Icons.visibility,
                  obscureText: controller.confirmPasswordVisible.value,
                ),
                10.ph,
                Row(
                  children: [
                    Checkbox(
                      side: WidgetStateBorderSide.resolveWith(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed) ||
                              states.contains(WidgetState.hovered) ||
                              states.contains(WidgetState.focused)) {
                            return BorderSide(
                                color: AppColors.appColors, width: 2.0);
                          }
                          return BorderSide(
                              color: AppColors.appColors,
                              width: 2.0); // Default border color
                        },
                      ),
                      value: controller.isChecked.value,
                      focusColor: AppColors.white,
                      fillColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        return AppColors.deepGrey;
                      }),
                      onChanged: (value) {
                        controller.isChecked.value = value!;
                      },
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomSimpleText(
                            text:
                                "By selecting Agree and continue below, I agree to ",
                            fontSize: 12,
                            color: AppColors.white,
                          ),
                          CustomSimpleText(
                            text: "Terms of Service and Privacy Policy",
                            fontSize: 12,
                            color: AppColors.appColors,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                10.ph,
                SizedBox(
                  height: 48,
                  child: CustomElevatedButton(
                      text: controller.isLoadingRegistration.value == true ? const Center(
                        child: CircularProgressIndicator(),
                      ) : CustomSimpleText(
                        text: "Next",
                        fontSize: 20,
                        color: AppColors.white,
                      ),
                      onPress: () {
                        RouteGenerator().pushNamedSms(context, Routes.paymentScreen, arguments: [
                          "provider"
                        ]);
                      },
                      backgroundColor: AppColors.appColors,
                      elevatedButtonSideBorderColor: AppColors.appColors),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
