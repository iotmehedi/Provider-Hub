import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/authentication/signin/controller/controller.dart';
import 'package:provider_hub/features/screens/inbox_page/presentation/controller/controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

import '../../../../../const/routes/route_name.dart';
import '../../../../../const/routes/router.dart';
import '../../../../widget/custom_cached_network_inbox/custom_cached_network.dart';
import '../../model/chat_model.dart';

class InboxPage extends StatelessWidget {
  InboxPage({super.key});
  var controller = Get.put(InboxController());
  var signinController = Get.put(SigninController());
  @override
  Widget build(BuildContext context) {
    controller.fetchLastMessages();
    return GetBuilder(
      init: InboxController(),
      builder: (controller) {
        return Obx(()=> Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.backgroundColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSimpleText(
                  text: "Inbox",
                  fontSize: AppSizes.size24,
                  color: AppColors.white,
                ),
                InkWell(
                  onTap: (){
                    RouteGenerator.pushNamed(context,Routes.profile);
                    signinController.fetchProviders();
                    print(DateTime.now(),);
                  },
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        height: AppSizes.newSize(4.0),
                        width: AppSizes.newSize(4.0),
                        child: Image.memory(
                          base64Decode(
                            (signinController.providerModel.value.imageBase64?.isNotEmpty ?? false)
                                ? signinController.providerModel.value.imageBase64 ?? ''
                                : (signinController.userModel.value.imageBase64?.isNotEmpty ?? false)
                                ? signinController.userModel.value.imageBase64 ?? ''
                                : (signinController.consultantModel.value.imageBase64?.isNotEmpty ?? false)
                                ? signinController.consultantModel.value.imageBase64 ?? ''
                                : (signinController.qddpModel.value.imageBase64?.isNotEmpty ?? false)
                                ? signinController.qddpModel.value.imageBase64 ?? ''
                                : '', // Fallback to empty string if none are available
                          ),
                          fit: BoxFit.cover, // Adjust image display
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: controller.isLoading.value == true ? Center(
            child: CircularProgressIndicator(),
          ) : controller.chatResponseModel.value.data?.isEmpty ?? false ? CustomSimpleText(text: "No Data Found", color: Colors.white,) : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.chatResponseModel.value.data?.length,
            itemBuilder: (context, index) {

              final item = controller.chatResponseModel.value.data?[index];
              //
              // print("this is user list ${item?.senderId} ${controller.userId.value}");
              final isSender = item?.senderId == controller.userId.value;

              return Visibility(
                // visible: isSender ? false : true,
                child: GestureDetector(
                  onTap: () {
                    RouteGenerator.pushNamedSms(
                        context, Routes.messageScreen, arguments: [
                      item?.receiverId ?? '',
                      item?.receiverImage ?? '',
                      item?.receiverName
                    ]);
                    print("item ${item.runtimeType}");
                    controller.fetchMessages(receiverId: item?.receiverId ?? '');

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
                              borderRadius: BorderRadius.circular(100),
                              child: SizedBox(
                                height: AppSizes.newSize(5.0),
                                width: AppSizes.newSize(5.0),
                                child: Image.memory(
                                  base64Decode(item?.receiverImage ?? ''),
                                  fit: BoxFit.cover, // Adjust image display
                                ),
                              ),
                            ),
                          ),
                          10.pw,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomSimpleText(
                                text: (item?.receiverName ?? ''),
                                fontSize: AppSizes.size13,
                                fontWeight: FontWeight.normal,
                                color: AppColors.white,
                              ),
                              3.ph,
                              Align(
                                alignment: Alignment.centerRight,
                                child: CustomSimpleText(
                                  text: controller.chatResponseModel.value.data?[(controller.chatResponseModel.value.data?.length ?? 0) - 1].message.toString() ?? '',
                                  fontSize: AppSizes.size11,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.white,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
      }
    );
  }
}
