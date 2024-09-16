import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:provider_hub/features/screens/authentication/model/consultant_model.dart';
import 'package:provider_hub/features/screens/authentication/model/provider_model.dart';
import 'package:provider_hub/features/screens/authentication/model/qddp_model.dart';
import 'package:provider_hub/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../const/routes/route_name.dart';
import '../../../../../const/routes/router.dart';
import '../../model/userModel.dart';

class SigninController extends GetxController {
  var emailPhoneController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var auth = FirebaseAuth.instance.obs;
  var firestore = FirebaseFirestore.instance.obs;
  var userModel = UserModel().obs;
  var providerModel = ProviderModel().obs;
  RxList<ProviderModel> providerList = <ProviderModel>[].obs;
  var consultantModel = ConsultantModel().obs;
  var qddpModel = QDDPModel().obs;
  var userData = {}.obs; // Store user data
  Future<void> signIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var emailFromSession = box.read('email');
    var passwordFromSession = box.read('password');
    try {
      // Query Firestore collection for the provided email
      QuerySnapshot querySnapshot = await firestore.value
          .collection('users')
          .where('email', isEqualTo: emailPhoneController.value.text)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Extract user data from the document
        DocumentSnapshot userDoc = querySnapshot.docs.first;
        Map<String, dynamic> userDocData =
            querySnapshot.docs.first.data() as Map<String, dynamic>;

        // Check if the provided password matches the one stored in Firestore
        if (userDocData['password'] == passwordController.value.text) {
          userData.value = userDocData; // Store user data for display
          if (userData['type'] == "provider") {
            providerModel.value = ProviderModel.fromMap(userDocData);
          } else if (userData['type'] == "consultant") {
            consultantModel.value = ConsultantModel.fromJson(userDocData);
          } else if (userData['type'] == "qddp") {
            qddpModel.value = QDDPModel.fromJson(userDocData);
          } else {
            userModel.value = UserModel.fromMap(userDocData);
          }
          print('User data: ${userDoc.id} ${userModel.value.officeAddress}');
          box.write('loginUserId', userDoc.id);
          await prefs.setString('loginUserId', userDoc.id);
          print('User data: ${userDoc.id} ${userData['officeAddress']}');
          ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
            const SnackBar(content: Text('Login successful!')),
          );
          if ((emailFromSession?.isEmpty ?? false) &&
              (passwordFromSession?.isEmpty ?? false)) {
            await prefs.setString('email', emailPhoneController.value.text);
            await prefs.setString('password', passwordController.value.text);
            box.write('email', emailPhoneController.value.text);
            box.write('password', passwordController.value.text);
          }
          RouteGenerator.pushNamed(navigatorKey.currentContext!, Routes.inbox);
          // User authenticated, proceed to the next screen or show data
        } else {
          print('Incorrect password');
          ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
            const SnackBar(content: Text('Incorrect password')),
          );
        }
      } else {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('No user found with that email')),
        );
        print('No user found with that email');
      }
    } catch (e) {
      print('Error signing in: $e');
    }
  }

  Future<void> fetchProviders() async {
    try {
      // Initialize the collection reference for 'users'
      CollectionReference users = FirebaseFirestore.instance.collection('users');

      // Fetch all user documents from Firestore
      QuerySnapshot querySnapshot = await users.get();

      // Clear the providerList before adding new data
      providerList.clear();

      // Loop through each document in the snapshot
      querySnapshot.docs.forEach((doc) {
        // Check if the user type is "provider"
        if (doc['type'] == "provider") {
          // Convert the document data to ProviderModel and add it to the list
          providerList.add(ProviderModel.fromMap(doc.data() as Map<String, dynamic>));
        }
      });

      // Print the number of providers fetched
      print("Number of providers: ${providerList.first.contactName}");

    } catch (e) {
      print('Error fetching providers: $e');
    }
  }
}
