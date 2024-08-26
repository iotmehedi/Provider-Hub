import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_hub/const/utils/consts/app_assets.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/inbox_page/presentation/controller/controller.dart';
import 'package:provider_hub/features/screens/message_screen/presentation/controller/message_controller.dart';

import '../../../../../const/utils/consts/app_colors.dart';
import '../../../../../const/utils/consts/app_sizes.dart';
import '../../../../widget/custom_simple_text/custom_simple_text.dart';
import '../../../nearest_provider/presentation/controller/controller.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});
  var controller = Get.put(MessageController());
  var nearestProvider = Get.put(InboxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
        backgroundColor: AppColors.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSimpleText(
              text: nearestProvider.name.value,
              fontSize: AppSizes.size24,
              color: AppColors.white,
            ),
            Icon(
              Icons.info_outline,
              size: 26.67,
              color: AppColors.white,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.appColors,
                  ),
                  child: Center(
                    child: Icon(Icons.person_outlined, size: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Container(
                          // height: 90,
                          // width: MediaQuery.of(context).size.width * 0.76,
                          decoration: BoxDecoration(
                              color: AppColors.appColors,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 10),
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 10, bottom: 0, top: 10, right: 20),
                                  child: CustomSimpleText(
                                    text:
                                        "Hi how are you",
                                    fontSize: AppSizes.size15,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.white,
                                  ),
                                ),
                              )),
                        ),
                      ),
                      Image.asset(
                        AppAssets.msg_arrow_blue,
                        height: 10,
                        width: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
            30.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.8),
                        child: Container(
                          // height: 90,
                          // width: MediaQuery.of(context).size.width * 0.76,
                          decoration: BoxDecoration(
                            color: HexColor("565656").withOpacity(0.6),
                            border: Border.all(color: AppColors.deepGrey.withOpacity(0.5)),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 0, top: 10, right: 10),
                                child: CustomSimpleText(
                                  text:
                                      "Hi how are you",
                                  fontSize: AppSizes.size15,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.white,
                                ),
                              )),
                        ),
                      ),
                      Image.asset(
                        AppAssets.msg_arrow_grey,
                        height: 10,
                        width: 10,
                        color: HexColor("565656").withOpacity(0.6),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.deepGrey,
                  ),
                  child: Center(
                    child: Icon(Icons.person_outlined, size: 25),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
