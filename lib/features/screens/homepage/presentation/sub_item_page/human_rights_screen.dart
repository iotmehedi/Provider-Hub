import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider_hub/const/utils/consts/app_assets.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/homepage/presentation/controller/controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

class HumanRightsScreen extends StatefulWidget {
  HumanRightsScreen({super.key});

  @override
  State<HumanRightsScreen> createState() => _HumanRightsScreenState();
}

class _HumanRightsScreenState extends State<HumanRightsScreen> {


  var controller = Get.put(HomepageContorller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: "Human Rights",
        fontSize: AppSizes.size18,
        textColor: AppColors.white,
        needTitleCenter: false,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () async {
                    controller.imageFromImage.value = AppAssets.humanRight;
                    await controller.saveImageAndShowNotification(imageUrl: AppAssets.humanRight);
                  },
                  child: Container(
                    width: 116,
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 7),
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColors.white,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.downloadIcon,
                          height: 16.5,
                          width: 16.5,
                        ),
                        10.pw,
                        CustomSimpleText(
                          text: "Download PDF",
                          fontSize: AppSizes.size12,
                          textDecoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                          decorationColor: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              20.ph,
              Image.asset(
                AppAssets.humanRight,
                height: 1000,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }
}
