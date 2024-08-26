import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/authentication/signin/controller/controller.dart';

import '../../../../../const/routes/route_name.dart';
import '../../../../../const/routes/router.dart';
import '../../../../../const/utils/consts/app_assets.dart';
import '../../../../../const/utils/consts/app_sizes.dart';
import '../../../../widget/custom_elevatedButton/custom_eleveted_button.dart';
import '../../../../widget/custom_simple_text/custom_simple_text.dart';
import '../../../../widget/custom_svg/custom_svg_widget.dart';
import '../../../../widget/custom_text_textfield_column/custom_text_textfield_column.dart';

class SignInPage extends StatelessWidget {
   SignInPage({super.key});
var controller = Get.put(SigninController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CustomSvgWidget(
                    image: AppAssets.logo,
                    height: AppSizes.newSize(21.609),
                    width: AppSizes.newSize(25.809),
                  ),
                ),
                40.ph,
                CustomTextTextfieldColumn(
                    text: "Email/Phone",
                    hint: "Enter Your Email/Phone",
                    textEditingController:
                    controller.emailPhoneController.value,
                ),
                15.ph,
                CustomTextTextfieldColumn(
                    text: "Password",
                    hint: "Enter Your Password",
                    textEditingController:
                    controller.passwordController.value,
                ),
                20.ph,
                SizedBox(
                  height: 47,
                  child: CustomElevatedButton(
                      text: CustomSimpleText(
                        text: "Sign In",
                        fontSize: 21,
                        color:  AppColors.white,
                      ),
                      onPress: () {
                        RouteGenerator.pushNamed(context, Routes.inbox);
                      },
                      backgroundColor:  AppColors.appColors,
                      elevatedButtonSideBorderColor:  AppColors.appColors,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
