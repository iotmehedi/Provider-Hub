import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsultantRegController extends GetxController{
  var fullNameController = TextEditingController().obs;
  var phoneNumberController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var isChecked = false.obs;
  var selectedValue = 'A'.obs;
}