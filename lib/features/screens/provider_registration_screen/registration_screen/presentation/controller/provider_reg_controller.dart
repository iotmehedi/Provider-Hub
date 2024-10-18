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
import 'package:shared_preferences/shared_preferences.dart';

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

        // Get the file size in bytes
        int imageSize = pickedImage.value.lengthSync();

        // Convert to MB (1 MB = 1024 * 1024 bytes)
        double imageSizeInMB = imageSize / (1024 * 1024);

        // Check if the file size is more than 1MB
        if (imageSizeInMB > 1) {
          // Show a toast message if the file is larger than 1MB
          errorToast(context: navigatorKey.currentContext!, msg: "Image size should less than 1 mb");
        } else {
          // Convert image to base64 if size is within limit
          imageBase64.value = base64Encode(pickedImage.value.readAsBytesSync());
          print(imageBase64.value);
        }
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
        int imageSize = pickedImage.value.lengthSync();

        // Convert to MB (1 MB = 1024 * 1024 bytes)
        double imageSizeInMB = imageSize / (1024 * 1024);

        // Check if the file size is more than 1MB
        if (imageSizeInMB > 1) {
          // Show a toast message if the file is larger than 1MB
          errorToast(context: navigatorKey.currentContext!, msg: "Image size should less than 1 mb");
        } else {
          // Convert image to base64 if size is within limit
          imageBase64.value = base64Encode(pickedImage.value.readAsBytesSync());
          print(imageBase64.value);
        }// Convert image to base64
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
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', emailController.value.text);
      await prefs.setString('password', passwordController.value.text);
      commonController.fromPage.value = "provider";
      commonController.email.value = emailController.value.text;
      commonController.phone.value = contactController.value.text;

      RouteGenerator.pushNamedSms(
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

      Map<String, dynamic> providerData = {
        'providerName': providerNameController.value.text,  // providerName: string
        'service': serviceController.value.text,            // service: string
        'contactName': contactNameController.value.text,    // contactName: string
        'phoneNumber': contactController.value.text,        // phoneNumber: string
        'email': emailController.value.text,                // email: string
        'officeAddress': officeAddressController.value.text, // officeAddress: string
        'licenseNumber': licenseNumberController.value.text, // licenseNumber: string
        'npiNumber': npiNumberController.value.text,        // npiNumber: string
        'imageBase64': imageBase64.value,                   // imageBase64: string (ensure this is within Firestore's size limits)
        'type': "provider",                                 // type: string
        'password': passwordController.value.text,          // password: string
        'fcmToken': "",                  // fcmToken: string (optional, replace if available)
        'createdAt': FieldValue.serverTimestamp(),          // createdAt: Firestore timestamp
      };

      box.write('email', emailController.value.text);  // Storing email locally
      box.write('password', passwordController.value.text);  // Storing password locally

      users.add(providerData).then((value) {
        print("User Added");
        String generatedId = value.id;
        // Update the document with the generated ID
        users.doc(generatedId).update({
          'id': generatedId,  // Assign the generated Firestore document ID to the 'id' field
        }).then((_) {
          print("User ID added");
          successToast(context: navigatorKey.currentContext!, msg: "Payment Successful");
          RouteGenerator.pushNamedAndRemoveAll(Routes.splashScreenRouteName);
          // successToast(context: navigatorKey.currentContext!, msg: "User successfully added");
        }).catchError((error) {
          print("Failed to update user with ID: $error");
        });
      }).catchError((error) {
        print("Failed to add user: $error");
        // errorToast(context: navigatorKey.currentContext!, msg: "Failed to add user: $error");
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
