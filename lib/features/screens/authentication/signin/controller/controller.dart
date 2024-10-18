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
import 'package:provider_hub/features/widget/custom_toast/custom_toast.dart';
import 'package:provider_hub/main.dart';
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
  var isLoading = false.obs;
  @override
  void onInit() {
    fetchProviders();
    super.onInit();
  }

  Future<void> signIn() async {
    var emailFromSession = box.read('email');
    var passwordFromSession = box.read('password');
    // box.erase();
    print("this is print $emailFromSession $passwordFromSession");
    try {
      // Query Firestore collection for the provided email
      if ((emailFromSession == null &&
              emailPhoneController.value.text.isEmpty) &&
          passwordFromSession == null &&
          passwordController.value.text.isEmpty) {
        RouteGenerator.pushNamedAndRemoveAll(Routes.splashScreenRouteName);
      } else {
        isLoading.value = true;
        QuerySnapshot querySnapshot = await firestore.value
            .collection('users')
            .where('email',
                isEqualTo: emailFromSession.toString().isNotEmpty
                    ? emailFromSession
                    : emailPhoneController.value.text)
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          // Extract user data from the document
          DocumentSnapshot userDoc = querySnapshot.docs.first;
          Map<String, dynamic> userDocData =
              querySnapshot.docs.first.data() as Map<String, dynamic>;

          // Check if the provided password matches the one stored in Firestore
          if ((userDocData['password'] == passwordController.value.text) ||
              (userDocData['password'] == passwordFromSession)) {
            userData.value = userDocData; // Store user data for display
            if (userData['type'] == "provider") {
              providerModel.value = ProviderModel.fromMap(userDocData);
              userId.value = providerModel.value.id ?? '';
            } else if (userData['type'] == "consultant") {
              consultantModel.value = ConsultantModel.fromJson(userDocData);
              userId.value = consultantModel.value.id ?? '';
            } else if (userData['type'] == "qddp") {
              qddpModel.value = QDDPModel.fromJson(userDocData);
              userId.value = qddpModel.value.id ?? '';
            } else {
              userModel.value = UserModel.fromMap(userDocData);
              userId.value = userModel.value.id ?? '';
            }
            print('User data: ${userDoc.id} ${userModel.value.officeAddress}');
            box.write('loginUserId', userDoc.id);
            await box.write('loginUserId', userDoc.id);
            if ((emailFromSession == null) && (passwordFromSession == null)) {
              successToast(
                  context: navigatorKey.currentContext!,
                  msg: 'Login successful!');
            }

            if ((emailFromSession == null) && (passwordFromSession == null)) {
              await box.write('email', emailPhoneController.value.text);
              await box.write('password', passwordController.value.text);
              box.write('email', emailPhoneController.value.text);
              box.write('password', passwordController.value.text);
            }
            isLoading.value = false;
            RouteGenerator.pushNamed(
                navigatorKey.currentContext!, Routes.inbox);
            emailPhoneController.value.text = '';
            passwordController.value.text = '';
            // User authenticated, proceed to the next screen or show data
          } else {
            print('Incorrect password');
            isLoading.value = false;
            errorToast(
                context: navigatorKey.currentContext!,
                msg: "Incorrect password");
          }
        } else {
          // ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          //   const SnackBar(content: Text('No user found with that email')),
          // );
          isLoading.value = false;
          RouteGenerator.pushNamed(
              navigatorKey.currentContext!, Routes.splashScreenRouteName);
          box.erase();
          print('No user found with that email');
        }
      }
    } catch (e) {
      isLoading.value = false;
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
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    var user = userId.value;
    print("auth $user");
    if (user != null) {
      String userId = user;
      String? token = await messaging.getToken();
      print("fcm token $token");
      if (token != null) {
        await updateFCMToken(userId, token);
      } else {
        print("Failed to get FCM token.");
      }

      // Listen for token refresh
      messaging.onTokenRefresh.listen((newToken) {
        updateFCMToken(userId, newToken);
      });
    } else {
      print("User is not authenticated.");
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
