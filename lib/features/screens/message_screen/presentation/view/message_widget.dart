import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/inbox_page/presentation/controller/controller.dart';

import '../../../../../const/utils/consts/app_assets.dart';
import '../../../../../const/utils/consts/app_colors.dart';
import '../../../../../const/utils/consts/app_sizes.dart';
import '../../../../widget/custom_simple_text/custom_simple_text.dart';

class MessageWidget extends StatelessWidget {
  final InboxController controller;
  final String senderid, receiverId;
  MessageWidget(
      {super.key,
      required this.controller,
      required this.senderid,
      required this.receiverId});
  final Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('chats')
      .orderBy('timestamp')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<QueryDocumentSnapshot>>(
      stream: controller.fetchMessages(receiverId: receiverId),
      builder: (BuildContext context,
          AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
        if (snapshot.hasError) {
          return const CustomSimpleText(
            text: "Something went wrong",
            color: Colors.white,
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final messages = snapshot.data;

        if (messages == null || messages.isEmpty) {
          return const Center(
              child: CustomSimpleText(
                  text: "No messages found",
                  color: Colors.white,
                  alignment: Alignment.center));
        }
        messages.sort((a, b) {
          final timestampA = a['timestamp']?.toDate();
          final timestampB = b['timestamp']?.toDate();
          return timestampA.compareTo(timestampB);
        });
        return ListView.builder(
          itemCount: messages.length,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          reverse: false,
          primary: true,
          itemBuilder: (_, index) {
            final qs = messages[index];
            final timestamp = qs['timestamp']?.toDate();
            final message = qs['message'] ?? '';
            final senderImage = qs['senderImage'] ?? '';
            final receiverImage = qs['receiverImage'] ?? '';
            final imageBase64 = qs['imageBase64'] ?? '';
            Uint8List bytes = base64Decode(imageBase64);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  10.ph,
                  Visibility(
                    visible: controller.userId.value == qs['receiverId'],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: SizedBox(
                              height: AppSizes.newSize(3.0),
                              width: AppSizes.newSize(3.0),
                              child: imageBase64?.isEmpty ?? false
                                  ? Icon(
                                      Icons.person,
                                      size: AppSizes.newSize(3.0),
                                      color: AppColors.white,
                                    )
                                  : Image.memory(
                                      base64Decode(receiverImage),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.appColors,
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      topLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, bottom: 10),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            bottom: 0,
                                            top: 10,
                                            right: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            imageBase64.toString().isNotEmpty &&
                                                    message
                                                ? SizedBox(
                                                    height: 60,
                                                    width: 60,
                                                    child: Column(
                                                      children: [
                                                        Image.memory(bytes),
                                                        5.ph,
                                                        CustomSimpleText(
                                                          text: message,
                                                          fontSize:
                                                              AppSizes.size15,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color:
                                                              AppColors.white,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : imageBase64
                                                        .toString()
                                                        .isNotEmpty
                                                    ? SizedBox(
                                                        height: 40,
                                                        width: 40,
                                                        child:
                                                            Image.memory(bytes),
                                                      )
                                                    : CustomSimpleText(
                                                        text: message,
                                                        fontSize:
                                                            AppSizes.size15,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: AppColors.white,
                                                      ),
                                            5.ph,
                                            CustomSimpleText(
                                              text:
                                                  "${timestamp?.hour ?? 0}:${timestamp?.minute ?? 0}",
                                              fontSize: AppSizes.size12,
                                              fontWeight: FontWeight.normal,
                                              color: AppColors.white
                                                  .withOpacity(0.4),
                                              alignment: Alignment.centerRight,
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Image.asset(
                                AppAssets.msg_arrow_blue,
                                height: 10,
                                width: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  30.ph,
                  Visibility(
                    visible: controller.userId.value == qs['senderId'],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 9.2),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: HexColor("565656").withOpacity(0.6),
                                    border: Border.all(
                                        color: AppColors.deepGrey
                                            .withOpacity(0.5)),
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          bottom: 10,
                                          top: 10,
                                          right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          imageBase64.toString().isNotEmpty &&
                                                  message
                                              ? SizedBox(
                                                  height: 60,
                                                  width: 60,
                                                  child: Column(
                                                    children: [
                                                      Image.memory(bytes),
                                                      5.ph,
                                                      CustomSimpleText(
                                                        text: message,
                                                        fontSize:
                                                            AppSizes.size15,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: AppColors.white,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : imageBase64
                                                      .toString()
                                                      .isNotEmpty
                                                  ? SizedBox(
                                                      height: 40,
                                                      width: 40,
                                                      child:
                                                          Image.memory(bytes),
                                                    )
                                                  : CustomSimpleText(
                                                      text: message,
                                                      fontSize: AppSizes.size15,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: AppColors.white,
                                                    ),
                                          5.ph,
                                          CustomSimpleText(
                                            text:
                                                "${timestamp?.hour ?? 0}:${timestamp?.minute ?? 0}",
                                            fontSize: AppSizes.size12,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.white
                                                .withOpacity(0.4),
                                            alignment: Alignment.centerRight,
                                            textAlign: TextAlign.end,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Image.asset(
                                AppAssets.msg_arrow_grey,
                                height: 10,
                                width: 10,
                                color: HexColor("565656").withOpacity(0.6),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: SizedBox(
                              height: AppSizes.newSize(3.0),
                              width: AppSizes.newSize(3.0),
                              child: senderImage.toString().isEmpty
                                  ? Icon(
                                      Icons.person,
                                      size: AppSizes.newSize(8.0),
                                      color: AppColors.white,
                                    )
                                  : Image.memory(
                                      base64Decode(senderImage),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
