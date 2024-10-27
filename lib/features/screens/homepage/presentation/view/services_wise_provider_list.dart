import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_hub/const/routes/route_name.dart';
import 'package:provider_hub/const/routes/router.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/authentication/signin/controller/controller.dart';
import 'package:provider_hub/features/screens/inbox_page/presentation/controller/controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';
import 'package:provider_hub/main.dart';

class ProviderListScreen extends StatefulWidget {
  final String service, type, serviceType;

  const ProviderListScreen({Key? key, required this.service, required this.type, required this.serviceType}) : super(key: key);

  @override
  _ProviderListScreenState createState() => _ProviderListScreenState();
}

class _ProviderListScreenState extends State<ProviderListScreen> {
  List<QueryDocumentSnapshot> providers = [];
  bool isLoading = true;
  var signinController = Get.put(SigninController());
  var indexController = Get.put(InboxController());
  @override
  void initState() {
    super.initState();
    getProvidersByService(widget.service);
  }

  Future<void> getProvidersByService(String service) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('type', isEqualTo: widget.type)
          .where(widget.serviceType, arrayContains: service)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          providers = querySnapshot.docs;
        });
      } else {
        print("No providers found for $service");
      }
    } catch (e) {
      print("Error retrieving providers: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: widget.service,
        textColor: AppColors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : providers.isEmpty
              ? Center(child:CustomSimpleText(
        text: 'No providers found for ${widget.service}',
        fontSize: AppSizes.size16,
        fontWeight: FontWeight.normal,
        color: AppColors.white,
        alignment: Alignment.center,
        textAlign: TextAlign.center,
      ), )
              : ListView.builder(
                  itemCount: providers.length,
                  itemBuilder: (context, index) {
                    final provider = providers[index];
                    final providerName = widget.type == "provider"? provider['providerName'] : provider['fullName'];
                    final imageBase64 = provider['imageBase64'] ?? 'Unknown';
                    final id = provider['id'] ?? 'Unknown';
                    final type = provider['type'] ?? 'Unknown';
                    final services = (provider[widget.serviceType] as List).join(', ');
                    return InkWell(
                      onTap: (){
                        RouteGenerator.pushNamedSms(
                            context, Routes.serviceWiseProviderListProfile,
                            arguments: [provider, widget.serviceType, widget.type]);
                      },
                      child: Card(
                        elevation: 0.0,
                        color: AppColors.slightGrey.withOpacity(0.04),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: SizedBox(
                                    height: AppSizes.newSize(5.0),
                                    width: AppSizes.newSize(5.0),
                                    child: imageBase64?.isEmpty ?? false
                                        ? Icon(
                                            Icons.person,
                                            size: AppSizes.newSize(4.0),
                                            color: AppColors.white,
                                          )
                                        : Image.memory(
                                            base64Decode(imageBase64 ?? ''),
                                            fit: BoxFit
                                                .cover, // Adjust image display
                                          ),
                                  ),
                                ),
                              ),
                              10.pw,
                              Expanded(
                                child: Column(
                                  children: [
                                    CustomSimpleText(
                                      text: providerName,
                                      fontSize: AppSizes.size13,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.white,
                                      alignment: Alignment.centerLeft,
                                    ),
                                    5.ph,
                                    CustomSimpleText(
                                      text: services,
                                      fontSize: AppSizes.size13,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.white,
                                      alignment: Alignment.bottomLeft,
                                      textAlign: TextAlign.start,
                                    ),
                                    10.ph,
                                    box.read("isLoggedIn") != null && widget.type == "provider"
                                        ? SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.79,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                const Row(
                                                  children: [],
                                                ),
                                                box.read("isLoggedIn") &&
                                                        signinController
                                                                .providerModel
                                                                .value
                                                                .type ==
                                                            "provider"
                                                    ? const SizedBox.shrink()
                                                    : box.read("isLoggedIn") ==
                                                            null
                                                        ? const SizedBox.shrink()
                                                        : InkWell(
                                                            onTap: () async {
                                                              RouteGenerator
                                                                  .pushNamedSms(
                                                                      context,
                                                                      Routes
                                                                          .messageScreen,
                                                                      arguments: [
                                                                    id,
                                                                    imageBase64 ??
                                                                        '',
                                                                    providerName,
                                                                    type,
                                                                  ]);

                                                              await indexController
                                                                  .fetchMessages(
                                                                      receiverId:
                                                                          id ??
                                                                              '');

                                                              indexController
                                                                  .fetchLastMessages();
                                                            },
                                                            child: Container(
                                                              height: 22,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100),
                                                                  color: AppColors
                                                                      .appColors),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                child: Center(
                                                                    child:
                                                                        CustomSimpleText(
                                                                  text:
                                                                      "Send Message",
                                                                  fontSize:
                                                                      AppSizes
                                                                          .size11,
                                                                  color: AppColors
                                                                      .white,
                                                                )),
                                                              ),
                                                            ),
                                                          )
                                              ],
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                    // return ListTile(
                    //   title: Text(providerName),
                    //   subtitle: Text(services),
                    // );
                  },
                ),
    );
  }
}
