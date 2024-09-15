import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_hub/const/utils/consts/app_assets.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/authentication/signin/controller/controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

import '../../../../widget/custom_cached_network_inbox/custom_cached_network.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  var signinController = Get.put(SigninController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: "Profile",
        needTitleCenter: false,
        textColor: AppColors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      height: AppSizes.newSize(10.0),
                      width: AppSizes.newSize(10.0),
                      child: Image.memory(
                        base64Decode(signinController.userModel.value.imageBase64 ?? ''),
                        fit: BoxFit.cover, // Adjust image display
                      ),
                    ),
                  ),
                ),
                10.ph,
                CustomSimpleText(
                  text: signinController.providerModel.value.type == "provider"
                      ? signinController.providerModel.value.contactName ?? ''
                      : signinController.userModel.value.type == "trainer"
                          ? signinController.userModel.value.fullName ?? ''
                          : '',
                  fontSize: AppSizes.size18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  alignment: Alignment.center,
                ),
                5.ph,
                CustomSimpleText(
                  text: signinController.userModel.value.type == "trainer"
                      ? "Trainer"
                      : signinController.providerModel.value.type == "provider"
                          ? signinController.providerModel.value.service ?? ''
                          : '',
                  fontSize: AppSizes.size12,
                  fontWeight: FontWeight.normal,
                  color: AppColors.white,
                  alignment: Alignment.center,
                ),
                10.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.yellow,
                      size: 12,
                    ),
                    CustomSimpleText(
                      text: "4.5 ( 300 Reviews )",
                      fontSize: AppSizes.size13,
                      fontWeight: FontWeight.normal,
                      color: AppColors.yellow,
                    ),
                  ],
                ),
                5.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                    5.pw,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomSimpleText(
                          text: signinController.providerModel.value.type ==
                                  "provider"
                              ? signinController
                                      .providerModel.value.officeAddress ??
                                  ''
                              : signinController
                                      .userModel.value.officeAddress ??
                                  '',
                          fontSize: AppSizes.size14,
                          fontWeight: FontWeight.normal,
                          color: AppColors.white,
                        ),
                        // CustomSimpleText(
                        //   text: " 21, West Virginia",
                        //   fontSize: AppSizes.size14,
                        //   fontWeight: FontWeight.normal,
                        //   color: AppColors.white,
                        // ),
                      ],
                    ),
                  ],
                ),
                10.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        AppAssets.viewService,
                        width: 18,
                        height: 18,
                      ),
                    ),
                    8.ph,
                    Text(
                      'View Services',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: AppSizes.size13,
                        fontWeight: FontWeight.normal,
                        color: AppColors.white,
                      ),
                    )
                  ],
                ),
                Text(
                  'Bio',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: AppSizes.size13,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white,
                  ),
                ),
                10.ph,
                Row(
                  children: [
                    Expanded(flex: 2, child: SizedBox()),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.appColors,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 6),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.messenger_outline,
                                    size: 15,
                                    color: AppColors.white,
                                  ),
                                  5.pw,
                                  Expanded(
                                    child: CustomSimpleText(
                                      text: "Send a Message",
                                      fontSize: AppSizes.size13,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex: 2, child: SizedBox()),
                  ],
                ),
                20.ph,
                Divider(
                  color: AppColors.deepGrey,
                ),
                20.ph,
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomSimpleText(
                      text: "Provide Suggestion",
                      fontSize: AppSizes.size13,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                40.ph,
                Image.asset(AppAssets.suggestion),
                Image.asset(AppAssets.suggestion),
                Image.asset(AppAssets.suggestion),
              ],
            )),
      ),
    );
  }
}
