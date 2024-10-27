import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/homepage/presentation/controller/controller.dart';

import '../../../../../const/routes/route_name.dart';
import '../../../../../const/routes/router.dart';
import '../../../../../const/utils/consts/app_sizes.dart';
import '../../../../widget/custom_appbar/custom_appbar.dart';
import '../../../../widget/custom_simple_text/custom_simple_text.dart';
import '../../../../widget/custom_text_textfield_column/custom_text_textfield_column.dart';
import '../../../authentication/signin/controller/controller.dart';
import '../../../inbox_page/presentation/controller/controller.dart';

class ProfileDetailsForServiceWiseProviderListScreen extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> profileModel;
  final String serviceType, type;
  ProfileDetailsForServiceWiseProviderListScreen(
      {super.key,
      required this.profileModel,
      required this.serviceType,
      required this.type});
  var signinController = Get.put(SigninController());
  var indexController = Get.put(InboxController());
  var homeController = Get.put(HomepageContorller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: "Profile",
        textColor: AppColors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                  height: AppSizes.newSize(8.0),
                  width: AppSizes.newSize(8.0),
                  child: profileModel['imageBase64'].toString().isEmpty
                      ? Icon(
                          Icons.person,
                          size: AppSizes.newSize(8.0),
                          color: AppColors.white,
                        )
                      : Image.memory(
                          base64Decode(
                            profileModel[
                                'imageBase64'], // Fallback to empty string if none are available
                          ),
                          fit: BoxFit.cover, // Adjust image display
                        ),
                ),
              ),
            ),
            5.ph,
            CustomSimpleText(
              text: type == "provider"
                  ? profileModel['providerName']
                  : profileModel['fullName'],
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
              color: AppColors.white,
              alignment: Alignment.center,
            ),
            10.ph,
            CustomSimpleText(
              text: (profileModel[serviceType] as List).join(', '),
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
              color: AppColors.white,
              alignment: Alignment.center,
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
                CustomSimpleText(
                  text: profileModel['officeAddress'],
                  fontSize: AppSizes.size14,
                  fontWeight: FontWeight.normal,
                  color: AppColors.white,
                ),
              ],
            ),
            5.ph,
            CustomSimpleText(
              text: profileModel['email'],
              fontSize: AppSizes.size14,
              fontWeight: FontWeight.normal,
              color: AppColors.white,
              alignment: Alignment.center,
            ),
            5.ph,
            CustomSimpleText(
              alignment: Alignment.center,
              text: type == "provider"
                  ? "License: ${profileModel['licenseNumber']}"
                  : type == "trainer"
                      ? profileModel['phoneNumber']
                      : '',
              fontSize: AppSizes.size14,
              fontWeight: FontWeight.normal,
              color: AppColors.white,
            ),
            5.ph,
            Visibility(
              visible: type == "provider" ? true : false,
              child: CustomSimpleText(
                alignment: Alignment.center,
                text: type == "provider"
                    ? "NPI: ${profileModel['npiNumber']}"
                    : '',
                fontSize: AppSizes.size14,
                fontWeight: FontWeight.normal,
                color: AppColors.white,
              ),
            ),

            20.ph,
            Visibility(
              visible: signinController.providerModel.value.type == "provider"
                  ? false
                  : true,
              child: Divider(
                color: AppColors.deepGrey,
              ),
            ),
            20.ph,
            Visibility(
              visible: signinController.providerModel.value.type == "provider"
                  ? false
                  : true,
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
              visible: signinController.providerModel.value.type == "provider"
                  ? false
                  : true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 4.0),
                  itemCount: signinController.providerList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    var item = signinController.providerList[index];
                    return Stack(
                      children: [
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.appColors),
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.04),
                                  blurRadius: 8,
                                  offset: const Offset(0, 0), // Shadow position
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
                                CustomSimpleText(
                                  text: item.phoneNumber ?? '',
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSizes.size14,
                                  color: AppColors.white,
                                  textAlign: TextAlign.center,
                                  alignment: Alignment.center,
                                ),
                                5.ph,
                                // Row(
                                //   mainAxisAlignment:
                                //   MainAxisAlignment.center,
                                //   crossAxisAlignment:
                                //   CrossAxisAlignment.center,
                                //   children: [
                                //     PannableRatingBar(
                                //       rate: index / 10,
                                //       items: List.generate(
                                //           1,
                                //               (index) => const RatingWidget(
                                //             selectedColor:
                                //             Colors.orange,
                                //             unSelectedColor:
                                //             Colors.grey,
                                //             child: Icon(
                                //               Icons.star,
                                //               size: 15,
                                //             ),
                                //           )),
                                //     ),
                                //     CustomSimpleText(
                                //       text: "${index / 10}",
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: AppSizes.size15,
                                //       color: AppColors.white,
                                //       textAlign: TextAlign.center,
                                //       alignment: Alignment.center,
                                //     ),
                                //   ],
                                // ),
                                5.ph,
                                InkWell(
                                  onTap: () {
                                    // RouteGenerator.pushNamedSms(
                                    //     context, Routes.messageScreen, arguments: [
                                    //       item.id,
                                    //   item.imageBase64,
                                    //   item.providerName
                                    // ]);
                                    RouteGenerator.pushNamedSms(
                                        context, Routes.providerDetailsProfile,
                                        arguments: [item]);
                                    print("item ${item.id}");
                                    indexController.fetchMessages(
                                        receiverId: item.id ?? '');
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    margin: const EdgeInsets.only(bottom: 10),
                                    width: MediaQuery.of(context).size.width *
                                        0.26,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.appColors),
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
                                child: item.imageBase64?.isEmpty ?? false
                                    ? Icon(
                                        Icons.person,
                                        size: AppSizes.newSize(8.0),
                                        color: AppColors.white,
                                      )
                                    : Image.memory(
                                        base64Decode(item.imageBase64 ?? ''),
                                        fit: BoxFit
                                            .cover, // Adjust image display
                                      ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
