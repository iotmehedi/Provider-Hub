import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:photo_view/photo_view.dart';
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

        return ListView.builder(
          itemCount: messages.length,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          reverse: true,
          primary: true,
          itemBuilder: (_, index) {
            final qs = messages[index];
            final timestamp = qs['timestamp']?.toDate();
            final message = qs['message'] ?? '';
            final senderImage = qs['senderImage'] ?? '';
            final receiverImage = qs['receiverImage'] ?? '';
            // final Image = qs['Image'] ?? '';
            Map<String, dynamic>? data = qs.data() as Map<String, dynamic>?;
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
                              child: Image.memory(
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
                                            data != null && data.containsKey('Image') && data['Image'].toString().isNotEmpty && message.toString().isNotEmpty
                                                ? Container(
                                              color: Colors.black12,
                                              child: Column(
                                                children: [
                                                  Center(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(10),
                                                      child: SizedBox(
                                                        height: AppSizes
                                                            .newSize(5.0),
                                                        width: AppSizes
                                                            .newSize(5.0),
                                                        child: Image.memory(
                                                          base64Decode(
                                                              senderImage),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  10.ph,
                                                  CustomSimpleText(
                                                    text: message,
                                                    fontSize:
                                                    AppSizes.size15,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                    color: AppColors.white,
                                                  ),
                                                ],
                                              ),
                                            )
                                                : CustomSimpleText(
                                              text: message,
                                              fontSize: AppSizes.size15,
                                              fontWeight: FontWeight.normal,
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
                                           if((data?['imageBase64'] != null) && message.toString().isNotEmpty)
                                               Container(
                                                  // color: Colors.black12,
                                                  child: Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: (){
                                                          showDialog(
                                                              context: context,
                                                              builder: (context) => PhotoView(
                                                                imageProvider: MemoryImage(
                                                                  base64Decode(data?['imageBase64'] ?? ''),
                                                                ),
                                                                // Optionally, you can add more properties like backgroundDecoration or loadingBuilder here
                                                              ));
                                                        },
                                                        child: Center(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(10),
                                                            child: SizedBox(
                                                              height: AppSizes
                                                                  .newSize(7.0),
                                                              width: AppSizes
                                                                  .newSize(8.0),
                                                              child: Image.memory(
                                                                base64Decode(
                                                                    data?['imageBase64']),
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      10.ph,
                                                      CustomSimpleText(
                                                        text: message,
                                                        fontSize:
                                                            AppSizes.size15,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: AppColors.white,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                           else if(message.toString().isNotEmpty)
                                                CustomSimpleText(
                                                  text: message,
                                                  fontSize: AppSizes.size15,
                                                  fontWeight: FontWeight.normal,
                                                  color: AppColors.white,
                                                )
                                          else
                                          Center(
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius
                                            .circular(10),
                                        child: SizedBox(
                                          height: AppSizes
                                              .newSize(5.0),
                                          width: AppSizes
                                              .newSize(5.0),
                                          child:  data?['imageBase64'] != null
                                              ? Image.memory(
                                            base64Decode(data!['imageBase64']),
                                            fit: BoxFit.cover,
                                          )
                                              : SizedBox(),

                                        ),
                                      ),
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
                              child: Image.memory(
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
