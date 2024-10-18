import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_hub/const/utils/consts/common_controller.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/authentication/signin/controller/controller.dart';
import 'package:provider_hub/features/screens/consultant_reg_screen/presentation/controller/consultant_controller.dart';
import 'package:provider_hub/features/screens/provider_registration_screen/registration_screen/presentation/controller/provider_reg_controller.dart';
import 'package:provider_hub/features/screens/qddp_reg_screen/presentation/controller/qddp_controller.dart';
import 'package:provider_hub/features/screens/trainer_reg_screen/presentation/controller/trainer_reg_controller.dart';
import '../../../../../../const/routes/route_name.dart';
import '../../../../../../const/routes/router.dart';
import '../../../../../../const/utils/consts/app_assets.dart';
import '../../../../../../const/utils/consts/app_colors.dart';
import '../../../../../../const/utils/consts/app_sizes.dart';
import '../../../../../../main.dart';
import '../../../../../widget/custom_elevatedButton/custom_eleveted_button.dart';
import '../../../../../widget/custom_simple_text/custom_simple_text.dart';
import '../../../../../widget/custom_toast/custom_toast.dart';
import 'consts.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();
  var providerController = Get.put(ProviderRegController());
  var signinController = Get.put(SigninController());
  var consultantController = Get.put(ConsultantRegController());
  var trainerController = Get.put(TrainerRegController());
  var qddpController = Get.put(QDDPRegController());
  var commonController = Get.put(CommonController());
  Future<void> makePayment({required String money}) async {
    try {
      String? paymentIntentClientSecret = await _createPaymentIntent(
        int.parse(money), // amount in the smallest unit of currency (e.g., cents)
        "usd",
      );
      if (paymentIntentClientSecret == null) return;

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Hussain Mustafa",
        ),
      );

      print("${commonController.email.value} ${commonController.fromPage.value}");

      // Present the payment sheet to the user
      await Stripe.instance.presentPaymentSheet().then((value) async {


        // Handle registration based on the page type
        if (commonController.fromPage.value == "provider") {
          print("provider value");
          await providerController.addProviderRegistration();
          await signinController.signIn();
          showImageSourceDialog(navigatorKey.currentContext!);
        } else if (commonController.fromPage.value == "consultant") {
          print("cosultant value");
          await consultantController.addConsultantRegistration();
          await signinController.signIn();
          showImageSourceDialog(navigatorKey.currentContext!);
        } else if (commonController.fromPage.value == "trainer") {
          print("trainer value");
          await trainerController.addTrainerRegistration();
          await signinController.signIn();
          showImageSourceDialog(navigatorKey.currentContext!);
        } else {
          print("qqdp value");
          await qddpController.addQDDPRegistration();
          await signinController.signIn();
          showImageSourceDialog(navigatorKey.currentContext!);
        }
      }).catchError((e) {
        print("Error presenting payment sheet: $e");
        errorToast(context: navigatorKey.currentContext!, msg: "Payment Cancel");
      });

    } catch (e) {
      print("StripeException: $e");
      // errorToast(context: navigatorKey.currentContext!, msg: "Payment error: ${e.toString()}");
    }
  }


  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": _calculateAmount(
          amount,
        ),
        "currency": currency,
        "payment_method_types[]": "card",
      };
      var response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": 'application/x-www-form-urlencoded'
          },
        ),
      );
      final clientSecret = response.data["client_secret"];

      // Confirm the payment

      if (response.data != null) {
        print("vlue");

        return response.data["client_secret"];
      }

      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      print(e);
    }
  }

  String _calculateAmount(int amount) {
    final calculatedAmount = amount * 100;
    return calculatedAmount.toString();
  }

  Future<void> showImageSourceDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: HexColor("0E0E0E"),
          title: Center(
            child: Image.asset(
              AppAssets.success,
              height: 50,
              width: 50,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomSimpleText(
                text: "Congratulations",
                textAlign: TextAlign.center,
                fontSize: AppSizes.size20,
                color: AppColors.green,
                fontWeight: FontWeight.bold,
                alignment: Alignment.center,
              ),
              10.ph,
              CustomSimpleText(
                text: "Your Order Placed Successfully",
                textAlign: TextAlign.center,
                fontSize: AppSizes.size12,
                color: AppColors.white,
                fontWeight: FontWeight.normal,
                alignment: Alignment.center,
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Customize the border radius here
          ),
          actions: [
            Center(
                child: CustomElevatedButton(
              backgroundColor: AppColors.appColors,
              borderRadius: 8,
              onPress: () {
                RouteGenerator.pushNamed(context, Routes.inbox);
              },
              width: 121,
              elevatedButtonSideBorderColor: AppColors.appColors,
              height: 31,
              text: CustomSimpleText(
                text: "OK",
                textAlign: TextAlign.center,
                fontSize: AppSizes.size17,
                color: AppColors.white,
                fontWeight: FontWeight.w500,
                alignment: Alignment.center,
              ),
            )),
          ],
        );
      },
    );
  }
}
