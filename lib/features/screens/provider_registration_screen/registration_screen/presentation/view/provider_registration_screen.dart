import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/textstyle.dart';
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

class ProviderRegistrationScreen extends StatefulWidget {
  ProviderRegistrationScreen({super.key});

  @override
  State<ProviderRegistrationScreen> createState() =>
      _ProviderRegistrationScreenState();
}

class _ProviderRegistrationScreenState
    extends State<ProviderRegistrationScreen> {
  var controller = Get.put(ProviderRegController());
  // static List _animals = ["mehedi", "hasan", "Shourov"];
  // final _items =
  //     _animals.map((animal) => MultiSelectItem(animal, animal)).toList();
  // List _selectedAnimals = [];
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
                controller.pickedImage.value.path.isNotEmpty
                    ? InkWell(
                        onTap: () => controller.showImageSourceDialog(context),
                        child: Container(
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
                            )),
                      )
                    : InkWell(
                        onTap: () => controller.showImageSourceDialog(context),
                        child: CustomSvgWidget(
                          image: AppAssets.uploadPictureAveter,
                          height: AppSizes.newSize(10.0),
                          width: AppSizes.newSize(10.0),
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
                    text: "Provider Name",
                    hint: "Enter name",
                    textEditingController:
                        controller.providerNameController.value),
                10.ph,
                // CustomTextTextfieldColumn(
                //     text: "Services",
                //     hint: "Enter Services that you provide",
                //     textEditingController: controller.serviceController.value),
                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
                //   decoration: BoxDecoration(
                //     border: Border.all(color: AppColors.appColors, width: 1.0),
                //     borderRadius:
                //         BorderRadius.circular(5.0), // Adjust as needed
                //   ),
                //   child: DropdownButtonHideUnderline(
                //     child: DropdownButton<String>(
                //       value: controller.selectedServiceValue.value,
                //       items: <String>["Choose one", 'A', 'B', 'C', 'D']
                //           .map((String value) {
                //         return DropdownMenuItem<String>(
                //           value: value,
                //           child: CustomSimpleText(
                //             text: value,
                //             fontWeight: FontWeight.w500,
                //             fontSize: AppSizes.size14,
                //             color: AppColors.white,
                //           ),
                //         );
                //       }).toList(),
                //       onChanged: (value) {
                //         controller.selectedServiceValue.value = value!;
                //       },
                //       underline:
                //           const SizedBox(), // Removes the default underline
                //       isExpanded:
                //           true, // Makes the dropdown button expand to fill its container
                //       dropdownColor:
                //           Colors.black, // Sets the dropdown menu color to black
                //       iconEnabledColor: Colors
                //           .white, // Optional: Change the icon color if needed
                //       style: const TextStyle(color: Colors.white),
                //     ),
                //   ),
                // ),
                globalText14(
                    text: "Service",
                    fontWeight: FontWeight.w500,
                    color: AppColors.white),
                5.ph,
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
                    Icons.supervised_user_circle_sharp,
                    color: AppColors.white,
                  ),
                  buttonText: const Text(
                    "Choose services",
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
                    text: "Contact Name",
                    hint: "Enter contact name",
                    textEditingController:
                        controller.contactNameController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Contact Number",
                    hint: "Enter contact number",
                    textEditingController: controller.contactController.value),
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
                    hint: "Enter Your Password",
                    textEditingController: controller.passwordController.value),
                10.ph,
                CustomTextTextfieldColumn(
                    text: "Confirm Password",
                    hint: "Enter Confirm Password",
                    textEditingController:
                        controller.confirmPasswordController.value),
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
                        alignment: Alignment.center,
                        text: "Next",
                        fontSize: 20,
                        color: AppColors.white,
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
