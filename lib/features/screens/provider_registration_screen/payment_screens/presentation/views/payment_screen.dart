import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:provider_hub/const/utils/consts/app_assets.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/provider_registration_screen/payment_screens/presentation/controller/payment_controller.dart';

import '../../../../../../const/routes/route_name.dart';
import '../../../../../../const/routes/router.dart';
import '../../../../../widget/custom_elevatedButton/custom_eleveted_button.dart';
import '../../../../../widget/custom_simple_text/custom_simple_text.dart';
import '../../../registration_screen/presentation/triangles/triangles.dart';
import '../plan_bar/plan_bar.dart';
import '../widget/plan_selection_one.dart';

class PaymentScreen extends StatelessWidget {
   PaymentScreen({super.key});
var controller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                PlanBar(
                    title1: "Choose Plan",
                    title2: "Review Details",
                    title3: "Checkout",
                    color1: AppColors.appColors,
                    color2: AppColors.slightGrey,
                    color3: AppColors.slightGrey,
                    titleColor1: AppColors.white,
                    titleColor2: AppColors.slightDeepGrey,
                    titleColor3: AppColors.slightDeepGrey,
                  from: "one"
                ),
                PlanSelectionWidgetOne(controller: controller),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 48,
                  child: CustomElevatedButton(
                      text: CustomSimpleText(
                        text: "Next",
                        fontSize: 20,
                        color: AppColors.white,
                      ),
                      onPress: () {
                        RouteGenerator.pushNamed(context,Routes.paymentScreenTwo);
                      },
                      backgroundColor: AppColors.appColors,
                      elevatedButtonSideBorderColor:AppColors.appColors),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

