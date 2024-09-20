import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
  var filteredList = <ProviderModel>[].obs;
  var userData = {}.obs; // Store user data
  var userId = ''.obs;
  @override
  void onInit() {
    fetchProviders();
    super.onInit();
  }

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
            userId.value = providerModel.value.id ?? '';
            box.write("userId", userId.value);
          } else if (userData['type'] == "consultant") {
            consultantModel.value = ConsultantModel.fromJson(userDocData);
            userId.value = consultantModel.value.id ?? '';
            box.write("userId", userId.value);
          } else if (userData['type'] == "qddp") {
            qddpModel.value = QDDPModel.fromJson(userDocData);
            userId.value = qddpModel.value.id ?? '';
            box.write("userId", userId.value);
          } else {
            userModel.value = UserModel.fromMap(userDocData);
            userId.value = userModel.value.id ?? '';
            box.write("userId", userId.value);
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
          saveFCMToken();
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
    print("this is data");
    try {
      print("this is data");
      // Initialize the collection reference for 'users'
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      // Fetch all user documents from Firestore
      QuerySnapshot querySnapshot = await users.get();

      // Clear the providerList before adding new data
      providerList.clear();
      filteredList.clear();

      // Loop through each document in the snapshot
      querySnapshot.docs.forEach((doc) {
        // Check if the user type is "provider"
        if (doc['type'] == "provider") {
          print("this is data2");
          // Convert the document data to ProviderModel and add it to the list
          ProviderModel provider =
              ProviderModel.fromMap(doc.data() as Map<String, dynamic>);

          providerList.add(provider);
          filteredList.add(provider);
        }
      });

      // Print the number of providers fetched
      print("Number of providers: ${providerList.first.contactName}");
      print("Number of providers: ${filteredList.first.contactName}");
    } catch (e) {
      print('Error fetching providers: $e');
    }
  }

  void filterProviders(String query) {
    if (query.isEmpty) {
      filteredList.value =
          providerList; // Show all items if the search query is empty
    } else {
      filteredList.value = providerList
          .where((provider) => provider.contactName!.toLowerCase().contains(query
              .toLowerCase())) // Assuming `name` is a field in your ProviderModel
          .toList();
    }
  }

  Future<void> getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    var currentId = FirebaseAuth.instance.currentUser;
    // Get the token each time the application loads
    String? token = await messaging.getToken();
    print("FCM Token: $token");
    print("user: ${currentId?.uid}");

    // Save this token to Firestore or your backend database
    if (token != null && userId.value.isNotEmpty) {
      // You can save the token for the logged-in user in Firestore
      // Example:
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId.value)
          .update({
        'fcmToken': token,
      });
    }

    // Handle when the token is updated
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      print("New FCM Token: $newToken");

      // Save new token
      FirebaseFirestore.instance
          .collection('users')
          .doc(currentId!.uid)
          .update({
        'fcmToken': newToken,
      });
    });
  }

  Future<void> saveFCMToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Assuming 'userId' is passed to this function
    if (box.read("userId").isNotEmpty) {
      String? token = await messaging.getToken();
      print("FCM Token: $token");

      if (token != null) {
        await updateFCMToken(box.read("userId"), token);
      } else {
        print("Failed to get FCM token.");
      }

      // Listen for token refresh
      messaging.onTokenRefresh.listen((newToken) {
        updateFCMToken(box.read("userId"), newToken);
      });
    } else {
      print("User ID is empty or invalid. ${box.read("userId")}");
    }
  }

  Future<void> updateFCMToken(String userId, String token) async {
    try {
      // Check if the document exists
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        // Document exists, update the FCM token
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({
          'fcmToken': token,
        });
        print("FCM token updated successfully.");
      } else {
        // Document does not exist, create it
        await FirebaseFirestore.instance.collection('users').doc(userId).set({
          'fcmToken': token,
        });
        print("User document created and FCM token set.");
      }
    } catch (e) {
      print("Error updating FCM token: $e");
    }
  }
}
