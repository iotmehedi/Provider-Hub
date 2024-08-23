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
import '../widget/plan_selection_three.dart';

class PaymentScreenThree extends StatelessWidget {
  PaymentScreenThree({super.key});
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
                    color3: AppColors.appColors,
                    titleColor1: AppColors.white,
                    titleColor2: AppColors.white,
                    titleColor3: AppColors.white),
                PlanSelectionWidgetThree(),
              ],
            ),
            Positioned(
                bottom: 90,
                child: SizedBox(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomSimpleText(
                              text: "Subtotal:",
                              fontSize: AppSizes.size16,
                              color: AppColors.textGreyColor,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomSimpleText(
                              text: "US \$50",
                              fontSize: AppSizes.size12,
                              color: AppColors.textGreyColor,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ),
                      20.ph,
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomSimpleText(
                              text: "Total Amount:",
                              fontSize: AppSizes.size16,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomSimpleText(
                              text: "US \$50",
                              fontSize: AppSizes.size16,
                              color: AppColors.appColors,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
              bottom: 10,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 48,
                  child: CustomElevatedButton(
                      text: CustomSimpleText(
                        text: "Pay Now",
                        fontSize: 20,
                        color: AppColors.white,
                      ),
                      onPress: () {
                        RouteGenerator.pushNamed(context,Routes.creditCardEnroll);
                      },
                      backgroundColor: AppColors.appColors,
                      elevatedButtonSideBorderColor: AppColors.appColors),
                ),
              ),
            )
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
