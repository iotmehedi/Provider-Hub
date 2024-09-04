import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/widget/toast/toast.dart';
import 'package:provider_hub/main.dart';
import '../../../../../../const/routes/route_name.dart';
import '../../../../../../const/routes/router.dart';
import '../../../../../../const/utils/consts/app_assets.dart';
import '../../../../../../const/utils/consts/app_colors.dart';
import '../../../../../../const/utils/consts/app_sizes.dart';
import '../../../../../widget/custom_elevatedButton/custom_eleveted_button.dart';
import '../../../../../widget/custom_simple_text/custom_simple_text.dart';
import '../../../registration_screen/presentation/controller/provider_reg_controller.dart';
import 'consts.dart';

class StripeService {
  StripeService._();
  var providerController = Get.put(ProviderRegController());
  static final StripeService instance = StripeService._();

  Future<void> makePayment({required String money, required String from}) async {
    print("this is money $money");
    try {
      String? paymentIntentClientSecret = await _createPaymentIntent(
        int.parse(money),
        "usd",
      );
      if (paymentIntentClientSecret == null) return;
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Hussain Mustafa",
        ),
      );
    try{
      await Stripe.instance.presentPaymentSheet().then((value) {
        successToast(context: navigatorKey.currentContext!, msg: "Payment Successful");

        if(from == "provider"){
        providerController.handleRegistration().then((porviderValue){
        showImageSourceDialog(navigatorKey.currentContext!);
        });
        }

        RouteGenerator.pushNamed(navigatorKey.currentContext!, Routes.inbox);
      });
    }catch(e){
      print("error $e");
    }
      await _processPayment();
    } catch (e) {
      print(e);
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
      print("hudai kaj kam w ${response.data}");
      if (response.data != null) {
        return response.data["client_secret"];
      }
      if(response.statusCode == 200){
        print("Payment successful");
        successToast(context: navigatorKey.currentContext!, msg: "Payment Successful");
      }

      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> _processPayment() async {
    try {
      print("hudai kaj kam");
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
      print("hudai kaj kam3");
    } catch (e) {
      print(e);
    }
  }

  // Helper method to calculate the amount in cents
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
              ),
              10.ph,
              CustomSimpleText(
                text: "Your Order Placed Successfully",
                textAlign: TextAlign.center,
                fontSize: AppSizes.size12,
                color: AppColors.white,
                fontWeight: FontWeight.normal,
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
                  onPress: (){
                    RouteGenerator.pushNamed(context,Routes.inbox);
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
                  ),
                )
            ),
          ],
        );
      },
    );
  }
}
