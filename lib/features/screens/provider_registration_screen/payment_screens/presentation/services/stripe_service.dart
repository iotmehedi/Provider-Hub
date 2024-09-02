import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider_hub/features/widget/toast/toast.dart';
import 'package:provider_hub/main.dart';
import '../../../../../../const/routes/route_name.dart';
import '../../../../../../const/routes/router.dart';
import 'consts.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment({required String money}) async {
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
}
