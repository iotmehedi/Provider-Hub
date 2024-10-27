import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/inbox_page/model/messageModel.dart';
import 'package:provider_hub/features/screens/message_screen/presentation/get_service/get_service_key.dart';
import '../../../../../const/utils/consts/app_colors.dart';
import '../../../../../main.dart';
import '../../../../widget/custom_text_textfield_column/custom_text_textfield_column.dart';
import '../../../../widget/custom_toast/custom_toast.dart';
import '../../model/chat_model.dart';
import 'package:rxdart/rxdart.dart' as rx;
import 'package:image_picker/image_picker.dart';
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

  final ImagePicker _picker = ImagePicker();
  var imageBase64 = ''.obs;
  var pickedImage = File('').obs;
  final FirebaseFirestore fs = FirebaseFirestore.instance;
  @override
  void onInit() {
    fetchLastMessages();
    super.onInit();
  }

  Future<void> pickImageFromGallery(
      String receiverId, String image, String name) async {
    if (await Permission.storage.request().isGranted) {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        pickedImage.value = File(pickedFile.path);
        int imageSize = pickedImage.value.lengthSync();

        // Convert to MB (1 MB = 1024 * 1024 bytes)
        double imageSizeInMB = imageSize / (1024 * 1024);
        if (imageSizeInMB > 1) {
          // Show a toast message if the file is larger than 1MB
          errorToast(
              context: navigatorKey.currentContext!,
              msg: "Image size should less than 1 mb");
        } else {
          imageBase64.value = base64Encode(pickedImage.value.readAsBytesSync());
          showFullScreenDialog(navigatorKey.currentContext!, receiverId, image,
              name); // Convert image to base64
          print(imageBase64);
        }
      }
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      await Permission.storage.request();
    }
  }

// Pick image from camera
  Future<void> pickImageFromCamera(
      String receiverId, String image, String name) async {
    if (await Permission.storage.request().isGranted) {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        pickedImage.value = File(pickedFile.path);
        pickedImage.value = File(pickedFile.path);
        int imageSize = pickedImage.value.lengthSync();

        // Convert to MB (1 MB = 1024 * 1024 bytes)
        double imageSizeInMB = imageSize / (1024 * 1024);
        if (imageSizeInMB > 1) {
          // Show a toast message if the file is larger than 1MB
          errorToast(
              context: navigatorKey.currentContext!,
              msg: "Image size should less than 1 mb");
        } else {
          imageBase64.value = base64Encode(pickedImage.value.readAsBytesSync());
          showFullScreenDialog(
              navigatorKey.currentContext!, receiverId, image, name);
        }
      }
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      await Permission.storage.request();
    }
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
        // Query Firestore for messages where senderId or receiverId matches the logged-in user
        final senderQuery = await FirebaseFirestore.instance
            .collection('chats')
            .where('senderId', isEqualTo: userId.value)
            .orderBy('timestamp', descending: true)
            .get();

        final receiverQuery = await FirebaseFirestore.instance
            .collection('chats')
            .where('receiverId', isEqualTo: userId.value)
            .orderBy('timestamp', descending: true)
            .get();

        // Combine both results into one list
        final combinedMessages = [...senderQuery.docs, ...receiverQuery.docs];

        print("Total messages fetched: ${combinedMessages.length}");

        // Map to store only the last message for each unique conversation pair
        Map<String, QueryDocumentSnapshot> lastMessagesMap = {};

        // Iterate through combined messages to keep only the last message for each unique pair
        for (var doc in combinedMessages) {
          final senderId = doc['senderId'];
          final receiverId = doc['receiverId'];
          final timestamp = (doc['timestamp'] as Timestamp).toDate();

          // Create a unique key for each conversation pair (regardless of order)
          final key = senderId.hashCode <= receiverId.hashCode
              ? "$senderId-$receiverId"
              : "$receiverId-$senderId";

          // Store only the latest message for each unique pair (based on timestamp)
          if (!lastMessagesMap.containsKey(key)) {
            lastMessagesMap[key] = doc; // Add if no message exists for the pair
          } else {
            // Compare timestamps, and keep the latest one
            final existingTimestamp =
                (lastMessagesMap[key]!['timestamp'] as Timestamp).toDate();
            if (timestamp.isAfter(existingTimestamp)) {
              lastMessagesMap[key] = doc;
            }
          }
        }

        // Convert the last messages to the `ChatMessage` model
        List<ChatMessage> chatMessages = lastMessagesMap.values
            .map((doc) =>
                ChatMessage.fromJson(doc.data() as Map<String, dynamic>))
            .toList();

        // Store the last messages in the `chatResponseModel`
        chatResponseModel.value = ChatMessageResponse(
          status: 200, // Assuming status is always 200 for a successful fetch
          data: chatMessages,
        );

        // Display the number of unique conversations and last messages
        print("Number of unique conversations: ${chatMessages.length}");
        print("Stored last messages: ${chatResponseModel.value.data?.length}");

        // Update the UI with the fetched chat messages
        isLoading.value = false;
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
    print(
        "this is receiverId $receiverId, userId: ${userId.value}, loginUserId: ${box.read("loginUserId")}");

    // Stream where the current user is the sender and the other user is the receiver
    final senderStream = FirebaseFirestore.instance
        .collection('chats')
        .where('senderId', isEqualTo: userId.value)
        .where('receiverId', isEqualTo: receiverId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs);

    // Stream where the current user is the receiver and the other user is the sender
    final receiverStream = FirebaseFirestore.instance
        .collection('chats')
        .where('senderId', isEqualTo: receiverId)
        .where('receiverId', isEqualTo: userId.value)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs);

    // Combine both streams
    return rx.Rx.combineLatest2(
      senderStream,
      receiverStream,
      (List<QueryDocumentSnapshot> senderDocs,
          List<QueryDocumentSnapshot> receiverDocs) {
        final allDocs = <QueryDocumentSnapshot>[];
        allDocs.addAll(senderDocs);
        allDocs.addAll(receiverDocs);

        // Sort all documents by timestamp in ascending order
        allDocs.sort((a, b) {
          final timestampA = (a['timestamp'] as Timestamp).toDate();
          final timestampB = (b['timestamp'] as Timestamp).toDate();
          return timestampA.compareTo(timestampB);
        });

        return allDocs;
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

  void showFullScreenDialog(
      BuildContext context, String receiverId, String image, String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor:
              Colors.transparent, // Make the background transparent
          insetPadding:
              EdgeInsets.all(0), // Remove any padding around the dialog
          child: SizedBox.expand(
            child: Container(
              color: AppColors
                  .backgroundColor, // Background color of the full-screen dialog
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.file(
                          pickedImage.value,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomTextTextfieldColumn(
                                text: "",
                                hint: "Enter message",
                                textEditingController: messageController.value,
                              ),
                            ),
                            5.pw,
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: InkWell(
                                onTap: () async {
                                  // controller.sendMessage(
                                  //     item:
                                  //     controller.chatListModel.value.data?.first);
                                  if (messageController.value.text.isNotEmpty) {
                                    fs.collection('chats').doc().set({
                                      'senderId': chatResponseModel
                                              .value.data?.first?.senderId ??
                                          '',
                                      'senderImage': chatResponseModel
                                              .value.data?.first?.senderImage ??
                                          '',
                                      'senderName': chatResponseModel
                                              .value.data?.first?.senderName ??
                                          '',
                                      'receiverId': receiverId,
                                      'receiverImage': image,
                                      'receiverName': name,
                                      'imageBase64': imageBase64.value,
                                      'message': messageController.value.text,
                                      'timestamp': DateTime.now(),
                                    });

                                    messageController.value.clear();
                                    await sendNotificationToUser(
                                      receiverId, // User ID of the receiver
                                      'New Message from ${chatResponseModel.value.data?.first?.senderName ?? 'Someone'}',
                                      messageController.value.text,
                                    );
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
                    ],
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.red, size: 30),
                      onPressed: () {
                        Navigator.pop(
                            context); // Close dialog when the cross is pressed
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> sendNotificationToUser(
      String userId, String title, String body) async {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    String? fcmToken = userDoc['fcmToken'];

    if (fcmToken != null) {
      await sendPushNotification(
        fcmToken: fcmToken,
        title: title,
        body: body,
      );
    } else {
      print("No FCM token found for this user.");
    }
  }

  Future<void> sendPushNotification({
    required String fcmToken,
    required String title,
    required String body,
  }) async {
    final Future<String> serverKey = GetServiceKey()
        .getServiceKeyToken(); // Replace with your FCM server key
    final deviceToken = await FirebaseMessaging.instance.getToken();
    print('fcmToken: ${fcmToken}');
    try {
      var response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverKey',
        },
        body: jsonEncode({
          'message': deviceToken, // Send to specific user's FCM token
          'notification': {
            'title': title,
            'body': body,
          },
          'data': {
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done',
          },
        }),
      );

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
