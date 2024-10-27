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
import 'package:provider_hub/features/screens/inbox_page/presentation/controller/controller.dart';
import 'package:provider_hub/features/screens/provider_registration_screen/registration_screen/presentation/controller/provider_reg_controller.dart';
import 'package:provider_hub/features/screens/qddp_reg_screen/presentation/controller/qddp_controller.dart';
import 'package:provider_hub/features/widget/custom_toast/custom_toast.dart';
import 'package:provider_hub/main.dart';
import '../../../../../const/routes/route_name.dart';
import '../../../../../const/routes/router.dart';
import '../../model/userModel.dart';

class SigninController extends GetxController {
  var emailPhoneController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var bioController = TextEditingController().obs;
  var isClickedEditProfile = false.obs;
  var isClickedEditDegree = false.obs;
  var isClickedEditDegreeField = false.obs;
  var isClickedService = false.obs;
  var auth = FirebaseAuth.instance.obs;
  var firestore = FirebaseFirestore.instance.obs;
  var userModel = UserModel().obs;
  var providerModel = ProviderModel().obs;
  RxList<ProviderModel> providerList = <ProviderModel>[].obs;
  var consultantModel = ConsultantModel().obs;
  var qddpModel = QDDPModel().obs;
  var filteredList = <ProviderModel>[].obs;
  var filteredListService = <ProviderModel>[].obs;
  var userData = {}.obs; // Store user data
  var userId = ''.obs;
  var name = ''.obs;
  var image = ''.obs;
  var type = ''.obs;
  var isLoading = false.obs;

  var inboxController = Get.put(InboxController());
  var providerController = Get.put(ProviderRegController());
  var qddpController = Get.put(QDDPRegController());
  @override
  void onInit() {
    fetchProviders();
    super.onInit();
  }
  void setSelectedServices() {
   // providerController.selectedServiceItems.value = providerModel.value.service ?? [];
   // print("value ${providerController.selectedServiceItems.value}");
   providerController.selectedServiceItems.clear();

   // Check for matches and populate selectedServiceItems
   for (var service in providerController.selectedServiceName) {
     if (providerModel.value.service?.contains(service) ?? false) {
       providerController.selectedServiceItems.add(service); // Add matched service to selected items
     }
   }
   print("the selected value ${providerController.selectedServiceItems}");
   update();
  }
  Future<void> signIn() async {
    var emailFromSession = box.read('email');
    var passwordFromSession = box.read('password');
    // box.erase();

    try {
      // Query Firestore collection for the provided email
      if ((emailFromSession == null &&
              emailPhoneController.value.text.isEmpty) &&
          passwordFromSession == null &&
          passwordController.value.text.isEmpty) {
        print("this is print $emailFromSession $passwordFromSession");
        RouteGenerator.pushNamedAndRemoveAll(Routes.splashScreenRouteName);
      } else {
        isLoading.value = true;

        QuerySnapshot querySnapshot = await firestore.value
            .collection('users')
            .where('email',
                isEqualTo: (emailFromSession != null)
                    ? emailFromSession
                    : emailPhoneController.value.text)
            .get();
        bool userFound = false;

        // Loop through the documents in the query snapshot
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> userDocData = doc.data() as Map<String, dynamic>;
          print(
              'the value others ${userDocData['password']} ${userDocData['email']} ${userDocData['type']}');

          // Check if the provided password matches the one stored in Firestore
          if ((userDocData['password'] == passwordController.value.text) ||
              (userDocData['password'] == passwordFromSession)) {
            userFound = true;
            userData.value = userDocData; // Store user data for display
            // Check user type and map to the respective model
            if (userData['type'] == "provider") {
              providerModel.value = ProviderModel.fromMap(userDocData);
              userId.value = providerModel.value.id ?? '';
              name.value = providerModel.value.providerName ?? '';
              image.value = providerModel.value.imageBase64 ?? '';
              type.value = providerModel.value.type ?? '';
            } else if (userData['type'] == "consultant") {
              consultantModel.value = ConsultantModel.fromJson(userDocData);
              userId.value = consultantModel.value.id ?? '';
              name.value = consultantModel.value.fullName ?? '';
              image.value = consultantModel.value.imageBase64 ?? '';
              type.value = consultantModel.value.type ?? '';
            } else if (userData['type'] == "qddp") {
              qddpModel.value = QDDPModel.fromJson(userDocData);
              userId.value = qddpModel.value.id ?? '';
              name.value = qddpModel.value.fullName ?? '';
              image.value = qddpModel.value.imageBase64 ?? '';
              type.value = qddpModel.value.type ?? '';
            } else {
              userModel.value = UserModel.fromMap(userDocData);
              userId.value = userModel.value.id ?? '';
              name.value = userModel.value.fullName ?? '';
              image.value = userModel.value.imageBase64 ?? '';
              type.value = userModel.value.type ?? '';
            }

            // Write login data to the session
            box.write('loginUserId', userId.value);
            box.write('name', name.value);
            box.write('image', image.value);
            box.write('type', type.value);

            if ((emailFromSession == null) && (passwordFromSession == null)) {
              successToast(
                  context: navigatorKey.currentContext!,
                  msg: 'Login successful!');
            }

            // Save email and password to the session
            if ((emailFromSession == null) && (passwordFromSession == null)) {
              await box.write('email', emailPhoneController.value.text);
              await box.write('password', passwordController.value.text);
            }
            box.write("isLoggedIn", true);
            isLoading.value = false;
            inboxController.fetchLastMessages();
            RouteGenerator.pushNamedAndRemoveAll(Routes.homepage);

            // Clear the text fields
            emailPhoneController.value.text = '';
            passwordController.value.text = '';
            break; // Exit the loop once the user is authenticated
          }
        }

        // Check if user was not found after looping through all documents
        if (!userFound) {
          print('Incorrect email or password');
          isLoading.value = false;
          errorToast(
              context: navigatorKey.currentContext!,
              msg: "Incorrect email or password");
        }
      }
    } catch (e) {
      isLoading.value = false;
      print('Error signing in: $e');
    }
    isLoading.value = false;
    update();
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
      for (var doc in querySnapshot.docs) {
        // Check if the user type is "provider"
        if (doc['type'] == "provider") {
          print("this is data2");
          // Convert the document data to ProviderModel and add it to the list
          ProviderModel provider =
              ProviderModel.fromMap(doc.data() as Map<String, dynamic>);

          providerList.add(provider);
          filteredList.add(provider);
        }
      }
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
      filteredListService.value = filteredList;
    }
  }

  void filterProvidersService(String query) {
    if (query.isEmpty) {
      filteredListService.value =
          filteredList; // Show all items if the search query is empty
    } else {
      filteredListService.value = filteredList
          .where((provider) => provider.contactName!.toLowerCase().contains(query
              .toLowerCase())) // Assuming `name` is a field in your ProviderModel
          .toList();
    }
  }
  Future<void> updateBio(String userId, String newBio) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'bio': newBio,
      });
      print('Bio updated successfully');
    } catch (e) {
      print('Error updating bio: $e');
    }
    update();
  }
  Future<void> updateServicesInFirestore(String documentId, List<dynamic> newServices) async {
    // Reference to the Firestore document
    DocumentReference docRef = FirebaseFirestore.instance.collection('users').doc(documentId);

    // Get the current services from Firestore
    DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      // Assuming 'service' is the field name in Firestore
      List<String> currentServices = List<String>.from(docSnapshot['service'] ?? []);

      // Merge existing services with new services, avoiding duplicates
      List<dynamic> updatedServices = [ ...newServices].toSet().toList();

      // Update the Firestore document with the merged service list
      await docRef.update({
        'service': updatedServices,
      });
    } else {
      print("Document does not exist.");
    }
  }
  Future<void> updateTrainingsInFirestore(String documentId, List<dynamic> newServices) async {
    // Reference to the Firestore document
    DocumentReference docRef = FirebaseFirestore.instance.collection('users').doc(documentId);

    // Get the current services from Firestore
    DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      // Assuming 'service' is the field name in Firestore
      List<String> currentServices = List<String>.from(docSnapshot['training'] ?? []);

      // Merge existing services with new services, avoiding duplicates
      List<dynamic> updatedServices = [ ...newServices].toSet().toList();

      // Update the Firestore document with the merged service list
      await docRef.update({
        'training': updatedServices,
      });
    } else {
      print("Document does not exist.");
    }
  }
  Future<void> updateConsultantInFirestore(String documentId, List<dynamic> newServices) async {
    // Reference to the Firestore document
    DocumentReference docRef = FirebaseFirestore.instance.collection('users').doc(documentId);

    // Get the current services from Firestore
    DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      // Assuming 'service' is the field name in Firestore
      List<String> currentServices = List<String>.from(docSnapshot['service'] ?? []);

      // Merge existing services with new services, avoiding duplicates
      List<dynamic> updatedServices = [ ...newServices].toSet().toList();

      // Update the Firestore document with the merged service list
      await docRef.update({
        'service': updatedServices,
      });
    } else {
      print("Document does not exist.");
    }
  }
  Future<void> fetchDegreeFromFirestore(String userId) async {
    qddpController.selectedDegree.value = "Select Degree";
    try {
      var docSnapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      if (docSnapshot.exists && docSnapshot.data()!.containsKey('degree')) {
        String degree = docSnapshot['degree'] ?? "Select Degree";
        if (["Select Degree",
          "Socialogy",
          "social work",
          "special education",
          "psychology",
          "rehabilatation",
          "counceling",
          "Bachelor’s",
          "Masters"].contains(degree)) {
         qddpController.selectedDegree.value = degree;
        } else {
        qddpController.selectedDegree.value = "Select Degree"; // Default to a valid item if no match
        }
       // qddpController.selectedValue.value = degree;
        print("this is value ${ qddpController.selectedDegree.value}");
      }
    } catch (e) {
      print("Error fetching degree: $e");
    }
  }
  Future<void> fetchDegreeFieldFromFirestore(String userId) async {
    qddpController.selectedValue.value = "Choose one";
    try {
      var docSnapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      if (docSnapshot.exists && docSnapshot.data()!.containsKey('degreeField')) {
        String degree = docSnapshot['degreeField'] ?? "Choose one";
        if (["Choose one",
          "Registered nurse",
          "Human Services"].contains(degree)) {
         qddpController.selectedValue.value = degree;
        } else {
        qddpController.selectedValue.value = "Choose one"; // Default to a valid item if no match
        }
       // qddpController.selectedValue.value = degree;
        print("this is value ${ qddpController.selectedValue.value}");
      }
    } catch (e) {
      print("Error fetching degree: $e");
    }
  }
  Future<void> updateDegreeInFirestore(String userId, String field) async {
    try {
      if(field == "degreeField"){
        await FirebaseFirestore.instance.collection('users').doc(userId).update({
          'degreeField': qddpController.selectedValue.value,
        });
      }else{
        await FirebaseFirestore.instance.collection('users').doc(userId).update({
          'degree': qddpController.selectedDegree.value,
        });
      }
      successToast(context: navigatorKey.currentContext!,msg:"Updated successfully");
    } catch (e) {
      print("Error updating degree: $e");
    }
    update();
  }
  // Future<void> getToken() async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //   var currentId = FirebaseAuth.instance.currentUser;
  //   // Get the token each time the application loads
  //   String? token = await messaging.getToken();
  //   print("FCM Token: $token");
  //   print("user: ${currentId?.uid}");

  //   // Save this token to Firestore or your backend database
  //   if (token != null && userId.value.isNotEmpty) {
  //     // You can save the token for the logged-in user in Firestore
  //     // Example:
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(userId.value)
  //         .update({
  //       'fcmToken': token,
  //     });
  //   }

  //   // Handle when the token is updated
  //   FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
  //     print("New FCM Token: $newToken");

  //     // Save new token
  //     FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(currentId!.uid)
  //         .update({
  //       'fcmToken': newToken,
  //     });
  //   });
  // }

  // Future<void> saveFCMToken() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;

  //   var user = userId.value;
  //   print("auth $user");
  //   if (user != null) {
  //     String userId = user;
  //     String? token = await messaging.getToken();
  //     print("fcm token $token");
  //     if (token != null) {
  //       await updateFCMToken(userId, token);
  //     } else {
  //       print("Failed to get FCM token.");
  //     }

  //     // Listen for token refresh
  //     messaging.onTokenRefresh.listen((newToken) {
  //       updateFCMToken(userId, newToken);
  //     });
  //   } else {
  //     print("User is not authenticated.");
  //   }
  // }

  // Future<void> updateFCMToken(String userId, String token) async {
  //   try {
  //     // Check if the document exists
  //     DocumentSnapshot userDoc = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(userId)
  //         .get();

  //     if (userDoc.exists) {
  //       // Document exists, update the FCM token
  //       await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(userId)
  //           .update({
  //         'fcmToken': token,
  //       });
  //       print("FCM token updated successfully.");
  //     } else {
  //       // Document does not exist, create it
  //       await FirebaseFirestore.instance.collection('users').doc(userId).set({
  //         'fcmToken': token,
  //       });
  //       print("User document created and FCM token set.");
  //     }
  //   } catch (e) {
  //     print("Error updating FCM token: $e");
  //   }
  // }
}
