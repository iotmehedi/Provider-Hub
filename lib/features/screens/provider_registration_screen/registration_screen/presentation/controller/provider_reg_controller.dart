import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/consts/common_controller.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';
import 'package:provider_hub/features/widget/custom_toast/custom_toast.dart';
import 'package:provider_hub/main.dart';

import '../../../../../../const/routes/route_name.dart';
import '../../../../../../const/routes/router.dart';

class ProviderRegController extends GetxController {
  var providerNameController = TextEditingController(text: "mehedi").obs;
  var serviceController = TextEditingController(text: "service").obs;
  var contactNameController = TextEditingController(text: "contact name").obs;
  var contactController = TextEditingController(text: "012345678").obs;
  var emailController = TextEditingController(text: "test@gmail.com").obs;
  var officeAddressController = TextEditingController(text: "office").obs;
  var licenseNumberController = TextEditingController(text: "44545456").obs;
  var npiNumberController = TextEditingController(text: "634164654").obs;
  var passwordController = TextEditingController(text: "mehedi").obs;
  var confirmPasswordController = TextEditingController(text: "mehedi").obs;
  var isChecked = false.obs;


  var commonController = Get.put(CommonController());
  final ImagePicker _picker = ImagePicker();
  var imageBase64 = ''.obs;
  var pickedImage = File('').obs;
  // Pick image from gallery
  Future<void> pickImageFromGallery() async {
    if (await Permission.storage.request().isGranted) {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        pickedImage.value = File(pickedFile.path);
        imageBase64.value = base64Encode(
            pickedImage.value.readAsBytesSync()); // Convert image to base64
        print(imageBase64);
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

  // Add user details and the base64 image string to Firestore
  Future<void> validation() async {
    if (pickedImage.value.path.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!, msg: "Please enter image");
    } else if (providerNameController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!, msg: "Please enter name");
    } else if (serviceController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!, msg: "Please enter service");
    } else if (contactNameController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please enter contact name");
    } else if (contactController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please enter contact number");
    } else if (emailController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!, msg: "Please enter email");
    } else if (officeAddressController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please enter office address");
    } else if (licenseNumberController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please enter license number");
    } else if (npiNumberController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please enter npi number");
    } else if (passwordController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!, msg: "Please enter password");
    } else if (confirmPasswordController.value.text !=
        passwordController.value.text) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please confirm password not matched");
    } else if (isChecked.value == false) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please select terms and policies");
    } else {
      commonController.fromPage.value = "provider";
      commonController.email.value = emailController.value.text;
      commonController.phone.value = contactController.value.text;
      RouteGenerator.pushNamed(
          navigatorKey.currentContext!, Routes.paymentScreen);
    }
  }

  Future addProviderRegistration() async {
  
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    
    QuerySnapshot emailQuery =
        await users.where('email', isEqualTo: emailController.value.text).get();
    QuerySnapshot phoneQuery = await users
        .where('phoneNumber', isEqualTo: contactController.value.text)
        .get();
    
    if (emailQuery.docs.isNotEmpty) {
      errorToast(
          context: navigatorKey.currentContext!, msg: "Email already exists");
    } else if (phoneQuery.docs.isNotEmpty) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Phone number already exists");
    } else {
      print(providerNameController.value.text);
      users.add({
        'providerName': providerNameController.value.text,
        'service': serviceController.value.text,
        'contactName': contactNameController.value.text,
        'phoneNumber': contactController.value.text,
        'email': emailController.value.text,
        'officeAddress': officeAddressController.value.text,
        'licenseNumber': licenseNumberController.value.text,
        'npiNumber': npiNumberController.value.text,
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
