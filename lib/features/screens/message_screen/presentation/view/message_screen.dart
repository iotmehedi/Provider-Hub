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
                height: MediaQuery.of(context).size.height * 0.75,
                child: MessageWidget(controller: controller, senderid: controller.userId.value, receiverId: receiverId)),
            10.ph,
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: IconButton(onPressed: (){
                      _showBottomDialog(context, receiverId, image, name);
                    }, icon: Icon(Icons.add_circle_outlined, size: 30,)),
                  ),
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
                            'imageBase64': controller.imageBase64.value,
                            'message': controller.messageController.value.text,
                            'timestamp': DateTime.now(),
                          });

                          controller.messageController.value.clear();
                          await controller.sendNotificationToUser(
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
  void _showBottomDialog(BuildContext context, String receiverId, String image, String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Material(
              type: MaterialType.transparency,
              color: AppColors.backgroundColor,
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                            controller.pickImageFromGallery(receiverId, image, name);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(500),
                              color: AppColors.appColors,
                            ),
                            child: Center(
                              child: Icon(Icons.photo, color: AppColors.white,),
                            ),
                          ),
                        ),
                        10.pw,
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                            controller.pickImageFromCamera(receiverId, image, name);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(500),
                              color: AppColors.appColors,
                            ),
                            child: Center(
                              child: Icon(Icons.photo_camera, color: AppColors.white,),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }


}
