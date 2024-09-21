import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/inbox_page/model/messageModel.dart';
import '../../../../../main.dart';
import '../../../../widget/custom_text_textfield_column/custom_text_textfield_column.dart';
import '../../../../widget/custom_toast/custom_toast.dart';
import '../../../message_screen/presentation/get_service/get_service_key.dart';
import '../../model/chat_model.dart';
import 'package:rxdart/rxdart.dart' as rx;
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class InboxController extends GetxController {
  var name = ''.obs;
  var isLoading = false.obs;
  var isMessageLoading = false.obs;
  var chatResponseModel = ChatMessageResponse().obs;
  var chatListModel = MessageModelResponse().obs;
  var userId = ''.obs;
  var messageController = TextEditingController().obs;
  final ImagePicker picker = ImagePicker();
  var pickedImage = File("").obs;
  final FirebaseFirestore fs = FirebaseFirestore.instance;
  var imageBase64 = ''.obs;
  @override
  void onInit() {
    fetchLastMessages();
    super.onInit();
  }

// Fetch chat data from Firestore where senderId or receiverId matches the logged-in user's ID
  Future<void> fetchLastMessages() async {
    print("this is id ${box.read('loginUserId')}");

    // Retrieve the stored login user ID
    userId.value = box.read('loginUserId') ?? '';

    print("this is id ${userId.value} ${box.read('loginUserId')}");

    try {
      // Clear the current chat response model data
      chatResponseModel.value.data?.clear();

      // Show a loading indicator
      isLoading.value = true;

      if (userId.value.isNotEmpty) {
        // Query Firestore for messages where senderId matches the logged-in user
        final senderQuery = await FirebaseFirestore.instance
            .collection('chats')
            .where('senderId', isEqualTo: userId.value)
            .orderBy('timestamp', descending: true)
            .get();

        // Query Firestore for messages where receiverId matches the logged-in user
        final receiverQuery = await FirebaseFirestore.instance
            .collection('chats')
            .where('receiverId', isEqualTo: userId.value)
            .orderBy('timestamp', descending: true)
            .get();

        // Combine both results and eliminate duplicates based on senderId, receiverId
        final combinedMessages = [...senderQuery.docs, ...receiverQuery.docs];

        // Create a Set to track unique message combinations of sender and receiver
        Set<String> uniqueMessages = {};

        // Filter messages to ensure uniqueness based on senderId and receiverId
        List<QueryDocumentSnapshot> filteredMessages =
            combinedMessages.where((doc) {
          final senderId = doc['senderId'];
          final receiverId = doc['receiverId'];

          // Create a unique key for each message by combining senderId and receiverId
          final key1 = "$senderId-$receiverId";
          final key2 =
              "$receiverId-$senderId"; // Check for the reverse combination

          if (uniqueMessages.contains(key1) || uniqueMessages.contains(key2)) {
            // If either combination exists, it's a duplicate, so filter it out
            return false;
          } else {
            // Otherwise, add it to the set and keep it
            uniqueMessages.add(key1);
            return true;
          }
        }).toList();

        // Convert Firestore documents to the `ChatMessage` model
        List<ChatMessage> chatMessages = filteredMessages
            .map((doc) =>
                ChatMessage.fromJson(doc.data() as Map<String, dynamic>))
            .toList();

        // Create and store a `ChatMessageResponse` object in `chatResponseModel`
        chatResponseModel.value = ChatMessageResponse(
          status: 200, // Assuming status is always 200 for a successful fetch
          data: chatMessages,
        );

        // Now you can work with the response, like displaying it in the UI
        print("Number of chat messages: ${chatMessages.length}");
        print("Stored messages: ${chatResponseModel.value.data?.length}");

        // Update the UI with the fetched chat messages
        chatMessages = chatResponseModel.value.data ?? [];
        isLoading.value = false; // Hide the loading indicator
        update(); // Trigger UI update
      } else {
        print("Error: UserId is empty ${userId.value}");
      }
    } catch (e) {
      // Hide loading and log the error
      isLoading.value = false;
      print('Error fetching chat data: $e');
    }

    update(); // Trigger a UI update after fetching messages
  }

  // Future<void> fetchMessages({String? receiverId}) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   userId.value = prefs.getString('loginUserId')!;
  //   print("this is data ${userId.value}");
  //
  //   try {
  //     chatListModel.value = MessageModelResponse(status: 200, data: []);
  //     isMessageLoading.value = true;
  //     // Query Firestore for messages where senderId and receiverId match the userId
  //     final senderQuery = await FirebaseFirestore.instance
  //         .collection('chats')
  //         .where('senderId', isEqualTo: userId.value)
  //         .where('receiverId', isEqualTo: receiverId)
  //         .orderBy('timestamp', descending: true)
  //         .get();
  //
  //     // Query Firestore for messages where receiverId matches userId
  //     final receiverQuery = await FirebaseFirestore.instance
  //         .collection('chats')
  //         .where('senderId', isEqualTo: receiverId)
  //         .where('receiverId', isEqualTo: userId.value)
  //         .orderBy('timestamp', descending: true)
  //         .get();
  //
  //     // Combine the results and remove duplicates based on document ID
  //     final allDocs = {...senderQuery.docs, ...receiverQuery.docs}; // Using a Set to remove duplicates
  //
  //     // Map the result to your model and display
  //     final messages = allDocs.map((doc) {
  //       return MessageModel.fromJson(doc.data() as Map<String, dynamic>);
  //     }).toList();
  //
  //     print("this is hudai mesg $messages");
  //
  //     // Update the chatListModel with the new unique messages
  //     // chatListModel.value.data?.clear();
  //     chatListModel.value = MessageModelResponse(
  //       status: 200, // assuming status is always 200 for successful fetch
  //       data: messages,
  //     );
  //     isMessageLoading.value = false;
  //
  //   } catch (e) {
  //     isMessageLoading.value = false;
  //     print('Error fetching messages: $e');
  //   }
  //
  //   update(); // Notify UI of changes
  // }

  Stream<List<QueryDocumentSnapshot>> fetchMessages(
      {required String receiverId}) {
    print("this is receiverId $receiverId");
    final senderStream = FirebaseFirestore.instance
        .collection('chats')
        .where('senderId', isEqualTo: userId.value)
        .where('receiverId', isEqualTo: receiverId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs);

    final receiverStream = FirebaseFirestore.instance
        .collection('chats')
        .where('senderId', isEqualTo: receiverId)
        .where('receiverId', isEqualTo: userId.value)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs);

    return rx.Rx.combineLatest2(
      senderStream,
      receiverStream,
      (List<QueryDocumentSnapshot> senderDocs,
          List<QueryDocumentSnapshot> receiverDocs) {
        final allDocs = <QueryDocumentSnapshot>{};
        allDocs.addAll(senderDocs);
        allDocs.addAll(receiverDocs);

        // Sort documents by timestamp
        allDocs.toList().sort((a, b) {
          final timestampA = a['timestamp'] as Timestamp;
          final timestampB = b['timestamp'] as Timestamp;
          return timestampA.compareTo(timestampB);
        });

        return allDocs.toList();
      },
    );
  }

  Future<void> sendMessage({MessageModel? item}) async {
    CollectionReference chats = FirebaseFirestore.instance.collection('chats');
    Map<String, dynamic> providerData = {
      'senderId': item?.senderId ?? '',
      'senderImage': item?.senderImage ?? '',
      'senderName': item?.senderName ?? '',
      'receiverId': item?.receiverId ?? '',
      'receiverImage': item?.receiverImage ?? '',
      'receiverName': item?.receiverName ?? '',
      'message': messageController.value.text,
      'timestamp': DateTime.now(),
    };
    chats.add(providerData).then((value) {
      print("User Added");
      successToast(
          context: navigatorKey.currentContext!,
          msg: "User successfully added");
      // fetchMessages();
      fetchLastMessages();
    }).catchError((error) {
      print("Failed to add user: $error");
      errorToast(
          context: navigatorKey.currentContext!,
          msg: "Failed to add user: $error");
    });
  }

  Future<void> pickImageCamera({required String receiverId, required String image}) async {
    if (await Permission.storage.request().isGranted) {
      final XFile? pickedFile =
      await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        pickedImage.value = File(pickedFile.path);
        imageBase64.value = base64Encode(
            pickedImage.value.readAsBytesSync());
        Navigator.pop(navigatorKey.currentContext!);
        print(pickedImage);
        showGeneralDialog(
          context: navigatorKey.currentContext!,
          barrierDismissible: true,
          barrierLabel: 'Close',
          barrierColor: Colors.black54, // Darkens the background
          transitionDuration: Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) {
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: SafeArea(
                child: Stack(
                  children: [
                    // Display the picked image in full screen
                    Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: Image.file(
                              pickedImage.value,
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.height * 0.3,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomTextTextfieldColumn(
                                  text: "",
                                  hint: "Enter message",
                                  textEditingController:
                                  messageController.value,
                                ),
                              ),
                              5.pw,
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: InkWell(
                                  onTap: () async {
                                    if (messageController
                                        .value.text.isNotEmpty) {
                                      fs.collection('chats').doc().set({
                                        'senderId': chatResponseModel
                                            .value.data?.first.senderId ??
                                            '',
                                        'senderImage': chatResponseModel.value
                                            .data?.first.senderImage ??
                                            '',
                                        'senderName': chatResponseModel
                                            .value.data?.first.senderName ??
                                            '',
                                        'receiverId': receiverId,
                                        'receiverImage': image,
                                        'receiverName': name,
                                        'message': messageController.value.text,
                                        'imageBase64': imageBase64.value,
                                        'timestamp': DateTime.now(),
                                      });
                                      // Navigator.pop(context);
                                      messageController.value.clear();
                                      await sendNotificationToUser(
                                        receiverId,
                                        'New Message from ${chatResponseModel.value.data?.first.senderName ?? 'Someone'}',
                                        messageController.value.text,
                                      );
                                    } else {
                                      errorToast(
                                          context: context,
                                          msg: "Please enter text");
                                    }
                                  },
                                  child: Icon(
                                    Icons.send,
                                    color: AppColors.appColors,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        10.ph,
                      ],
                    ),
                    // Close button at the top right corner
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.white, size: 30),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        update();
      }
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      await Permission.storage.request();
    }
    update();
  }

  Future<void> pickImageFromGallery(
      {required String receiverId, required String image}) async {


    update();
  }

  Future<void> sendNotificationToUser(
      String userId, String title, String body) async {
    // Fetch the user's FCM token from Firestore using the userId
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('fcmToken')
        .doc(userId)
        .get();
    print("userDocASWDAS ${userId}");
    if (userId.toString().isNotEmpty) {
      String? fcmToken = userDoc['fcmToken'];
      print("FCM token for user $userId: $fcmToken");

      if (fcmToken != null) {
        await sendPushNotification(
          fcmToken: fcmToken,
          title: title,
          body: body,
          receiverId: userId,
        );
      } else {
        print("No FCM token found for user: $userId");
      }
    } else {
      print("User document not found: $userId");
    }
  }

  Future<void> sendPushNotification({
    required String fcmToken,
    required String title,
    required String body,
    required String receiverId,
  }) async {
    GetServiceKey getServerKey = GetServiceKey();
    String serverKey = await getServerKey.getServiceKeyToken();
    print("Server Key: $serverKey");

    try {
      var response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverKey',
        },
        body: jsonEncode({
          'to': fcmToken,
          'priority': 'high',
          'notification': {
            'title': title,
            'body': body,
          },
          'data': {
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'body': body,
            'title': title,
            'status': 'done',
          },
        }),
      );
      print("response ${response.body}");
      if (response.statusCode == 200) {
        print("Notification sent successfully.");
      } else {
        print(
            "Failed to send notification. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error sending notification: $e");
    }
  }
}
