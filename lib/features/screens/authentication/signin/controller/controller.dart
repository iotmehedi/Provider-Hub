import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_hub/main.dart';

class SigninController extends GetxController{
  var emailPhoneController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var auth = FirebaseAuth.instance.obs;
  var firestore = FirebaseFirestore.instance.obs;

  var userData = {}.obs;  // Store user data
  Future<void> signIn() async {
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

          print('User data: ${userDoc.id}');
            ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
              const SnackBar(content: Text('Login successful!')),
            );
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
}