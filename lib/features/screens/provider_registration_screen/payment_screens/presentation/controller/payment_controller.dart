import 'package:get/get.dart';
import 'package:provider_hub/features/screens/register_page/presentation/controller/register_controller.dart';

class PaymentController extends GetxController{
  var planSelection = false.obs;
  var switchOn = false.obs;
  var registerController = Get.find<RegisterController>();
}