import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProviderRegController extends GetxController{
  var providerNameController = TextEditingController().obs;
  var serviceController = TextEditingController().obs;
  var contactNameController = TextEditingController().obs;
  var contactController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var officeAddressController = TextEditingController().obs;
  var licenseNumberController = TextEditingController().obs;
  var npiNumberController = TextEditingController().obs;
  var isChecked = false.obs;
}