import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/provider_registration_screen/payment_screens/presentation/controller/payment_controller.dart';

import '../../../../../../const/routes/route_name.dart';
import '../../../../../../const/routes/router.dart';
import '../../../../../widget/custom_elevatedButton/custom_eleveted_button.dart';
import '../../../../../widget/custom_simple_text/custom_simple_text.dart';
import '../../../registration_screen/presentation/triangles/triangles.dart';
import '../plan_bar/plan_bar.dart';
import '../widget/plan_selection_one.dart';
import '../widget/plan_selection_two.dart';

class PaymentScreenTwo extends StatelessWidget {
  PaymentScreenTwo({super.key});
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
                    color2: AppColors.appColors,
                    color3: AppColors.slightGrey,
                    titleColor1: AppColors.white,
                    titleColor2: AppColors.white,
                    titleColor3: AppColors.slightDeepGrey,
                from: "two",
                ),
                PlanSelectionTwo(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 115,
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                    border: Border.all(color: AppColors.appColors),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomSimpleText(
                                text: "Item total:",
                                color: AppColors.slightDeepGrey,
                                fontSize: AppSizes.newSize(1.5),
                              ),
                              CustomSimpleText(
                                text: "US \$50",
                                color: AppColors.slightDeepGrey,
                                fontSize: AppSizes.newSize(1.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(color: AppColors.appColors,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomSimpleText(
                                text: "Sub total:",
                                color: AppColors.white,
                                fontSize: AppSizes.newSize(1.8),
                                fontWeight: FontWeight.bold,
                              ),
                              CustomSimpleText(
                                text: "US \$50",
                                color: AppColors.white,
                                fontSize: AppSizes.newSize(1.8),
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 48,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: CustomElevatedButton(
                      text: CustomSimpleText(
                        text: "Confirm And Pay",
                        fontSize: 20,
                        color: AppColors.white,
                      ),
                      onPress: () {
                        RouteGenerator.pushNamed(
                            context, Routes.paymentScreenThree);
                      },
                      backgroundColor: AppColors.appColors,
                      elevatedButtonSideBorderColor: AppColors.appColors),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Flexible(
//   flex: 2,
//   child: ClipPath(
//     clipper: RightTriangel(),
//     child: Container(
//       color: Colors.blue,
//       height: 28.0, // Set the height of the button
//       child: Center(
//         child: Text(
//           'Choose plan',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     ),
//   ),
// ),
// Flexible(
//   flex: 2,
//   child: ClipPath(
//     clipper: BothTriangle(),
//     child: Container(
//       color: Colors.blue,
//       height: 28.0, // Set the height of the button
//       child: Center(
//         child: Text(
//           'Choose plan',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     ),
//   ),
// ),
// Flexible(
//   flex: 2,
//   child: ClipPath(
//     clipper: LeftTriangle(),
//     child: Container(
//       color: Colors.blue,
//       height: 28.0, // Set the height of the button
//       child: Center(
//         child: Text(
//           'Choose plan',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     ),
//   ),
// ),
