import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_hub/const/utils/consts/app_assets.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/inbox_page/presentation/controller/controller.dart';
import 'package:provider_hub/features/screens/message_screen/presentation/controller/message_controller.dart';

import '../../../../../const/utils/consts/app_colors.dart';
import '../../../../../const/utils/consts/app_sizes.dart';
import '../../../../widget/custom_simple_text/custom_simple_text.dart';
import '../../../../widget/custom_text_textfield_column/custom_text_textfield_column.dart';
import '../../../nearest_provider/presentation/controller/controller.dart';
import 'message_widget.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});
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
                child: MessageWidget(controller: controller)),
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
                      onTap: () {
                        // controller.sendMessage(
                        //     item:
                        //     controller.chatListModel.value.data?.first);
                        if (controller.messageController.value.text.isNotEmpty) {
                          fs.collection('chats').doc().set({
                            'senderId':controller.chatListModel.value.data?.first?.senderId ?? '',
                            'senderImage': controller.chatListModel.value.data?.first?.senderImage ?? '',
                            'senderName': controller.chatListModel.value.data?.first?.senderName ?? '',
                            'receiverId': controller.chatListModel.value.data?.first?.receiverId ?? '',
                            'receiverImage': controller.chatListModel.value.data?.first?.receiverImage ?? '',
                            'receiverName': controller.chatListModel.value.data?.first?.receiverName ?? '',
                            'message': controller.messageController.value.text,
                            'timestamp': DateTime.now(),
                          });

                          controller.messageController.value.clear();
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
    // return Obx(() => Scaffold(
    //       backgroundColor: AppColors.backgroundColor,
    //       appBar: AppBar(
    //         iconTheme: IconThemeData(
    //           color: AppColors.white,
    //         ),
    //         backgroundColor: AppColors.backgroundColor,
    //         title: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             CustomSimpleText(
    //               text: (controller.chatListModel.value.data != null &&
    //                       controller.chatListModel.value.data!.isNotEmpty)
    //                   ? controller
    //                           .chatListModel.value.data!.first.receiverName ??
    //                       ''
    //                   : '', // Provide a default value or handle empty state
    //               fontSize: AppSizes.size24,
    //               color: AppColors.white,
    //             ),
    //             Icon(
    //               Icons.info_outline,
    //               size: 26.67,
    //               color: AppColors.white,
    //             ),
    //           ],
    //         ),
    //       ),
    //       body: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 10),
    //         child: Column(
    //           children: [
    //             Expanded(
    //               child: controller.isMessageLoading.value == true
    //                   ? const Center(
    //                       child: CircularProgressIndicator(),
    //                     )
    //                   : controller.chatListModel.value.data?.isEmpty ?? false
    //                       ? Center(
    //                           child: CustomSimpleText(
    //                             text: "Empty Message",
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: AppSizes.size20,
    //                             color: AppColors.white,
    //                             textAlign: TextAlign.center,
    //                             alignment: Alignment.center,
    //                           ),
    //                         )
    //                       : ListView.builder(
    //                           itemCount:
    //                               controller.chatListModel.value.data?.length,
    //                           reverse: true,
    //                           itemBuilder: (context, index) {
    //                             final message =
    //                                 controller.chatListModel.value.data?[index];
    //                             final isSender = message?.senderId ==
    //                                 controller.userId.value;
    //                             print(
    //                                 "the id is ${message?.senderId} ${controller.userId.value}");
    //                             return Padding(
    //                               padding: const EdgeInsets.symmetric(
    //                                   horizontal: 10),
    //                               child: Column(
    //                                 children: [
    //                                   10.ph,
    //                                   Visibility(
    //                                     visible:
    //                                         isSender == false ? true : false,
    //                                     child: Row(
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.start,
    //                                       crossAxisAlignment:
    //                                           CrossAxisAlignment.end,
    //                                       children: [
    //                                         Center(
    //                                           child: ClipRRect(
    //                                             borderRadius:
    //                                                 BorderRadius.circular(100),
    //                                             child: SizedBox(
    //                                               height: AppSizes.newSize(3.0),
    //                                               width: AppSizes.newSize(3.0),
    //                                               child: Image.memory(
    //                                                 base64Decode(message
    //                                                         ?.receiverImage ??
    //                                                     ''),
    //                                                 fit: BoxFit
    //                                                     .cover, // Adjust image display
    //                                               ),
    //                                             ),
    //                                           ),
    //                                         ),
    //                                         Padding(
    //                                           padding: const EdgeInsets.only(
    //                                               bottom: 10),
    //                                           child: Stack(
    //                                             alignment: Alignment.bottomLeft,
    //                                             children: [
    //                                               Padding(
    //                                                 padding:
    //                                                     const EdgeInsets.only(
    //                                                         left: 7),
    //                                                 child: Container(
    //                                                   decoration: BoxDecoration(
    //                                                     color:
    //                                                         AppColors.appColors,
    //                                                     borderRadius:
    //                                                         const BorderRadius
    //                                                             .only(
    //                                                       topRight:
    //                                                           Radius.circular(
    //                                                               8),
    //                                                       topLeft:
    //                                                           Radius.circular(
    //                                                               8),
    //                                                       bottomRight:
    //                                                           Radius.circular(
    //                                                               8),
    //                                                     ),
    //                                                   ),
    //                                                   child: Align(
    //                                                     alignment: Alignment
    //                                                         .bottomLeft,
    //                                                     child: Padding(
    //                                                       padding:
    //                                                           const EdgeInsets
    //                                                               .only(
    //                                                               left: 10,
    //                                                               bottom: 10),
    //                                                       child: Padding(
    //                                                         padding:
    //                                                             const EdgeInsets
    //                                                                 .only(
    //                                                                 left: 10,
    //                                                                 bottom: 0,
    //                                                                 top: 10,
    //                                                                 right: 20),
    //                                                         child:
    //                                                             CustomSimpleText(
    //                                                           text: message
    //                                                                   ?.message ??
    //                                                               '',
    //                                                           fontSize: AppSizes
    //                                                               .size15,
    //                                                           fontWeight:
    //                                                               FontWeight
    //                                                                   .normal,
    //                                                           color: AppColors
    //                                                               .white,
    //                                                         ),
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                               Image.asset(
    //                                                 AppAssets.msg_arrow_blue,
    //                                                 height: 10,
    //                                                 width: 10,
    //                                               ),
    //                                             ],
    //                                           ),
    //                                         )
    //                                       ],
    //                                     ),
    //                                   ),
    //                                   30.ph,
    //                                   Visibility(
    //                                     visible: isSender ? true : false,
    //                                     child: Row(
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.end,
    //                                       crossAxisAlignment:
    //                                           CrossAxisAlignment.end,
    //                                       children: [
    //                                         Padding(
    //                                           padding: const EdgeInsets.only(
    //                                               bottom: 10),
    //                                           child: Stack(
    //                                             alignment:
    //                                                 Alignment.bottomRight,
    //                                             children: [
    //                                               Padding(
    //                                                 padding:
    //                                                     const EdgeInsets.only(
    //                                                         right: 9.2),
    //                                                 child: Container(
    //                                                   decoration: BoxDecoration(
    //                                                     color: HexColor(
    //                                                             "565656")
    //                                                         .withOpacity(0.6),
    //                                                     border: Border.all(
    //                                                         color: AppColors
    //                                                             .deepGrey
    //                                                             .withOpacity(
    //                                                                 0.5)),
    //                                                     borderRadius:
    //                                                         const BorderRadius
    //                                                             .only(
    //                                                       topRight:
    //                                                           Radius.circular(
    //                                                               8),
    //                                                       topLeft:
    //                                                           Radius.circular(
    //                                                               8),
    //                                                       bottomLeft:
    //                                                           Radius.circular(
    //                                                               8),
    //                                                     ),
    //                                                   ),
    //                                                   child: Align(
    //                                                     alignment: Alignment
    //                                                         .bottomLeft,
    //                                                     child: Padding(
    //                                                       padding:
    //                                                           const EdgeInsets
    //                                                               .only(
    //                                                               left: 10,
    //                                                               bottom: 10,
    //                                                               top: 10,
    //                                                               right: 10),
    //                                                       child:
    //                                                           CustomSimpleText(
    //                                                         text: message
    //                                                                 ?.message ??
    //                                                             '',
    //                                                         fontSize:
    //                                                             AppSizes.size15,
    //                                                         fontWeight:
    //                                                             FontWeight
    //                                                                 .normal,
    //                                                         color:
    //                                                             AppColors.white,
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                               Image.asset(
    //                                                 AppAssets.msg_arrow_grey,
    //                                                 height: 10,
    //                                                 width: 10,
    //                                                 color: HexColor("565656")
    //                                                     .withOpacity(0.6),
    //                                               ),
    //                                             ],
    //                                           ),
    //                                         ),
    //                                         Center(
    //                                           child: ClipRRect(
    //                                             borderRadius:
    //                                                 BorderRadius.circular(100),
    //                                             child: SizedBox(
    //                                               height: AppSizes.newSize(3.0),
    //                                               width: AppSizes.newSize(3.0),
    //                                               child: Image.memory(
    //                                                 base64Decode(
    //                                                     message?.senderImage ??
    //                                                         ''),
    //                                                 fit: BoxFit
    //                                                     .cover, // Adjust image display
    //                                               ),
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   )
    //                                 ],
    //                               ),
    //                             );
    //                           },
    //                         ),
    //             ),
    //             10.ph,
    //             Padding(
    //               padding: const EdgeInsets.only(bottom: 10),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Expanded(
    //                     child: CustomTextTextfieldColumn(
    //                       text: "",
    //                       hint: "Enter message",
    //                       textEditingController:
    //                           controller.messageController.value,
    //                     ),
    //                   ),
    //                   5.pw,
    //                   Padding(
    //                     padding: const EdgeInsets.only(top: 20),
    //                     child: InkWell(
    //                       onTap: () {
    //                         controller.sendMessage(
    //                             item:
    //                                 controller.chatListModel.value.data?.first);
    //                       },
    //                       child: Icon(
    //                         Icons.send,
    //                         color: AppColors.appColors,
    //                       ),
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ));
  }
}
