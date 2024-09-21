// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/inbox_page/presentation/controller/controller.dart';
import 'package:provider_hub/features/screens/message_screen/presentation/get_service/get_service_key.dart';

import '../../../../../const/utils/consts/app_colors.dart';
import '../../../../../const/utils/consts/app_sizes.dart';
import '../../../../widget/custom_simple_text/custom_simple_text.dart';
import '../../../../widget/custom_text_textfield_column/custom_text_textfield_column.dart';
import 'message_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class MessageScreen extends StatefulWidget {
  final String receiverId, image, name;
  MessageScreen(
      {super.key,
      required this.receiverId,
      required this.image,
      required this.name});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
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
                  ? controller.chatListModel.value.data!.first.receiverName ??
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
                child: MessageWidget(
                    controller: controller,
                    senderid: controller.userId.value,
                    receiverId: widget.receiverId)),
            10.ph,
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        onPressed: () {
                          // Show a custom dialog positioned 10px above the TextField
                          showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: 'Close',
                            barrierColor:
                                Colors.black54, // Optional: darkens background
                            transitionDuration: Duration(milliseconds: 200),
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return Align(
                                alignment: Alignment
                                    .bottomCenter, // Position at bottom
                                child: Container(
                                  margin: EdgeInsets.only(
                                    bottom: 60 +
                                        10, // Adjust to be 10px above the TextField
                                  ),
                                  height: 100,
                                  width: MediaQuery.of(context).size.width *
                                      0.9, // Set the desired height
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () async {

                                              if (!mounted) return;
                                              if (await Permission.storage
                                                  .request()
                                                  .isGranted) {
                                                final XFile? pickedFile =
                                                    await controller.picker
                                                        .pickImage(
                                                            source: ImageSource
                                                                .gallery);
                                                if (pickedFile != null) {
                                                  controller.pickedImage.value =
                                                      File(pickedFile.path);
                                                  controller.imageBase64.value =
                                                      base64Encode(controller
                                                          .pickedImage.value
                                                          .readAsBytesSync()); // Convert image to base64

                                                  Navigator.pop(context);
                                                  // Show a full-screen dialog after the image is picked
                                                  if(mounted){
                                                    showGeneralDialog(
                                                      context: context,
                                                      barrierDismissible: true,
                                                      barrierLabel: 'Close',
                                                      barrierColor: Colors
                                                          .black54, // Darkens the background
                                                      transitionDuration:
                                                      Duration(
                                                          milliseconds: 300),
                                                      pageBuilder: (context,
                                                          animation,
                                                          secondaryAnimation) {
                                                        return Scaffold(
                                                          backgroundColor:
                                                          AppColors
                                                              .backgroundColor,
                                                          body: SafeArea(
                                                            child: Stack(
                                                              children: [
                                                                // Display the picked image in full screen
                                                                Column(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                      Center(
                                                                        child: Image
                                                                            .file(
                                                                          controller
                                                                              .pickedImage
                                                                              .value,
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          width: MediaQuery.of(context).size.width *
                                                                              0.6,
                                                                          height: MediaQuery.of(context).size.height *
                                                                              0.3,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                          10),
                                                                      child: Row(
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                            CustomTextTextfieldColumn(
                                                                              text:
                                                                              "",
                                                                              hint:
                                                                              "Enter message",
                                                                              textEditingController:
                                                                              controller.messageController.value,
                                                                            ),
                                                                          ),
                                                                          5.pw,
                                                                          Padding(
                                                                            padding: const EdgeInsets
                                                                                .only(
                                                                                top: 20),
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () async {
                                                                                fs.collection('chats').doc().set({
                                                                                  'senderId': controller.chatResponseModel.value.data?.first.senderId ?? '',
                                                                                  'senderImage': controller.chatResponseModel.value.data?.first.senderImage ?? '',
                                                                                  'senderName': controller.chatResponseModel.value.data?.first.senderName ?? '',
                                                                                  'receiverId': widget.receiverId,
                                                                                  'receiverImage': widget.image,
                                                                                  'receiverName': widget.name,
                                                                                  'message': controller.messageController.value.text,
                                                                                  'imageBase64': controller.imageBase64.value,
                                                                                  'timestamp': DateTime.now(),
                                                                                });
                                                                                Navigator.pop(context);
                                                                                controller.messageController.value.clear();
                                                                                await controller.sendNotificationToUser(
                                                                                  widget.receiverId,
                                                                                  'New Message from ${controller.chatResponseModel.value.data?.first.senderName ?? 'Someone'}',
                                                                                  controller.messageController.value.text,
                                                                                );
                                                                              },
                                                                              child:
                                                                              Icon(
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
                                                                  child:
                                                                  IconButton(
                                                                    icon: Icon(
                                                                        Icons
                                                                            .close,
                                                                        color: Colors
                                                                            .white,
                                                                        size: 30),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }// Trigger UI updates
                                                }
                                              } else if (await Permission
                                                  .storage
                                                  .request()
                                                  .isPermanentlyDenied) {
                                                await openAppSettings();
                                              } else if (await Permission
                                                  .storage
                                                  .request()
                                                  .isDenied) {
                                                await Permission.storage
                                                    .request();
                                              }
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: AppColors.appColors,
                                              ),
                                              child: Icon(
                                                Icons.photo,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          10.pw,
                                          InkWell(
                                            onTap: () async {

                                              if (!mounted) return;
                                              if (await Permission.storage
                                                  .request()
                                                  .isGranted) {
                                                final XFile? pickedFile =
                                                    await controller.picker
                                                        .pickImage(
                                                            source: ImageSource
                                                                .camera);
                                                if (pickedFile != null) {
                                                  controller.pickedImage.value =
                                                      File(pickedFile.path);
                                                  controller.imageBase64.value =
                                                      base64Encode(controller
                                                          .pickedImage.value
                                                          .readAsBytesSync());
                                                  Navigator.pop(context);
                                                  print(controller.pickedImage);
                                                  if(mounted){
                                                    showGeneralDialog(
                                                      context: context,
                                                      barrierDismissible: true,
                                                      barrierLabel: 'Close',
                                                      barrierColor: Colors
                                                          .black54, // Darkens the background
                                                      transitionDuration:
                                                      Duration(
                                                          milliseconds: 300),
                                                      pageBuilder: (context,
                                                          animation,
                                                          secondaryAnimation) {
                                                        return Scaffold(
                                                          backgroundColor:
                                                          AppColors
                                                              .backgroundColor,
                                                          body: SafeArea(
                                                            child: Stack(
                                                              children: [
                                                                // Display the picked image in full screen
                                                                Column(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                      Center(
                                                                        child: Image
                                                                            .file(
                                                                          controller
                                                                              .pickedImage
                                                                              .value,
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          width: MediaQuery.of(context).size.width *
                                                                              0.6,
                                                                          height: MediaQuery.of(context).size.height *
                                                                              0.3,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                          10),
                                                                      child: Row(
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                            CustomTextTextfieldColumn(
                                                                              text:
                                                                              "",
                                                                              hint:
                                                                              "Enter message",
                                                                              textEditingController:
                                                                              controller.messageController.value,
                                                                            ),
                                                                          ),
                                                                          5.pw,
                                                                          Padding(
                                                                            padding: const EdgeInsets
                                                                                .only(
                                                                                top: 20),
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () async {
                                                                                fs.collection('chats').doc().set({
                                                                                  'senderId': controller.chatResponseModel.value.data?.first.senderId ?? '',
                                                                                  'senderImage': controller.chatResponseModel.value.data?.first.senderImage ?? '',
                                                                                  'senderName': controller.chatResponseModel.value.data?.first.senderName ?? '',
                                                                                  'receiverId': widget.receiverId,
                                                                                  'receiverImage': widget.image,
                                                                                  'receiverName': widget.name,
                                                                                  'message': controller.messageController.value.text,
                                                                                  'imageBase64': controller.imageBase64.value,
                                                                                  'timestamp': DateTime.now(),
                                                                                });
                                                                                Navigator.pop(context);
                                                                                controller.messageController.value.clear();
                                                                                await controller.sendNotificationToUser(
                                                                                  widget.receiverId,
                                                                                  'New Message from ${controller.chatResponseModel.value.data?.first.senderName ?? 'Someone'}',
                                                                                  controller.messageController.value.text,
                                                                                );
                                                                              },
                                                                              child:
                                                                              Icon(
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
                                                                  child:
                                                                  IconButton(
                                                                    icon: Icon(
                                                                        Icons
                                                                            .close,
                                                                        color: Colors
                                                                            .white,
                                                                        size: 30),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }
                                                }
                                              } else if (await Permission
                                                  .storage
                                                  .request()
                                                  .isPermanentlyDenied) {
                                                await openAppSettings();
                                              } else if (await Permission
                                                  .storage
                                                  .request()
                                                  .isDenied) {
                                                await Permission.storage
                                                    .request();
                                              }
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: AppColors.appColors,
                                              ),
                                              child: Icon(
                                                Icons.camera_alt,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.add_circle,
                          color: AppColors.appColors,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomTextTextfieldColumn(
                      text: "",
                      hint: "Enter message",
                      textEditingController: controller.messageController.value,
                    ),
                  ),
                  5.pw,
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      onTap: () async {
                        fs.collection('chats').doc().set({
                          'senderId': controller.chatResponseModel.value.data
                                  ?.first.senderId ??
                              '',
                          'senderImage': controller.chatResponseModel.value.data
                                  ?.first.senderImage ??
                              '',
                          'senderName': controller.chatResponseModel.value.data
                                  ?.first.senderName ??
                              '',
                          'receiverId': widget.receiverId,
                          'receiverImage': widget.image,
                          'receiverName': widget.name,
                          'message': controller.messageController.value.text,
                          'imageBase64': '',
                          'timestamp': DateTime.now(),
                        });

                        controller.messageController.value.clear();
                        await controller.sendNotificationToUser(
                          widget.receiverId,
                          'New Message from ${controller.chatResponseModel.value.data?.first.senderName ?? 'Someone'}',
                          controller.messageController.value.text,
                        );
                      },
                      child: Icon(
                        Icons.send,
                        color: AppColors.appColors,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
