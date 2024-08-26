import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/splash_screen/splash_screen_controller.dart';
import 'package:provider_hub/features/widget/custom_svg/custom_svg_widget.dart';

import '../../../const/routes/route_name.dart';
import '../../../const/routes/router.dart';
import '../../../const/utils/consts/app_assets.dart';
import '../../../const/utils/consts/app_colors.dart';
import '../../../const/utils/consts/app_sizes.dart';
import '../../widget/custom_elevatedButton/custom_eleveted_button.dart';
import '../../widget/custom_simple_text/custom_simple_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  var controller = Get.put(SplashController());
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  bool _isScrollViewVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1), // Start just off-screen at the bottom
      end: Offset(0, 0),   // End in the center (Offset.zero means centered)
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Start the animation automatically when the page loads
    Future.delayed(Duration.zero, () {
      setState(() {
        _isScrollViewVisible = true;
      });
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          SlideTransition(
            position: _slideAnimation,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: CustomSvgWidget(
                          image: AppAssets.logo,
                          height: AppSizes.newSize(21.609),
                          width: AppSizes.newSize(25.809),
                        ),
                      ),
                      90.ph,
                      CustomElevatedButton(
                          text: CustomSimpleText(
                            text: "Directory",
                            fontSize: 21,
                            color: controller.selectRegistrationOptions.value != "0"
                                ? AppColors.appColors
                                : AppColors.white,
                          ),
                          onPress: () {
                            controller.selectRegistrationOptions.value = "0";
                            RouteGenerator.pushNamed(context, Routes.homepage);
                          },
                          backgroundColor: controller.selectRegistrationOptions.value == "0"
                              ? AppColors.appColors
                              : Colors.transparent,
                          elevatedButtonSideBorderColor: controller.selectRegistrationOptions.value == "0"
                              ? Colors.transparent
                              : AppColors.appColors),
                      20.ph,
                      CustomElevatedButton(
                          text: CustomSimpleText(
                            text: "Register",
                            fontSize: 21,
                            color: controller.selectRegistrationOptions.value != "1"
                                ? AppColors.appColors
                                : AppColors.white,
                          ),
                          onPress: () {
                            controller.selectRegistrationOptions.value = "1";
                            RouteGenerator.pushNamed(context, Routes.registrationPage);
                          },
                          backgroundColor: controller.selectRegistrationOptions.value == "1"
                              ? AppColors.appColors
                              : Colors.transparent,
                          elevatedButtonSideBorderColor: controller.selectRegistrationOptions.value == "1"
                              ? Colors.transparent
                              : AppColors.appColors),
                      20.ph,
                      CustomElevatedButton(
                          text: CustomSimpleText(
                            text: "Sign In",
                            fontSize: 21,
                            color: controller.selectRegistrationOptions.value != "2"
                                ? AppColors.appColors
                                : AppColors.white,
                          ),
                          onPress: () {
                            controller.selectRegistrationOptions.value = "2";
                            RouteGenerator.pushNamed(context, Routes.signinPage);
                          },
                          backgroundColor: controller.selectRegistrationOptions.value == "2"
                              ? AppColors.appColors
                              : Colors.transparent,
                          elevatedButtonSideBorderColor: controller.selectRegistrationOptions.value == "2"
                              ? Colors.transparent
                              : AppColors.appColors),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
