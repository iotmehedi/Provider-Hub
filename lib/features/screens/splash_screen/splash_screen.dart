import 'package:flutter/material.dart';
import 'package:provider_hub/features/widget/custom_svg/custom_svg_widget.dart';

import '../../../const/routes/route_name.dart';
import '../../../const/routes/router.dart';
import '../../../const/utils/consts/app_assets.dart';
import '../../../const/utils/consts/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      RouteGenerator.pushNamedAndRemoveAll(Routes.registrationPage);
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
                child: CustomSvgWidget(image: AppAssets.logo, height: 217.0, width: 259.0,),
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
