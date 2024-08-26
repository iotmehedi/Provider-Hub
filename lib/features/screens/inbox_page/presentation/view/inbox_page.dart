import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/inbox_page/presentation/controller/controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

import '../../../../../const/routes/route_name.dart';
import '../../../../../const/routes/router.dart';
import '../../../../widget/custom_cached_network_inbox/custom_cached_network.dart';

class InboxPage extends StatelessWidget {
  InboxPage({super.key});
  var controller = Get.put(InboxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
              },
              child: CustomCachedNetwork(
                image:
                    "https://st.depositphotos.com/1011643/4430/i/450/depositphotos_44309759-stock-photo-young-indian-man-outdoors.jpg",
                height: 40,
                weight: 40,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: controller.inboxItems.length,
        itemBuilder: (context, index) {
          final item = controller.inboxItems[index];
          return GestureDetector(
            onTap: () {
              controller.name.value = item['title'];
              RouteGenerator.pushNamed(
                  context, Routes.messageScreen);
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
                    CustomCachedNetwork(
                      image: item['image'], // Fill the container
                    ),
                    10.pw,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.76,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomSimpleText(
                                text: item['title'],
                                fontSize: AppSizes.size13,
                                fontWeight: FontWeight.normal,
                                color: AppColors.white,
                              ),
                              30.pw,
                              Align(
                                alignment: Alignment.centerRight,
                                child: CustomSimpleText(
                                  text: item['hour'],
                                  fontSize: AppSizes.size11,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.white,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        ),
                        3.ph,
                        CustomSimpleText(
                          text: item['message'],
                          fontSize: AppSizes.size13,
                          fontWeight: FontWeight.normal,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
