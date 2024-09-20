import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/homepage/model/license_specialist_model.dart';
import 'package:provider_hub/features/screens/homepage/presentation/controller/controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

class LicenseSpecialistScreen extends StatelessWidget {
  LicenseSpecialistScreen({super.key});
  var controller = Get.put(HomepageContorller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: "License Specialist",
        textColor: AppColors.white,
        needTitleCenter: false,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Obx(() {
        if (controller.licenseSpecialists.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      10.ph,
                      CustomListView(
                          context: context,
                          heading: "Central Office",
                          model: controller.licenseSpecialists),
                      15.ph,
                      CustomListView(
                          context: context,
                          heading: "Quality & Information Systems",
                          model: controller.qualityInformation),
                      15.ph,
                      CustomListView(
                          context: context,
                          heading: "Specialized Investigation Unit (SIU)",
                          model: controller.siuModel),
                      15.ph,
                      CustomListView(
                          context: context,
                          heading: "Incident Management Unit (IMU)",
                          model: controller.imuModel),
                      15.ph,
                      CustomListView(
                          context: context,
                          heading: "Region – 1",
                          model: controller.regionOne),
                      15.ph,
                      CustomListView(
                          context: context,
                          heading: "Region – 2",
                          model: controller.regionTwo),
                      15.ph,
                      CustomListView(
                          context: context,
                          heading: "Region – 3",
                          model: controller.regionThree),
                      15.ph,
                      CustomListView(
                          context: context,
                          heading: "Region – 4",
                          model: controller.regionFour),
                      15.ph,
                      CustomListView(
                          context: context,
                          heading: "Region – 4.5",
                          model: controller.regionFourPointFive),
                      15.ph,
                      CustomListView(
                          context: context,
                          heading: "Region – 5",
                          model: controller.regionFive),
                      15.ph,
                      CustomListView(
                          context: context,
                          heading: "Licensing Specialists for Substance Use Providers",
                          model: controller.useProvider),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget CustomListView(
      {required BuildContext context,
      required RxList<LicenseSpecialist> model,
      required String heading}) {
    return Column(
      children: [
        Container(
          height: 35,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: AppColors.appColors,
          ),
          child: Center(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomSimpleText(
                  text: heading,
                  fontSize: AppSizes.size16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
        ),
        10.ph,
        ListView.builder(
          itemCount: model.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final specialist = model[index];
            return CustomColumnRow(
                index: index,
                name: specialist.name ?? '',
                position: specialist.position ?? '',
                phoneNumber: specialist.phoneNumber ?? '',
                email: specialist.email ?? '');
          },
        ),
      ],
    );
  }

  Widget CustomColumnRow(
      {required int index,
      required String name,
      required String position,
      required String phoneNumber,
      required String email}) {
    return Column(
      children: [
        if (index == 0)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomSimpleText(
                  text: "Staff Member",
                  fontSize: AppSizes.size12,
                  fontWeight: FontWeight.w500,
                  color: HexColor("00FFFF"),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: CustomSimpleText(
                  text: "Job Positions/Title",
                  fontSize: AppSizes.size12,
                  fontWeight: FontWeight.w500,
                  color: HexColor("00FFFF"),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: CustomSimpleText(
                  text: "Phone",
                  fontSize: AppSizes.size12,
                  fontWeight: FontWeight.w500,
                  color: HexColor("00FFFF"),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: CustomSimpleText(
                  text: "Emails",
                  fontSize: AppSizes.size12,
                  fontWeight: FontWeight.w500,
                  color: HexColor("00FFFF"),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        10.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomSimpleText(
                text: name,
                fontSize: AppSizes.size10,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: CustomSimpleText(
                text: position,
                fontSize: AppSizes.size10,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: CustomSimpleText(
                text: phoneNumber,
                fontSize: AppSizes.size10,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: CustomSimpleText(
                text: email,
                fontSize: AppSizes.size10,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}
