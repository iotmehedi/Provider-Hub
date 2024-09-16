import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/inbox_page/presentation/controller/controller.dart';

import '../../../../../const/utils/consts/app_assets.dart';
import '../../../../../const/utils/consts/app_colors.dart';
import '../../../../../const/utils/consts/app_sizes.dart';
import '../../../../widget/custom_simple_text/custom_simple_text.dart';
class MessageWidget extends StatelessWidget {
  final InboxController controller;
   MessageWidget({super.key, required this.controller});
  final Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('chats')
      .orderBy('timestamp')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _messageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }

        return ListView.builder(
          itemCount: snapshot.data?.docs.length,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          primary: true,
          itemBuilder: (_, index) {
            QueryDocumentSnapshot<Object?>? qs = snapshot.data?.docs[index];
            var t = qs?['timestamp'] ;
            var d = t?.toDate();

            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10),
              child: Column(
                children: [
                  10.ph,
                  Visibility(
                    visible:
                    controller.userId.value == qs?['receiverId'] ? true : false,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(100),
                            child: SizedBox(
                              height: AppSizes.newSize(3.0),
                              width: AppSizes.newSize(3.0),
                              child: Image.memory(
                                base64Decode(qs?['receiverImage'] ?? ''),
                                fit: BoxFit
                                    .cover, // Adjust image display
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 10),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(
                                    left: 7),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                    AppColors.appColors,
                                    borderRadius:
                                    const BorderRadius
                                        .only(
                                      topRight:
                                      Radius.circular(
                                          8),
                                      topLeft:
                                      Radius.circular(
                                          8),
                                      bottomRight:
                                      Radius.circular(
                                          8),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment
                                        .bottomLeft,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets
                                          .only(
                                          left: 10,
                                          bottom: 10),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets
                                            .only(
                                            left: 10,
                                            bottom: 0,
                                            top: 10,
                                            right: 20),
                                        child:
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            CustomSimpleText(
                                              text: qs?['message'] ?? '',
                                              fontSize: AppSizes
                                                  .size15,
                                              fontWeight:
                                              FontWeight
                                                  .normal,
                                              color: AppColors
                                                  .white,
                                            ),
                                            5.ph,
                                            CustomSimpleText(
                                              text: "${d?.hour ?? 0}:${d?.minute ?? 0}",
                                              fontSize: AppSizes
                                                  .size12,
                                              fontWeight:
                                              FontWeight
                                                  .normal,
                                              color: AppColors
                                                  .white.withOpacity(0.4),
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
                    visible: controller.userId.value == (qs?['senderId'] ?? '') ? true : false,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.end,
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 10),
                          child: Stack(
                            alignment:
                            Alignment.bottomRight,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(
                                    right: 9.2),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: HexColor(
                                        "565656")
                                        .withOpacity(0.6),
                                    border: Border.all(
                                        color: AppColors
                                            .deepGrey
                                            .withOpacity(
                                            0.5)),
                                    borderRadius:
                                    const BorderRadius
                                        .only(
                                      topRight:
                                      Radius.circular(
                                          8),
                                      topLeft:
                                      Radius.circular(
                                          8),
                                      bottomLeft:
                                      Radius.circular(
                                          8),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment
                                        .bottomLeft,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets
                                          .only(
                                          left: 10,
                                          bottom: 10,
                                          top: 10,
                                          right: 10),
                                      child:Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          CustomSimpleText(
                                            text: qs?['message'] ?? '',
                                            fontSize: AppSizes
                                                .size15,
                                            fontWeight:
                                            FontWeight
                                                .normal,
                                            color: AppColors
                                                .white,
                                          ),
                                          5.ph,
                                          CustomSimpleText(
                                            text: "${d?.hour ?? 0}:${d?.minute ?? 0}",
                                            fontSize: AppSizes
                                                .size12,
                                            fontWeight:
                                            FontWeight
                                                .normal,
                                            color: AppColors
                                                .white.withOpacity(0.4),
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
                                color: HexColor("565656")
                                    .withOpacity(0.6),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(100),
                            child: SizedBox(
                              height: AppSizes.newSize(3.0),
                              width: AppSizes.newSize(3.0),
                              child: Image.memory(
                                base64Decode(qs?['senderImage'] ?? ''),
                                fit: BoxFit
                                    .cover, // Adjust image display
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
