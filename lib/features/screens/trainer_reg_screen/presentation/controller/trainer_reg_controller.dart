import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../const/routes/route_name.dart';
import '../../../../../const/routes/router.dart';
import '../../../../../const/utils/consts/app_colors.dart';
import '../../../../../const/utils/consts/app_sizes.dart';
import '../../../../../const/utils/consts/common_controller.dart';
import '../../../../../main.dart';
import '../../../../widget/custom_simple_text/custom_simple_text.dart';
import '../../../../widget/custom_toast/custom_toast.dart';

class TrainerRegController extends GetxController{
  var fullNameController = TextEditingController().obs;
  var phoneNumberController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var officeAddressController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confirmationPasswordController = TextEditingController().obs;
  var isChecked = false.obs;
  var selectedValue = "Select Training's".obs;
  var commonController = Get.put(CommonController());
  final ImagePicker _picker = ImagePicker();
  var imageBase64 = ''.obs;
  var pickedImage = File('').obs;
  Future<void> pickImageFromGallery() async {
    if (await Permission.storage.request().isGranted) {
      final XFile? pickedFile =
      await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        pickedImage.value = File(pickedFile.path);
        imageBase64.value = base64Encode(
            pickedImage.value.readAsBytesSync()); // Convert image to base64
      }
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      await Permission.storage.request();
    }
  }

  // Pick image from camera
  Future<void> pickImageFromCamera() async {
    if (await Permission.storage.request().isGranted) {
      final XFile? pickedFile =
      await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        pickedImage.value = File(pickedFile.path);
        imageBase64.value = base64Encode(
            pickedImage.value.readAsBytesSync()); // Convert image to base64
      }
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      await Permission.storage.request();
    }
  }
  Future<void> validation() async {
    if (pickedImage.value.path.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!, msg: "Please enter image");
    } else if (fullNameController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!, msg: "Please enter full name");
    } else if (phoneNumberController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!, msg: "Please enter phone number");
    } else if (emailController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please enter your email");
    } else if (officeAddressController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please enter office address");
    } else if (selectedValue.value == "Select Training's") {
      errorToast(
          context: navigatorKey.currentContext!, msg: "Please select training's");
    }  else if (passwordController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!, msg: "Please enter password");
    } else if (confirmationPasswordController.value.text !=
        passwordController.value.text) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please confirm password not matched");
    } else if (isChecked.value == false) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please select terms and policies");
    } else {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', emailController.value.text);
      await prefs.setString('password', passwordController.value.text);
      commonController.fromPage.value = "trainer";
      commonController.email.value = emailController.value.text;
      commonController.phone.value = phoneNumberController.value.text;
      RouteGenerator.pushNamedSms(
          navigatorKey.currentContext!, Routes.paymentScreen);
    }
  }
  Future addTrainerRegistration() async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");

    QuerySnapshot emailQuery =
    await users.where('email', isEqualTo: emailController.value.text).get();
    QuerySnapshot phoneQuery = await users
        .where('phoneNumber', isEqualTo: phoneNumberController.value.text)
        .get();

    if (emailQuery.docs.isNotEmpty) {
      errorToast(
          context: navigatorKey.currentContext!, msg: "Email already exists");
    } else if (phoneQuery.docs.isNotEmpty) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Phone number already exists");
    } else {
      users.add({
        'fullName': fullNameController.value.text,
        'phoneNumber': phoneNumberController.value.text,
        'email': emailController.value.text,
        'officeAddress': officeAddressController.value.text,
        'training': selectedValue.value,
        'type': "trainer",
        'service': "Trainer",
        'imageBase64': imageBase64.value,
        'password': passwordController.value.text,
        'createdAt': FieldValue.serverTimestamp(),
      }).then((value) {
        print("User Added");
      }).catchError((error) {
        print("Failed to add user: $error");
      });
    }
  }
  void showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: CustomSimpleText(
            text: 'Choose Image Source',
            fontSize: AppSizes.size20,
            fontWeight: FontWeight.bold,
            color: AppColors.appColors,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  Icons.photo,
                  color: AppColors.appColors,
                ),
                title: CustomSimpleText(
                  text: 'Gallery',
                  fontSize: AppSizes.size17,
                  fontWeight: FontWeight.normal,
                  color: AppColors.white,
                ),
                onTap: () {
                  pickImageFromGallery();
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.camera,
                  color: AppColors.appColors,
                ),
                title: CustomSimpleText(
                  text: 'Camera',
                  fontSize: AppSizes.size17,
                  fontWeight: FontWeight.normal,
                  color: AppColors.white,
                ),
                onTap: () {
                  pickImageFromCamera();
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          ),
        );
      },
    );
  }

}