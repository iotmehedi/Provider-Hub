import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:provider_hub/const/utils/consts/app_assets.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/trainer_reg_screen/presentation/controller/trainer_reg_controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';
import 'package:provider_hub/features/widget/custom_svg/custom_svg_widget.dart';
import 'package:provider_hub/features/widget/custom_text_textfield_column/custom_text_textfield_column.dart';
import '../../../../../../../../const/routes/route_name.dart';
import '../../../../../../../../const/routes/router.dart';
import '../../../../../const/utils/consts/textstyle.dart';
import '../../../../widget/custom_elevatedButton/custom_eleveted_button.dart';

class TrainerRegistrationScreen extends StatelessWidget {
  TrainerRegistrationScreen({super.key});
  var controller = Get.put(TrainerRegController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppBar(
          title: "Trainer Registration Form",
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
                Center(
                  child: InkWell(
                    onTap: () => controller.showImageSourceDialog(context),
                    child: controller.pickedImage.value.path.isNotEmpty
                        ? Container(
                            height: AppSizes.newSize(10.0),
                            width: AppSizes.newSize(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.file(
                              controller.pickedImage.value,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ))
                        : InkWell(
                            onTap: () =>
                                controller.showImageSourceDialog(context),
                            child: CustomSvgWidget(
                              image: AppAssets.uploadPictureAveter,
                              height: AppSizes.newSize(10.0),
                              width: AppSizes.newSize(10.0),
                            ),
                          ),
                  ),
                ),
                10.ph,
                Center(
                  child: CustomSimpleText(
                    text: "Upload Picture",
                    fontSize: AppSizes.size16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                    alignment: Alignment.center,
                  ),
                ),
                20.ph,
                CustomTextTextfieldColumn(
                    text: "Full Name",
                    hint: "Enter Your name",
                    textEditingController: controller.fullNameController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Phone Number",
                    hint: "Enter Your Phone Number",
                    textEditingController:
                        controller.phoneNumberController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Contact Email",
                    hint: "Enter contact email",
                    textEditingController: controller.emailController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Office Address",
                    hint: "Enter Office Address",
                    textEditingController:
                        controller.officeAddressController.value),
                10.ph,
                globalText14(
                    text: "Select Training's That You Can Provide",
                    fontWeight: FontWeight.w500,
                    color: AppColors.white),
                10.ph,
                MultiSelectDialogField(
                  items: controller.items,
                  title: const Text("Animals"),
                  backgroundColor: AppColors.backgroundColor,
                  itemsTextStyle: const TextStyle(color: Colors.white),
                  checkColor: AppColors.white,
                  selectedColor: AppColors.appColors,
                  selectedItemsTextStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    color: HexColor('80848A').withOpacity(0.35),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                      color: AppColors.appColors,
                      width: 2,
                    ),
                  ),
                  buttonIcon: Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.white,
                  ),
                  buttonText: const Text(
                    "Choose Training's",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onConfirm: (results) {
                    controller.selectedServiceItems.value = results;
                  },
                ),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Password",
                    hint: "Enter password",
                    textEditingController: controller.passwordController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Confirm Password",
                    hint: "Enter confirm password",
                    textEditingController:
                        controller.confirmationPasswordController.value),
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
                      text: CustomSimpleText(
                        text: "Next",
                        fontSize: 20,
                        color: AppColors.white,
                        alignment: Alignment.center,
                      ),
                      onPress: () {
                        controller.validation();
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
