import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_hub/features/screens/authentication/signin/controller/controller.dart';
import 'package:provider_hub/features/widget/custom_svg/custom_svg_widget.dart';
import 'package:provider_hub/main.dart';
import '../../../const/routes/route_name.dart';
import '../../../const/routes/router.dart';
import '../../../const/utils/consts/app_assets.dart';
import '../../../const/utils/consts/app_colors.dart';

class InitialSplashScreen extends StatefulWidget {
  const InitialSplashScreen({Key? key}) : super(key: key);
  @override
  State<InitialSplashScreen> createState() => _InitialSplashScreenState();
}

class _InitialSplashScreenState extends State<InitialSplashScreen> {
  var signinController = Get.put(SigninController());
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if (box.read("email").toString().isNotEmpty &&
          box.read("password").toString().isNotEmpty) {
        signinController.signIn();
      } else {
        RouteGenerator.pushNamedAndRemoveAll(Routes.splashScreenRouteName);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Expanded(
              flex: 9,
              child: Center(
                child: CustomSvgWidget(
                  image: AppAssets.logo,
                  height: 217.0,
                  width: 259.0,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.appColors,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
