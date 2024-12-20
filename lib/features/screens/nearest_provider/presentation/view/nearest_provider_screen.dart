import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/inbox_page/presentation/controller/controller.dart';
import 'package:provider_hub/features/screens/nearest_provider/presentation/controller/controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';
import 'package:provider_hub/features/widget/custom_toast/custom_toast.dart';

import '../../../../../const/routes/route_name.dart';
import '../../../../../const/routes/router.dart';
import '../../../../../const/utils/consts/app_assets.dart';
import '../../../../../main.dart';
import '../../../../widget/custom_cached_network_inbox/custom_cached_network.dart';
import '../../../../widget/custom_svg/custom_svg_widget.dart';
import '../../../authentication/signin/controller/controller.dart';

class NearestProviderPage extends StatelessWidget {
  NearestProviderPage({super.key});
  var controller = Get.put(NearestProviderController());
  var signinController = Get.put(SigninController());
  var indexController = Get.put(InboxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: "Nearest Provider",
        textColor: AppColors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 9),
            height: 28, // Adjust the height as needed
            child: TextField(
              cursorHeight: 18, // Adjust cursor height
              cursorWidth: 2, // Adjust cursor width
              cursorColor: AppColors.white,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                // letterSpacing: 0.2,
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              onChanged: (value) {
                signinController.filterProviders(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                hintText: 'Search',
                hintStyle: GoogleFonts.roboto(
                  // letterSpacing: 0.2,
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                prefixIcon: SizedBox(
                    height: 24,
                    width: 24,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 24,
                            width: 18,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.white),
                            child: const Icon(
                              Icons.search,
                              size: 14,
                              color: Colors.black,
                            ),
                          )),
                    )),
                suffixIcon: const SizedBox(
                    height: 24,
                    width: 24,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: CustomSvgWidget(
                          image: AppAssets.menu, height: 24, width: 24),
                    )),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(
                      color: AppColors.white), // Default border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(
                      color: AppColors.white), // Border color when focused
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(
                      color: AppColors.white), // Border color when enabled
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(
                      color: AppColors.white), // Border color when disabled
                ),
              ),
            ),
          ),
          10.ph,
          Expanded(
            child: Obx(() => ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: signinController.filteredList.length,
                  itemBuilder: (context, index) {
                    final item = signinController.filteredList[index];
                    // print(item.t);
                    return box.read('isLoggedIn') != null &&
                            item.email == box.read("email")
                        ? const SizedBox.shrink()
                        : GestureDetector(
                            onTap: () {
                              // controller.selectedIndex.value = index;
                            },
                            child: Card(
                              elevation: 0.0,
                              color: AppColors.slightGrey.withOpacity(0.04),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: SizedBox(
                                          height: AppSizes.newSize(8.0),
                                          width: AppSizes.newSize(8.0),
                                          child: (item.imageBase64?.isEmpty ??
                                                  false)
                                              ? Icon(
                                                  Icons.person,
                                                  size: AppSizes.newSize(8.0),
                                                  color: AppColors.white,
                                                )
                                              : Image.memory(
                                                  base64Decode(
                                                      item.imageBase64 ?? ''),
                                                  fit: BoxFit
                                                      .cover, // Adjust image display
                                                ),
                                        ),
                                      ),
                                    ),
                                    10.pw,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomSimpleText(
                                            text: item.contactName ?? '',
                                            fontSize: AppSizes.size13,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.white,
                                            alignment: Alignment.centerLeft,
                                          ),
                                          3.ph,
                                          CustomSimpleText(
                                            text: item.service?.join(',') ?? '',
                                            fontSize: AppSizes.size13,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.white,
                                            alignment: Alignment.centerLeft,
                                            textAlign: TextAlign.start,
                                          ),
                                          3.ph,
                                          box.read("isLoggedIn") != null
                                              ? SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.79,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [],
                                                      ),
                                                      box.read("isLoggedIn") &&
                                                              signinController
                                                                      .providerModel
                                                                      .value
                                                                      .type ==
                                                                  "provider"
                                                          ? const SizedBox
                                                              .shrink()
                                                          : box.read("isLoggedIn") ==
                                                                  null
                                                              ? const SizedBox
                                                                  .shrink()
                                                              : InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    print(
                                                                        "type of the ${item?.type} ${signinController.providerModel.value.type}");
                                                                    RouteGenerator.pushNamedSms(
                                                                        context,
                                                                        Routes
                                                                            .messageScreen,
                                                                        arguments: [
                                                                          item?.id
                                                                          // : signinController.providerModel
                                                                          //                 .value.type ==
                                                                          //             "provider" &&
                                                                          //         item?.receiverType ==
                                                                          //             "provider" &&
                                                                          //         item?.senderType ==
                                                                          //             "trainer"
                                                                          //     ? item?.senderId
                                                                          //     : signinController
                                                                          //                     .providerModel
                                                                          //                     .value
                                                                          //                     .type ==
                                                                          //                 "provider" &&
                                                                          //             item?.receiverType ==
                                                                          //                 "provider" &&
                                                                          //             item?.senderType ==
                                                                          //                 "trainer"
                                                                          //         ? item?.receiverId
                                                                          //         : signinController
                                                                          //                         .providerModel
                                                                          //                         .value
                                                                          //                         .type ==
                                                                          //                     "provider" &&
                                                                          //                 item?.receiverType ==
                                                                          //                     "provider" &&
                                                                          //                 item?.senderType ==
                                                                          //                     "qddp"
                                                                          //             ? item?.senderId
                                                                          //             : signinController
                                                                          //                             .userModel
                                                                          //                             .value
                                                                          //                             .type ==
                                                                          //                         "trainer" &&
                                                                          //                     item?.receiverType ==
                                                                          //                         "provider" &&
                                                                          //                     item?.senderType ==
                                                                          //                         "trainer"
                                                                          //                 ? item?.receiverId
                                                                          //                 : signinController.consultantModel.value.type == "consultant" && item?.receiverType == item?.senderType
                                                                          //                     ? item?.senderId
                                                                          //                     : signinController.consultantModel.value.type == "consultant" && item?.receiverType == "provider" && item?.senderType == "consultant"
                                                                          //                         ? item?.receiverId
                                                                          //                         : signinController.qddpModel.value.type == "qddp" && item?.receiverType == item?.senderType
                                                                          //                             ? item?.senderId
                                                                          //                             : signinController.qddpModel.value.type == "qddp" && item?.receiverType == "provider" && item?.senderType == "qddp"
                                                                          //                                 ? item?.receiverId
                                                                          //                                 : item?.senderId,
                                                                          ,
                                                                          item?.imageBase64 ??
                                                                              '',
                                                                          item?.providerName,
                                                                          item?.type,
                                                                        ]);
                                                                    print(
                                                                        "item ${item.runtimeType}");
                                                                    await indexController.fetchMessages(
                                                                        receiverId:
                                                                            item?.id ??
                                                                                '');

                                                                    indexController
                                                                        .fetchLastMessages();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 22,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                100),
                                                                        color: AppColors
                                                                            .appColors),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                      child: Center(
                                                                          child: CustomSimpleText(
                                                                        text:
                                                                            "Send Message",
                                                                        fontSize:
                                                                            AppSizes.size11,
                                                                        color: AppColors
                                                                            .white,
                                                                      )),
                                                                    ),
                                                                  ),
                                                                )
                                                    ],
                                                  ),
                                                )
                                              : const SizedBox.shrink(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
