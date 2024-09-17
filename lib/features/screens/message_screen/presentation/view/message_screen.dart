import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_hub/const/utils/consts/app_assets.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/authentication/model/provider_model.dart';
import 'package:provider_hub/features/screens/inbox_page/presentation/controller/controller.dart';
import 'package:provider_hub/features/screens/message_screen/presentation/controller/message_controller.dart';

import '../../../../../const/utils/consts/app_colors.dart';
import '../../../../../const/utils/consts/app_sizes.dart';
import '../../../../widget/custom_simple_text/custom_simple_text.dart';
import '../../../../widget/custom_text_textfield_column/custom_text_textfield_column.dart';
import '../../../nearest_provider/presentation/controller/controller.dart';
import 'message_widget.dart';
import 'package:http/http.dart' as http;
class MessageScreen extends StatelessWidget {
  final String receiverId, image, name;
  MessageScreen({super.key, required this.receiverId, required this.image, required this.name});
  var controller = Get.put(InboxController());
  final FirebaseFirestore fs = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
        backgroundColor: AppColors.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSimpleText(
              text: (controller.chatListModel.value.data != null &&
                  controller.chatListModel.value.data!.isNotEmpty)
                  ? controller
                  .chatListModel.value.data!.first.receiverName ??
                  ''
                  : '', // Provide a default value or handle empty state
              fontSize: AppSizes.size24,
              color: AppColors.white,
            ),
            Icon(
              Icons.info_outline,
              size: 26.67,
              color: AppColors.white,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.79,
                child: MessageWidget(controller: controller, senderid: controller.userId.value, receiverId: receiverId)),
            10.ph,
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomTextTextfieldColumn(
                      text: "",
                      hint: "Enter message",
                      textEditingController:
                      controller.messageController.value,
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
                        if (controller.messageController.value.text.isNotEmpty) {
                          fs.collection('chats').doc().set({
                            'senderId':controller.chatResponseModel.value.data?.first?.senderId ?? '',
                            'senderImage': controller.chatResponseModel.value.data?.first?.senderImage ?? '',
                            'senderName': controller.chatResponseModel.value.data?.first?.senderName ?? '',
                            'receiverId': receiverId,
                            'receiverImage': image,
                            'receiverName': name,
                            'message': controller.messageController.value.text,
                            'timestamp': DateTime.now(),
                          });

                          controller.messageController.value.clear();
                          await sendNotificationToUser(
                          receiverId, // User ID of the receiver
                          'New Message from ${controller.chatResponseModel.value.data?.first?.senderName ?? 'Someone'}',
                          controller.messageController.value.text,
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
      ),
    );

  }
  Future<void> sendNotificationToUser(String userId, String title, String body) async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
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
    final String serverKey = 'YOUR_SERVER_KEY_FROM_FIREBASE'; // Replace with your FCM server key

    try {
      var response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverKey',
        },
        body: jsonEncode({
          'to': fcmToken, // Send to specific user's FCM token
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
        print("Failed to send notification. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error sending notification: $e");
    }
  }
}
