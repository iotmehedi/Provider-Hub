import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/provider_registration_screen/presentation/controller/provider_reg_controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';
import 'package:provider_hub/features/widget/custom_text_textfield_column/custom_text_textfield_column.dart';

import '../../../../widget/custom_elevatedButton/custom_eleveted_button.dart';

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.ph,
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
                        controller.providerNameController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Contact Name",
                    hint: "Enter contact name",
                    textEditingController:
                        controller.providerNameController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Contact Number",
                    hint: "Enter contact number",
                    textEditingController:
                        controller.providerNameController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Contact Email",
                    hint: "Enter contact email",
                    textEditingController:
                        controller.providerNameController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Office Address",
                    hint: "Enter Office Address",
                    textEditingController:
                        controller.providerNameController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "License Number",
                    hint: "Enter License Number",
                    textEditingController:
                        controller.providerNameController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "NPI Number",
                    hint: "Enter NPI Number",
                    textEditingController:
                        controller.providerNameController.value),
                10.ph,
                Row(
                  children: [
                    Checkbox(
                      side: WidgetStateBorderSide.resolveWith(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed) ||
                              states.contains(WidgetState.hovered) ||
                              states.contains(WidgetState.focused)) {
                            return BorderSide(color: AppColors.appColors, width: 2.0);
                          }
                          return BorderSide(color: AppColors.appColors, width: 2.0); // Default border color
                        },
                      ),
                      value: controller.isChecked.value,
                      focusColor: AppColors.white,
                      fillColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
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
                          CustomSimpleText(text: "By selecting Agree and continue below, I agree to ", fontSize: 12,color: AppColors.white,),
                          CustomSimpleText(text: "Terms of Service and Privacy Policy", fontSize: 12, color: AppColors.appColors,),
                        ],
                      ),
                    )
                  ],
                ),
10.ph,
                SizedBox(
                  height: 48,
                  child: CustomElevatedButton(
                      text: CustomSimpleText(
                        text: "Next",
                        fontSize: 20,
                        color: AppColors.white,
                      ),
                      onPress: () {

                      },
                      backgroundColor: AppColors.appColors,
                      elevatedButtonSideBorderColor:AppColors.appColors),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
