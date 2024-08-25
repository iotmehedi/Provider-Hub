import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_hub/const/routes/route_name.dart';
import 'package:provider_hub/features/screens/consultant_reg_screen/presentation/view/consultant_reg_screen.dart';
import 'package:provider_hub/features/screens/provider_registration_screen/payment_screens/presentation/views/payment_screen.dart';
import 'package:provider_hub/features/screens/provider_registration_screen/payment_screens/presentation/views/payment_screen_three.dart';
import '../../features/screens/homepage/presentation/view/all_services_screen.dart';
import '../../features/screens/homepage/presentation/view/homepage.dart';
import '../../features/screens/provider_registration_screen/payment_screens/presentation/views/credit_card_enroll.dart';
import '../../features/screens/provider_registration_screen/payment_screens/presentation/views/payment_screen_two.dart';
import '../../features/screens/provider_registration_screen/registration_screen/presentation/view/provider_registration_screen.dart';
import '../../features/screens/qddp_reg_screen/presentation/view/qddp_reg_screen.dart';
import '../../features/screens/register_page/presentation/view/register_page.dart';
import '../../features/screens/splash_screen/splash_screen.dart';
import '../../features/screens/trainer_reg_screen/presentation/view/trainer_reg_screen.dart';


class RouteGenerator {
  Future<dynamic> pushNamedSms(BuildContext context, String pageName,
      {List arguments = const []}) {
    return Navigator.pushNamed(context, pageName, arguments: arguments);
  }

  static pushNamed(BuildContext context, String pageName) {
    return Navigator.of(context).pushNamed(pageName);
  }

  static pushReplacementNamed(BuildContext context, String pageName,
      {List arguments = const []}) {
    return Navigator.pushReplacementNamed(context, pageName,
        arguments: arguments);
  }

  static pushNamedAndRemoveAll(String pageName, {List arguments = const []}) {
    Get.offAllNamed(pageName, arguments: arguments);
  }
  // static pushNamedAndRemoveAll(BuildContext context, String pageName,
  //     {List arguments = const []}) {
  //   return Navigator.pushNamedAndRemoveUntil(
  //       context, pageName, (route) => false,
  //       arguments: arguments);
  // }

  static pop(BuildContext context) {
    return Navigator.of(context).pop();
  }

  static popAndPushNamed(BuildContext context, String pageName,
      {List arguments = const []}) {
    return Navigator.popAndPushNamed(context, pageName, arguments: arguments);
  }

  static popAll(BuildContext context) {
    return Navigator.of(context).popUntil((route) => false);
  }

  static popUntil(BuildContext context, String pageName) {
    return Navigator.of(context).popUntil(ModalRoute.withName(pageName));
  }

  // ================================== Routing =============================================

  static Route<dynamic>? onRouteGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreenRouteName:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.registrationPage:
        return MaterialPageRoute(
          builder: (context) =>  RegisterPage(),
        );
        case Routes.providerRegScreen:
        return MaterialPageRoute(
          builder: (context) =>  ProviderRegistrationScreen(),
        );
        case Routes.trainerRegScreen:
        return MaterialPageRoute(
          builder: (context) =>  TrainerRegistrationScreen(),
        );
        case Routes.consultantRegScreen:
        return MaterialPageRoute(
          builder: (context) =>  ConsultantRegistrationScreen(),
        );
        case Routes.qddpRegScreen:
        return MaterialPageRoute(
          builder: (context) =>  QDDPRegistrationScreen(),
        );
        case Routes.paymentScreen:
        return MaterialPageRoute(
          builder: (context) =>  PaymentScreen(),
        );
        case Routes.paymentScreenTwo:
        return MaterialPageRoute(
          builder: (context) =>  PaymentScreenTwo(),
        );
        case Routes.paymentScreenThree:
        return MaterialPageRoute(
          builder: (context) =>  PaymentScreenThree(),
        );
        case Routes.creditCardEnroll:
        return MaterialPageRoute(
          builder: (context) =>  CreditCardEnrollScreen(),
        );
        case Routes.homepage:
        return MaterialPageRoute(
          builder: (context) =>  HomepageScreen(),
        );
        case Routes.allService:
        return MaterialPageRoute(
          builder: (context) =>  AllServicesScreen(),
        );

    }
    return null;
  }
}


//      adjHourlyRate = 84961 / adjustedWorkingHours;
//       adjDailyRate = adjHourlyRate * (hoursPerWeek / daysPerWeek);
//       adjWeeklyRate = adjHourlyRate * hoursPerWeek;
//       adjBiWeeklyRate = adjWeeklyRate * 2;
//       adjSemiMonthlyRate = adjAnnualRate / 24;
//       adjMonthlyRate = adjAnnualRate / 12;
//       adjQuarterlyRate = adjAnnualRate / 4;
//       adjAnnualRate = 94000;