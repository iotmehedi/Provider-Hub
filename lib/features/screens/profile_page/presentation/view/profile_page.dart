import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider_hub/const/utils/consts/app_assets.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/authentication/signin/controller/controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

import '../../../../../const/routes/route_name.dart';
import '../../../../../const/routes/router.dart';
import '../../../../widget/custom_cached_network_inbox/custom_cached_network.dart';
import '../../../inbox_page/presentation/controller/controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  var signinController = Get.put(SigninController());
  var indexController = Get.put(InboxController());
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
                      height: AppSizes.newSize(8.0),
                      width: AppSizes.newSize(8.0),
                      child: Image.memory(
                        base64Decode(
                          (signinController.providerModel.value.imageBase64
                                      ?.isNotEmpty ??
                                  false)
                              ? signinController
                                      .providerModel.value.imageBase64 ??
                                  ''
                              : (signinController.userModel.value.imageBase64
                                          ?.isNotEmpty ??
                                      false)
                                  ? signinController
                                          .userModel.value.imageBase64 ??
                                      ''
                                  : (signinController.consultantModel.value
                                              .imageBase64?.isNotEmpty ??
                                          false)
                                      ? signinController.consultantModel.value
                                              .imageBase64 ??
                                          ''
                                      : (signinController.qddpModel.value
                                                  .imageBase64?.isNotEmpty ??
                                              false)
                                          ? signinController.qddpModel.value
                                                  .imageBase64 ??
                                              ''
                                          : '', // Fallback to empty string if none are available
                        ),
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
                          : signinController.consultantModel.value.type ==
                                  "consultant"
                              ? signinController
                                      .consultantModel.value.fullName ??
                                  ''
                              : signinController.qddpModel.value.type == "qddp"
                                  ? signinController.qddpModel.value.fullName ??
                                      ''
                                  : '',
                  fontSize: AppSizes.size18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  alignment: Alignment.center,
                ),
                5.ph,
                CustomSimpleText(
                  text: signinController.providerModel.value.type == "provider"
                      ? signinController.providerModel.value.service ?? ''
                      : signinController.userModel.value.type == "trainer"
                          ? signinController.userModel.value.training ?? ''
                          : signinController.consultantModel.value.type ==
                                  "consultant"
                              ? signinController
                                      .consultantModel.value.service ??
                                  ''
                              : signinController.qddpModel.value.type == "qddp"
                                  ? signinController.qddpModel.value.service ??
                                      ''
                                  : '',
                  fontSize: AppSizes.size12,
                  fontWeight: FontWeight.normal,
                  color: AppColors.white,
                  alignment: Alignment.center,
                ),
                10.ph,
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Icon(
                //       Icons.star,
                //       color: AppColors.yellow,
                //       size: 12,
                //     ),
                //     CustomSimpleText(
                //       text: "4.5 ( 300 Reviews )",
                //       fontSize: AppSizes.size13,
                //       fontWeight: FontWeight.normal,
                //       color: AppColors.yellow,
                //     ),
                //   ],
                // ),
                // 5.ph,
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
                              : signinController.userModel.value.type ==
                                      "trainer"
                                  ? signinController
                                          .userModel.value.officeAddress ??
                                      ''
                                  : signinController
                                              .consultantModel.value.type ==
                                          "consultant"
                                      ? signinController
                                              .consultantModel.value.email ??
                                          ''
                                      : signinController.qddpModel.value.type ==
                                              "qddp"
                                          ? signinController
                                                  .qddpModel.value.email ??
                                              ''
                                          : '',
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
                CustomSimpleText(
                  alignment: Alignment.center,
                  text: signinController.providerModel.value.type ==
                      "provider"
                      ? signinController
                      .providerModel.value.email ??
                      ''
                      : signinController.userModel.value.type ==
                      "trainer"
                      ? signinController
                      .userModel.value.email ??
                      ''
                      : signinController
                      .consultantModel.value.type ==
                      "consultant"
                      ? signinController
                      .consultantModel.value.email ??
                      ''
                      : signinController.qddpModel.value.type ==
                      "qddp"
                      ? signinController
                      .qddpModel.value.email ??
                      ''
                      : '',
                  fontSize: AppSizes.size14,
                  fontWeight: FontWeight.normal,
                  color: AppColors.white,
                ),
                10.ph,
                CustomSimpleText(
                  alignment: Alignment.center,
                  text: signinController.providerModel.value.type ==
                      "provider"
                      ? "License: ${signinController
                      .providerModel.value.licenseNumber ??
                      ''}"
                      : signinController.userModel.value.type ==
                      "trainer"
                      ? signinController
                      .userModel.value.phoneNumber ??
                      ''
                      :  '',
                  fontSize: AppSizes.size14,
                  fontWeight: FontWeight.normal,
                  color: AppColors.white,
                ),
                10.ph,
                CustomSimpleText(
                  alignment: Alignment.center,
                  text: signinController.providerModel.value.type ==
                      "provider"
                      ? "NPI: ${signinController
                      .providerModel.value.npiNumber ??
                      ''}"
                      : signinController.userModel.value.type ==
                      "trainer"
                      ? signinController
                      .userModel.value.training ??
                      ''
                      :  '',
                  fontSize: AppSizes.size14,
                  fontWeight: FontWeight.normal,
                  color: AppColors.white,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Center(
                //       child: Image.asset(
                //         AppAssets.viewService,
                //         width: 18,
                //         height: 18,
                //       ),
                //     ),
                //     8.ph,
                //     Text(
                //       'View Services',
                //       style: TextStyle(
                //         decoration: TextDecoration.underline,
                //         fontSize: AppSizes.size13,
                //         fontWeight: FontWeight.normal,
                //         color: AppColors.white,
                //       ),
                //     )
                //   ],
                // ),
                // Text(
                //   'Bio',
                //   style: TextStyle(
                //     decoration: TextDecoration.underline,
                //     fontSize: AppSizes.size13,
                //     fontWeight: FontWeight.normal,
                //     color: AppColors.white,
                //   ),
                // ),
                // 10.ph,
                // Row(
                //   children: [
                //     Expanded(flex: 2, child: SizedBox()),
                //     Expanded(
                //       flex: 3,
                //       child: Container(
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(4),
                //           color: AppColors.appColors,
                //         ),
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: 5, vertical: 6),
                //           child: Center(
                //             child: Padding(
                //               padding: const EdgeInsets.only(left: 10),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   Icon(
                //                     Icons.messenger_outline,
                //                     size: 15,
                //                     color: AppColors.white,
                //                   ),
                //                   5.pw,
                //                   Expanded(
                //                     child: CustomSimpleText(
                //                       text: "Send a Message",
                //                       fontSize: AppSizes.size13,
                //                       color: AppColors.white,
                //                       fontWeight: FontWeight.w500,
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //     Expanded(flex: 2, child: SizedBox()),
                //   ],
                // ),
                20.ph,
                Visibility(
                  visible:  signinController.providerModel.value.type == "provider" ? false : true,
                  child: Divider(
                    color: AppColors.deepGrey,
                  ),
                ),
                20.ph,
                Visibility(
                  visible:  signinController.providerModel.value.type == "provider" ? false : true,
                  child: Padding(
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
                ),
                40.ph,
                Visibility(
                  visible:  signinController.providerModel.value.type == "provider" ? false : true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 4.0),
                      itemCount: signinController.providerList.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        var item = signinController.providerList[index];
                        return Stack(
                          children: [
                            Center(
                              child: Container(
                                height: 125,
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: AppColors.appColors),
                                  color: Colors.black,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 9,
                                      offset: Offset(0, 0), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: CustomSimpleText(
                                        text: item.contactName ?? '',
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppSizes.size18,
                                        color: AppColors.white,
                                        textAlign: TextAlign.center,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    5.ph,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        PannableRatingBar(
                                          rate: index / 10,
                                          items: List.generate(1, (index) =>
                                          const RatingWidget(
                                            selectedColor: Colors.orange,
                                            unSelectedColor: Colors.grey,
                                            child: Icon(
                                              Icons.star,
                                              size: 15,
                                            ),
                                          )),
                                        ),
                                        CustomSimpleText(
                                          text: "${index / 10}",
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppSizes.size15,
                                          color: AppColors.white,
                                          textAlign: TextAlign.center,
                                          alignment: Alignment.center,
                                        ),
                                      ],
                                    ),
                                    5.ph,
                                    InkWell(
                                      onTap: (){
                                        // RouteGenerator.pushNamedSms(
                                        //     context, Routes.messageScreen, arguments: [
                                        //       item.id,
                                        //   item.imageBase64,
                                        //   item.providerName
                                        // ]);
                                        RouteGenerator.pushNamedSms(
                                            context, Routes.providerDetailsProfile, arguments: [
                                              item
                                        ]);
                                        print("item ${item.id}");
                                        indexController.fetchMessages(receiverId: item.id ??'');
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 5),
                                        margin: EdgeInsets.only(bottom: 10),
                                        width: MediaQuery.of(context).size.width * 0.26,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          color: AppColors.appColors
                                        ),
                                        child: CustomSimpleText(
                                          text: "View Details",
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppSizes.size15,
                                          color: AppColors.white,
                                          textAlign: TextAlign.center,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0, // Adjust this value as needed
                              right: 0,
                              left: 0,
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: SizedBox(
                                    height: AppSizes.newSize(8.0),
                                    width: AppSizes.newSize(8.0),
                                    child: Image.memory(
                                      base64Decode( item.imageBase64 ?? ''),
                                      fit: BoxFit.cover, // Adjust image display
                                    ),
                                  ),
                                ),
                              ),)
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
