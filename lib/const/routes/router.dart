import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_hub/const/routes/route_name.dart';
import 'package:provider_hub/features/screens/authentication/signin/view/sign_in_page.dart';
import 'package:provider_hub/features/screens/consultant_reg_screen/presentation/view/consultant_reg_screen.dart';
import 'package:provider_hub/features/screens/homepage/presentation/sub_item_page/crc_screen.dart';
import 'package:provider_hub/features/screens/homepage/presentation/sub_item_page/human_rights_screen.dart';
import 'package:provider_hub/features/screens/inbox_page/presentation/view/inbox_page.dart';
import 'package:provider_hub/features/screens/nearest_provider/presentation/view/nearest_provider_screen.dart';
import 'package:provider_hub/features/screens/provider_registration_screen/payment_screens/presentation/views/payment_screen.dart';
import 'package:provider_hub/features/screens/provider_registration_screen/payment_screens/presentation/views/payment_screen_three.dart';
import '../../features/screens/authentication/model/provider_model.dart';
import '../../features/screens/homepage/presentation/sub_item_page/dbhds_screen.dart';
import '../../features/screens/homepage/presentation/sub_item_page/provider_resources_screen/provider_resources_screen.dart';
import '../../features/screens/homepage/presentation/sub_item_page/updates/biu_screen.dart';
import '../../features/screens/homepage/presentation/sub_item_page/updates/dmas_screen.dart';
import '../../features/screens/homepage/presentation/sub_item_page/updates/human_rights_trainings_screen.dart';
import '../../features/screens/homepage/presentation/sub_item_page/license_specialist_screen.dart';
import '../../features/screens/homepage/presentation/sub_item_page/updates/licensing_page.dart';
import '../../features/screens/homepage/presentation/view/all_services_screen.dart';
import '../../features/screens/homepage/presentation/view/homepage.dart';
import '../../features/screens/message_screen/presentation/view/message_screen.dart';
import '../../features/screens/profile_page/presentation/view/profile_page.dart';
import '../../features/screens/provider_registration_screen/payment_screens/presentation/views/credit_card_enroll.dart';
import '../../features/screens/provider_registration_screen/payment_screens/presentation/views/payment_screen_two.dart';
import '../../features/screens/provider_registration_screen/registration_screen/presentation/view/provider_registration_screen.dart';
import '../../features/screens/qddp_reg_screen/presentation/view/qddp_reg_screen.dart';
import '../../features/screens/register_page/presentation/view/register_page.dart';
import '../../features/screens/splash_screen/splash_screen.dart';
import '../../features/screens/trainer_reg_screen/presentation/view/trainer_reg_screen.dart';
import '../../features/widget/common_webview/custom_webview.dart';

class RouteGenerator {
  static pushNamedSms(BuildContext context, String pageName,
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

  static gotoWebPage(
      {required BuildContext context,
      String? pageTitle,
      required String url}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebPage(
          pageTitle: pageTitle,
          url: url,
        ),
      ),
    );
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
          builder: (context) => RegisterPage(),
        );
      case Routes.signinPage:
        return MaterialPageRoute(
          builder: (context) => SignInPage(),
        );
      case Routes.providerRegScreen:
        return MaterialPageRoute(
          builder: (context) => ProviderRegistrationScreen(),
        );
      case Routes.trainerRegScreen:
        return MaterialPageRoute(
          builder: (context) => TrainerRegistrationScreen(),
        );
      case Routes.consultantRegScreen:
        return MaterialPageRoute(
          builder: (context) => ConsultantRegistrationScreen(),
        );
      case Routes.qddpRegScreen:
        {
          return MaterialPageRoute(
            builder: (context) => QDDPRegistrationScreen(),
          );
        }
      case Routes.paymentScreen:
        {
          final arguments = routeSettings.arguments as List;
          return MaterialPageRoute(
            builder: (context) => PaymentScreen(),
          );
        }
      case Routes.paymentScreenTwo:
        {
          final arguments = routeSettings.arguments as List;
          return MaterialPageRoute(
            builder: (context) =>
                PaymentScreenTwo(),
          );
        }
      case Routes.paymentScreenThree:
        {
          final arguments = routeSettings.arguments as List;
          return MaterialPageRoute(
            builder: (context) => PaymentScreenThree(),
          );
        }
      case Routes.creditCardEnroll:
        return MaterialPageRoute(
          builder: (context) => CreditCardEnrollScreen(),
        );
      case Routes.homepage:
        return MaterialPageRoute(
          builder: (context) => HomepageScreen(),
        );
      case Routes.allService:
        return MaterialPageRoute(
          builder: (context) => AllServicesScreen(),
        );
      case Routes.inbox:
        return MaterialPageRoute(
          builder: (context) => InboxPage(),
        );
      case Routes.nearestProvider:
        return MaterialPageRoute(
          builder: (context) => NearestProviderPage(),
        );
      case Routes.messageScreen:
        final arguments = routeSettings.arguments as List;
        return MaterialPageRoute(
          builder: (context) => MessageScreen(receiverId: arguments[0] as String, image: arguments[1] as String, name: arguments[2] as String,),
        );
      case Routes.profile:
        return MaterialPageRoute(
          builder: (context) => ProfilePage(),
        );
      case Routes.dbhdsScreen:
        return MaterialPageRoute(
          builder: (context) => DbhdsScreen(),
        );
      case Routes.licenseSpecialistScreen:
        return MaterialPageRoute(
          builder: (context) => LicenseSpecialistScreen(),
        );
      case Routes.humanRightScreen:
        return MaterialPageRoute(
          builder: (context) => HumanRightsScreen(),
        );
      case Routes.crcScreen:
        return MaterialPageRoute(
          builder: (context) => CRCScreen(),
        );
        case Routes.licensingPage:
        return MaterialPageRoute(
          builder: (context) => LicensingPage(),
        );
        case Routes.humanRightsTrainingsScreen:
        return MaterialPageRoute(
          builder: (context) => HumanRightsTrainingsScreen(),
        );
        case Routes.biuScreen:
        return MaterialPageRoute(
          builder: (context) => BiuScreen(),
        );
        case Routes.dmasScreen:
        return MaterialPageRoute(
          builder: (context) => DmasScreen(),
        );
        case Routes.providerResourcesScreen:
        return MaterialPageRoute(
          builder: (context) => ProviderResourcesScreen(),
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
