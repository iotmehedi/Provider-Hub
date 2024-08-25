import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QDDPRegController extends GetxController{
  var fullNameController = TextEditingController().obs;
  var phoneNumberController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var officeAddressController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var isChecked = false.obs;
  var selectedValue = 'A'.obs;
  var selectedDegree = 'A'.obs;
}