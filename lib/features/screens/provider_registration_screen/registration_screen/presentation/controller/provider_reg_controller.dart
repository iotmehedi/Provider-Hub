import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider_hub/features/screens/provider_registration_screen/registration_screen/model/provider_model.dart';
import 'package:provider_hub/features/widget/toast/toast.dart';
import 'package:provider_hub/main.dart';

class ProviderRegController extends GetxController {
  var providerNameController = TextEditingController().obs;
  var serviceController = TextEditingController().obs;
  var contactNameController = TextEditingController().obs;
  var contactController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var officeAddressController = TextEditingController().obs;
  var licenseNumberController = TextEditingController().obs;
  var npiNumberController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confirmationPasswordController = TextEditingController().obs;
  var isChecked = false.obs;
  var passwordVisible = true.obs;
  var confirmPasswordVisible = false.obs;
  var imagePickerGallery = File('').obs;
  var imagePickerCamera = File('').obs;
  final ImagePicker picker = ImagePicker();

  Future<void> pickProfileImage() async {
    if (await Permission.storage.request().isGranted) {
      XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
      if (xFile != null) {
        imagePickerGallery.value = File(xFile.path);
        print(imagePickerGallery);
        update();
      }
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      await Permission.storage.request();
    }
    update();
  }
  Future<void> pickProfileImageCamera() async {
    if (await Permission.storage.request().isGranted) {
      XFile? xFile = await picker.pickImage(source: ImageSource.camera);
      if (xFile != null) {
        imagePickerCamera.value = File(xFile.path);
        print(imagePickerCamera);
        update();
      }
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      await Permission.storage.request();
    }

    update();
  }

  void handleRegistration() async {
    if (imagePickerGallery.value.path.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please select profile image.");
    } else if (providerNameController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!, msg: "Please enter name.");
    } else if (serviceController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!, msg: "Please enter service.");
    } else if (contactNameController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please enter contact name.");
    } else if (contactController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please enter contact number.");
    } else if (emailController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!, msg: "Please enter email.");
    } else if (officeAddressController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please enter office address.");
    } else if (licenseNumberController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please enter license number.");
    } else if (npiNumberController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Please enter npi number.");
    } else if (passwordController.value.text.isEmpty) {
      errorToast(
          context: navigatorKey.currentContext!, msg: "Please enter password.");
    } else if (passwordController.value.text !=
        confirmationPasswordController.value.text) {
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Confirm password not matched.");
    } else {
      String result = await registerUser(
          name: providerNameController.value.text,
          services: serviceController.value.text,
          contactName: contactNameController.value.text,
          contactNumber: contactController.value.text,
          email: emailController.value.text,
          password: passwordController.value.text,
          officeAddress: officeAddressController.value.text,
          licenseNumber: licenseNumberController.value.text,
          npiNumber: npiNumberController.value.text,
          profileImage: imagePickerGallery.value);

      if (result == 'Registration successful') {
        successToast(
            context: navigatorKey.currentContext!,
            msg: "Registration successful");
      } else {
        // Show an error message
        print(result);
      }
    }
  }

  Future<String> registerUser({
    required String email,
    required String password,
    required String name,
    required String services,
    required String contactName,
    required String contactNumber,
    required String officeAddress,
    required String licenseNumber,
    required String npiNumber,
    required File profileImage,
  }) async {
    String? imageUrl;
    try {
      // Check if the email or phone number already exists in Firestore
      QuerySnapshot emailCheck = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      QuerySnapshot phoneCheck = await FirebaseFirestore.instance
          .collection('users')
          .where('contactNumber', isEqualTo: contactNumber)
          .get();

      if (emailCheck.docs.isNotEmpty) {
        return 'This email is already registered';
      }

      if (phoneCheck.docs.isNotEmpty) {
        return 'This phone number is already registered';
      }

      // Register the user with Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      if (profileImage.path.isNotEmpty) {
        try {
          // Create a reference to Firebase Storage
          final storageRef = FirebaseStorage.instance.ref().child(
              'profile_images/${user!.uid}.${profileImage.path.split('.').last}');

          // Upload the file to Firebase Storage
          await storageRef.putFile(profileImage);

          // Get the download URL
          imageUrl = await storageRef.getDownloadURL();
        } catch (e) {
          return 'Failed to upload image: $e';
        }
      }
      if (user != null) {
        ProviderModel newUser = ProviderModel(
            uid: user.uid,
            email: email,
            password: password,
            name: name,
            services: services,
            contactName: contactName,
            contactNumber: contactNumber,
            licenseNumber: licenseNumber,
            npiNumber: npiNumber,
            officeAddress: officeAddress,
            imageUrl: imageUrl);

        // Save the user data to Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set(newUser.toMap());

        return 'Registration successful';
      } else {
        return 'Registration failed';
      }
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'An error occurred';
    } catch (e) {
      return e.toString();
    }
  }
  Future<void> showImageSourceDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                  pickProfileImageCamera(); // Call the camera function
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                  pickProfileImage(); // Call the gallery function
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
