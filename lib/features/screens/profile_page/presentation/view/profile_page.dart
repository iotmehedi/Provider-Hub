import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider_hub/const/utils/consts/app_assets.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/authentication/model/consultant_model.dart';
import 'package:provider_hub/features/screens/authentication/model/provider_model.dart';
import 'package:provider_hub/features/screens/authentication/model/qddp_model.dart';
import 'package:provider_hub/features/screens/authentication/model/userModel.dart';
import 'package:provider_hub/features/screens/authentication/signin/controller/controller.dart';
import 'package:provider_hub/features/screens/consultant_reg_screen/presentation/controller/consultant_controller.dart';
import 'package:provider_hub/features/screens/provider_registration_screen/registration_screen/presentation/controller/provider_reg_controller.dart';
import 'package:provider_hub/features/screens/qddp_reg_screen/presentation/controller/qddp_controller.dart';
import 'package:provider_hub/features/screens/trainer_reg_screen/presentation/controller/trainer_reg_controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';
import 'package:provider_hub/main.dart';

import '../../../../../const/routes/route_name.dart';
import '../../../../../const/routes/router.dart';
import '../../../../widget/custom_cached_network_inbox/custom_cached_network.dart';
import '../../../../widget/custom_text_textfield_column/custom_text_textfield_column.dart';
import '../../../inbox_page/presentation/controller/controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  var signinController = Get.put(SigninController());
  var indexController = Get.put(InboxController());
  var providerController = Get.put(ProviderRegController());
  var trainerController = Get.put(TrainerRegController());
  var consultantController = Get.put(ConsultantRegController());
  var qddpController = Get.put(QDDPRegController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: "Profile",
        needTitleCenter: false,
        textColor: AppColors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
        logoutButton: () {
          box.erase().then((value) {
            RouteGenerator.pushNamed(
                navigatorKey.currentContext!, Routes.splashScreenRouteName);
            Future.delayed(Duration(seconds: 1), () {
              signinController.providerModel.value = ProviderModel();
              signinController.userModel.value = UserModel();
              signinController.consultantModel.value = ConsultantModel();
              signinController.qddpModel.value = QDDPModel();
            });
          });
        },
      ),
      body: SingleChildScrollView(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      height: AppSizes.newSize(8.0),
                      width: AppSizes.newSize(8.0),
                      child: (signinController
                                      .providerModel.value.imageBase64?.isEmpty ??
                                  false) ||
                              (signinController
                                      .userModel.value.imageBase64?.isEmpty ??
                                  false) ||
                              (signinController.consultantModel.value
                                      .imageBase64?.isEmpty ??
                                  false) ||
                              (signinController
                                      .qddpModel.value.imageBase64?.isEmpty ??
                                  false)
                          ? Icon(
                              Icons.person,
                              size: AppSizes.newSize(8.0),
                              color: AppColors.white,
                            )
                          : Image.memory(
                              base64Decode(
                                (signinController.providerModel.value
                                            .imageBase64?.isNotEmpty ??
                                        false)
                                    ? signinController
                                            .providerModel.value.imageBase64 ??
                                        ''
                                    : (signinController.userModel.value
                                                .imageBase64?.isNotEmpty ??
                                            false)
                                        ? signinController
                                                .userModel.value.imageBase64 ??
                                            ''
                                        : (signinController
                                                    .consultantModel
                                                    .value
                                                    .imageBase64
                                                    ?.isNotEmpty ??
                                                false)
                                            ? signinController.consultantModel
                                                    .value.imageBase64 ??
                                                ''
                                            : (signinController
                                                        .qddpModel
                                                        .value
                                                        .imageBase64
                                                        ?.isNotEmpty ??
                                                    false)
                                                ? signinController.qddpModel
                                                        .value.imageBase64 ??
                                                    ''
                                                : '', // Fallback to empty string if none are available
                              ),
                              fit: BoxFit.cover, // Adjust image display
                            ),
                    ),
                  ),
                ),
                10.ph,
                CustomSimpleText(
                  text: signinController.providerModel.value.type == "provider"
                      ? signinController.providerModel.value.contactName ?? ''
                      : signinController.userModel.value.type == "trainer"
                          ? signinController.userModel.value.fullName ?? ''
                          : signinController.consultantModel.value.type ==
                                  "consultant"
                              ? signinController
                                      .consultantModel.value.fullName ??
                                  ''
                              : signinController.qddpModel.value.type == "qddp"
                                  ? signinController.qddpModel.value.fullName ??
                                      ''
                                  : '',
                  fontSize: AppSizes.size18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  alignment: Alignment.center,
                ),
                5.ph,
                Visibility(
                  visible: signinController.providerModel.value.type ==
                              "provider" ||
                          signinController.userModel.value.type == "trainer" ||
                          signinController.consultantModel.value.type ==
                              "consultant"
                      ? true
                      : false,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomSimpleText(
                          text: signinController.providerModel.value.type ==
                                  "provider"
                              ? (signinController.providerModel.value.service
                                      ?.join(', ') ??
                                  '')
                              : signinController.userModel.value.type ==
                                      "trainer"
                                  ? (signinController.userModel.value.training
                                          ?.join(', ') ??
                                      '')
                                  : signinController
                                              .consultantModel.value.type ==
                                          "consultant"
                                      ? (signinController
                                              .consultantModel.value.service
                                              ?.join(', ') ??
                                          '')
                                      : signinController.qddpModel.value.type ==
                                              "qddp"
                                          ? (signinController
                                                  .qddpModel.value.service
                                                  ?.join(', ') ??
                                              '')
                                          : '',
                          fontSize: AppSizes.size12,
                          fontWeight: FontWeight.normal,
                          color: AppColors.white,
                          alignment: Alignment.center,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Prepare selected services for the dialog
                          signinController.isClickedService.value = true;
                          if (signinController.providerModel.value.type ==
                              "provider") {
                            List<String> existingServices = List<String>.from(
                                signinController.providerModel.value.service ??
                                    []);
                            providerController.selectedServiceItems.value =
                                existingServices;
                          } else if (signinController.userModel.value.type ==
                              "trainer") {
                            List<String> existingServices = List<String>.from(
                                signinController.userModel.value.training ??
                                    []);
                            trainerController.selectedServiceItems.value =
                                existingServices;
                          } else if (signinController
                                  .consultantModel.value.type ==
                              "consultant") {
                            List<String> existingServices = List<String>.from(
                                signinController
                                        .consultantModel.value.service ??
                                    []);
                            consultantController.selectedServiceItems.value =
                                existingServices;
                          }
                          // Update selectedServiceItems with current services
                          // Set current selected items
                        },
                        icon: Icon(Icons.edit_note,
                            color: Colors.white, size: AppSizes.size18),
                      ),
                    ],
                  ),
                ),

                Obx(() => Visibility(
                      visible: signinController.isClickedService.value,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: MultiSelectDialogField(
                                items: signinController
                                            .providerModel.value.type ==
                                        "provider"
                                    ? providerController.items
                                    : signinController.userModel.value.type ==
                                            "trainer"
                                        ? trainerController.items
                                        : consultantController.items,
                                title: const Text("Choose Services"),
                                backgroundColor: AppColors.backgroundColor,
                                itemsTextStyle:
                                    const TextStyle(color: Colors.white),
                                checkColor: AppColors.white,
                                selectedColor: AppColors.appColors,
                                selectedItemsTextStyle:
                                    const TextStyle(color: Colors.white),
                                decoration: BoxDecoration(
                                  color: HexColor('80848A').withOpacity(0.35),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  border: Border.all(
                                    color: AppColors.appColors,
                                    width: 2,
                                  ),
                                ),
                                buttonIcon: Icon(
                                  Icons.supervised_user_circle_sharp,
                                  color: AppColors.white,
                                ),
                                buttonText: const Text(
                                  "Choose services",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                initialValue: signinController
                                            .providerModel.value.type ==
                                        "provider"
                                    ? providerController
                                        .selectedServiceItems.value
                                    : signinController.userModel.value.type ==
                                            "trainer"
                                        ? trainerController
                                            .selectedServiceItems.value
                                        : consultantController
                                            .selectedServiceItems
                                            .value, // Set initial selected values
                                onConfirm: (results) {
                                  // Ensure the existing services are of type String
                                  if (signinController
                                          .providerModel.value.type ==
                                      "provider") {
                                    List<String> existingServices =
                                        List<String>.from(signinController
                                                .providerModel.value.service ??
                                            []);

                                    // Cast new selections to List<String>
                                    List<String> newSelections =
                                        List<String>.from(results);

                                    // Merge existing selected items with new selections, ensuring uniqueness
                                    providerController
                                        .selectedServiceItems.value = <String>{
                                      ...newSelections,
                                    }.toList(); // Convert to Set to avoid duplicates

                                    // Update the provider model to include the new service list
                                    signinController.providerModel.value =
                                        signinController.providerModel.value
                                            .copyWith(
                                      service: providerController
                                          .selectedServiceItems
                                          .value, // Update the service list
                                    );
                                  } else if (signinController
                                          .userModel.value.type ==
                                      "trainer") {
                                    List<String> existingServices =
                                        List<String>.from(signinController
                                                .userModel.value.training ??
                                            []);

                                    // Cast new selections to List<String>
                                    List<String> newSelections =
                                        List<String>.from(results);

                                    // Merge existing selected items with new selections, ensuring uniqueness
                                    trainerController
                                        .selectedServiceItems.value = <String>{
                                      ...newSelections,
                                    }.toList(); // Convert to Set to avoid duplicates

                                    // Update the provider model to include the new service list
                                    signinController.userModel.value =
                                        signinController.userModel.value
                                            .copyWith(
                                      training: trainerController
                                          .selectedServiceItems
                                          .value, // Update the service list
                                    );
                                  } else if (signinController
                                          .consultantModel.value.type ==
                                      "consultant") {
                                    List<String> existingServices =
                                        List<String>.from(signinController
                                                .consultantModel
                                                .value
                                                .service ??
                                            []);

                                    // Cast new selections to List<String>
                                    List<String> newSelections =
                                        List<String>.from(results);

                                    // Merge existing selected items with new selections, ensuring uniqueness
                                    consultantController
                                        .selectedServiceItems.value = <String>{
                                      ...newSelections,
                                    }.toList(); // Convert to Set to avoid duplicates

                                    // Update the provider model to include the new service list
                                    signinController.consultantModel.value =
                                        signinController.consultantModel.value
                                            .copyWith(
                                      service: consultantController
                                          .selectedServiceItems
                                          .value, // Update the service list
                                    );
                                  }
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                signinController.isClickedService.value = false;
                                String userId = signinController
                                            .providerModel.value.type ==
                                        "provider"
                                    ? signinController.providerModel.value.id ??
                                        ''
                                    : signinController.userModel.value.type ==
                                            "trainer"
                                        ? signinController.userModel.value.id ??
                                            ''
                                        : signinController.consultantModel.value
                                                    .type ==
                                                "consultant"
                                            ? signinController
                                                    .consultantModel.value.id ??
                                                ''
                                            : signinController
                                                        .qddpModel.value.type ==
                                                    "qddp"
                                                ? signinController
                                                        .qddpModel.value.id ??
                                                    ''
                                                : '';
                                if (signinController.providerModel.value.type ==
                                    "provider") {
                                  signinController.updateServicesInFirestore(
                                      userId,
                                      providerController
                                          .selectedServiceItems.value);
                                } else if (signinController
                                        .userModel.value.type ==
                                    "trainer") {
                                  signinController.updateTrainingsInFirestore(
                                      userId,
                                      trainerController
                                          .selectedServiceItems.value);
                                } else if (signinController
                                        .consultantModel.value.type ==
                                    "consultant") {
                                  signinController.updateConsultantInFirestore(
                                      userId,
                                      consultantController
                                          .selectedServiceItems.value);
                                }
                              },
                              icon: Icon(Icons.check_circle,
                                  color: AppColors.green),
                            ),
                          ],
                        ),
                      ),
                    )),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                    5.pw,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomSimpleText(
                          text: signinController.providerModel.value.type ==
                                  "provider"
                              ? signinController
                                      .providerModel.value.officeAddress ??
                                  ''
                              : signinController.userModel.value.type ==
                                      "trainer"
                                  ? signinController
                                          .userModel.value.officeAddress ??
                                      ''
                                  : signinController
                                              .consultantModel.value.type ==
                                          "consultant"
                                      ? signinController
                                              .consultantModel.value.email ??
                                          ''
                                      : signinController.qddpModel.value.type ==
                                              "qddp"
                                          ? signinController
                                                  .qddpModel.value.email ??
                                              ''
                                          : '',
                          fontSize: AppSizes.size14,
                          fontWeight: FontWeight.normal,
                          color: AppColors.white,
                        ),

                        // CustomSimpleText(
                        //   text: " 21, West Virginia",
                        //   fontSize: AppSizes.size14,
                        //   fontWeight: FontWeight.normal,
                        //   color: AppColors.white,
                        // ),
                      ],
                    ),
                  ],
                ),

                signinController.qddpModel.value.type == "qddp" ? 10.ph : 0.ph,
                Visibility(
                  visible: signinController.qddpModel.value.type == "qddp"
                      ? true
                      : false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: CustomSimpleText(
                                text: signinController.qddpModel.value.degree
                                    .toString(),
                                color: AppColors.white,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              signinController.isClickedEditDegree.value = true;
                              signinController.fetchDegreeFromFirestore(
                                  signinController.qddpModel.value.id ?? '');
                            },
                            icon: Icon(
                              Icons.edit_note,
                              color: AppColors.white,
                              size: AppSizes.size18,
                            ),
                          )
                        ],
                      ),
                      signinController.qddpModel.value.type == "qddp" &&
                              signinController.isClickedEditDegree.value == true
                          ? Row(
                            children: [
                              Expanded(
                                child: Container(

                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.appColors,
                                        width: 1.0),
                                    borderRadius:
                                        BorderRadius.circular(5.0),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: Obx(() => DropdownButton<String>(
                                      value: qddpController.selectedDegree.value,
                                      items: <String>[
                                        "Select Degree",
                                        "Socialogy",
                                        "social work",
                                        "special education",
                                        "psychology",
                                        "rehabilatation",
                                        "counceling",
                                        "Bachelor’s",
                                        "Masters"
                                      ].map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: CustomSimpleText(
                                            text: value,
                                            fontWeight: FontWeight.w500,
                                            fontSize: AppSizes.size13,
                                            color: AppColors.white,
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        qddpController.selectedDegree.value = value!;
                                      },
                                      isExpanded: true,
                                      dropdownColor: Colors.black,
                                      iconEnabledColor: Colors.white,
                                      style: const TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.check_circle,
                                    color: AppColors.green),
                                onPressed: () {
                                  // Call update method when button is clicked
                                  String userId =
                                      signinController
                                          .qddpModel.value.id ?? ''; // Replace with actual user ID
                                  signinController.updateDegreeInFirestore(userId, "degree");
                                  signinController.qddpModel.value =
                                      signinController.qddpModel.value
                                          .copyWith(
                                        degree: qddpController.selectedDegree.value,
                                      );
                                  signinController.isClickedEditDegree.value = false;
                                },
                              ),
                            ],
                          )
                          : SizedBox.shrink(),
                      5.ph,

                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: CustomSimpleText(
                                text: signinController.qddpModel.value.degreeField
                                    .toString(),
                                color: AppColors.white,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              signinController.isClickedEditDegreeField.value = true;
                              signinController.fetchDegreeFieldFromFirestore(
                                  signinController.qddpModel.value.id ?? '');
                            },
                            icon: Icon(
                              Icons.edit_note,
                              color: AppColors.white,
                              size: AppSizes.size18,
                            ),
                          )
                        ],
                      ),
                      signinController.qddpModel.value.type == "qddp" &&
                          signinController.isClickedEditDegreeField.value == true
                          ? Row(
                        children: [
                          Expanded(
                            child: Container(

                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.appColors,
                                    width: 1.0),
                                borderRadius:
                                BorderRadius.circular(5.0),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: Obx(() => DropdownButton<String>(
                                  value: qddpController.selectedValue.value,
                                  items: <String>[
                                    "Choose one",
                                    "Registered nurse",
                                    "Human Services"
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: CustomSimpleText(
                                        text: value,
                                        fontWeight: FontWeight.w500,
                                        fontSize: AppSizes.size13,
                                        color: AppColors.white,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    qddpController.selectedValue.value = value!;
                                  },
                                  isExpanded: true,
                                  dropdownColor: Colors.black,
                                  iconEnabledColor: Colors.white,
                                  style: const TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.check_circle,
                                color: AppColors.green),
                            onPressed: () {
                              // Call update method when button is clicked
                              String userId =
                                  signinController
                                      .qddpModel.value.id ?? ''; // Replace with actual user ID
                              signinController.updateDegreeInFirestore(userId, "degreeField");
                              signinController.qddpModel.value =
                                  signinController.qddpModel.value
                                      .copyWith(
                                    degreeField: qddpController.selectedValue.value,
                                  );
                              signinController.isClickedEditDegreeField.value = false;
                            },
                          ),
                        ],
                      )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
                Visibility(
                  visible:
                      signinController.providerModel.value.type == "provider" ||
                              signinController.userModel.value.type == "trainer"
                          ? true
                          : false,
                  child: CustomSimpleText(
                    alignment: Alignment.center,
                    text: signinController.providerModel.value.type ==
                            "provider"
                        ? "License: ${signinController.providerModel.value.licenseNumber ?? ''}"
                        : signinController.userModel.value.type == "trainer"
                            ? signinController.userModel.value.phoneNumber ?? ''
                            : '',
                    fontSize: AppSizes.size14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white,
                  ),
                ),
                signinController.providerModel.value.type == "provider" ||
                        signinController.userModel.value.type == "trainer"
                    ? 10.ph
                    : 0.ph,
                Visibility(
                  visible: signinController.userModel.value.type == "trainer" ||
                          signinController.providerModel.value.type ==
                              "provider"
                      ? true
                      : false,
                  child: CustomSimpleText(
                    alignment: Alignment.center,
                    text: signinController.providerModel.value.type ==
                            "provider"
                        ? "NPI: ${signinController.providerModel.value.npiNumber ?? ''}"
                        : signinController.userModel.value.type == "trainer"
                            ? (signinController.userModel.value.training
                                    ?.join(', ') ??
                                '') // Convert List to String if needed
                            : '',
                    fontSize: AppSizes.size14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white,
                  ),
                ),

                signinController.providerModel.value.type == "provider" ||
                        signinController.userModel.value.type == "trainer"
                    ? 5.ph
                    : 0.ph,
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      signinController.isClickedEditProfile.value
                          ? Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: CustomTextTextfieldColumn(
                                  text: "",
                                  hint: "Enter Bio",
                                  textEditingController:
                                      signinController.bioController.value,
                                ),
                              ),
                            )
                          : Expanded(
                              child: CustomSimpleText(
                                text: signinController.providerModel.value.type ==
                                            "provider" &&
                                        (signinController.providerModel.value
                                                .bio?.isNotEmpty ??
                                            false)
                                    ? signinController.providerModel.value.bio ??
                                        ''
                                    : signinController.userModel.value.type == "trainer" &&
                                            (signinController.userModel.value
                                                    .bio?.isNotEmpty ??
                                                false)
                                        ? signinController.userModel.value.bio ??
                                            ''
                                        : signinController.consultantModel.value.type ==
                                                    "consultant" &&
                                                (signinController
                                                        .consultantModel
                                                        .value
                                                        .bio
                                                        ?.isNotEmpty ??
                                                    false)
                                            ? signinController.consultantModel
                                                    .value.bio ??
                                                ''
                                            : signinController.qddpModel.value.type == "qddp" &&
                                                    (signinController
                                                            .qddpModel
                                                            .value
                                                            .bio
                                                            ?.isNotEmpty ??
                                                        false)
                                                ? signinController.qddpModel.value.bio ?? ''
                                                : "Bio",
                                textDecoration: TextDecoration.underline,
                                fontSize: AppSizes.size13,
                                fontWeight: FontWeight.normal,
                                color: AppColors.white,
                                alignment: Alignment.center,
                              ),
                            ),
                      signinController.isClickedEditProfile.value == false
                          ? IconButton(
                              onPressed: () {
                                signinController.isClickedEditProfile.value =
                                    true;
                                signinController.bioController.value
                                    .text = signinController.providerModel.value.type ==
                                            "provider" &&
                                        (signinController.providerModel.value
                                                .bio?.isNotEmpty ??
                                            false)
                                    ? signinController.providerModel.value.bio ??
                                        ''
                                    : signinController.userModel.value.type == "trainer" &&
                                            (signinController.userModel.value
                                                    .bio?.isNotEmpty ??
                                                false)
                                        ? signinController.userModel.value.bio ??
                                            ''
                                        : signinController.consultantModel.value.type ==
                                                    "consultant" &&
                                                (signinController
                                                        .consultantModel
                                                        .value
                                                        .bio
                                                        ?.isNotEmpty ??
                                                    false)
                                            ? signinController.consultantModel.value.bio ??
                                                ''
                                            : signinController.qddpModel.value.type == "qddp" &&
                                                    (signinController
                                                            .qddpModel
                                                            .value
                                                            .bio
                                                            ?.isNotEmpty ??
                                                        false)
                                                ? signinController.qddpModel.value.bio ?? ''
                                                : "";
                              },
                              icon: Icon(
                                Icons.edit_note,
                                color: AppColors.white,
                                size: AppSizes.size18,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: IconButton(
                                onPressed: () {
                                  signinController.isClickedEditProfile.value =
                                      false;

                                  // Extracting the user ID based on the type
                                  String userId = signinController
                                              .providerModel.value.type ==
                                          "provider"
                                      ? signinController
                                              .providerModel.value.id ??
                                          ''
                                      : signinController.userModel.value.type ==
                                              "trainer"
                                          ? signinController
                                                  .userModel.value.id ??
                                              ''
                                          : signinController.consultantModel
                                                      .value.type ==
                                                  "consultant"
                                              ? signinController.consultantModel
                                                      .value.id ??
                                                  ''
                                              : signinController.qddpModel.value
                                                          .type ==
                                                      "qddp"
                                                  ? signinController
                                                          .qddpModel.value.id ??
                                                      ''
                                                  : '';

                                  // Update the bio in Firestore
                                  signinController.updateBio(
                                      userId,
                                      signinController
                                          .bioController.value.text);

                                  // Update the model with the new bio
                                  if (signinController
                                          .providerModel.value.type ==
                                      "provider") {
                                    signinController.providerModel.value =
                                        signinController.providerModel.value
                                            .copyWith(
                                      bio: signinController
                                          .bioController.value.text,
                                    );
                                  } else if (signinController
                                          .userModel.value.type ==
                                      "trainer") {
                                    signinController.userModel.value =
                                        signinController.userModel.value
                                            .copyWith(
                                      bio: signinController
                                          .bioController.value.text,
                                    );
                                  } else if (signinController
                                          .consultantModel.value.type ==
                                      "consultant") {
                                    signinController.consultantModel.value =
                                        signinController.consultantModel.value
                                            .copyWith(
                                      bio: signinController
                                          .bioController.value.text,
                                    );
                                  } else {
                                    signinController.qddpModel.value =
                                        signinController.qddpModel.value
                                            .copyWith(
                                      bio: signinController
                                          .bioController.value.text,
                                    );
                                  }

                                  // Optional: Clear the text controller if you want
                                  // signinController.bioController.value.clear();
                                },
                                icon: Icon(
                                  Icons.check_circle,
                                  color: AppColors.green,
                                ),
                              ),
                            )
                    ],
                  );
                }),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Center(
                //       child: Image.asset(
                //         AppAssets.viewService,
                //         width: 18,
                //         height: 18,
                //       ),
                //     ),
                //     8.ph,
                //     Text(
                //       'View Services',
                //       style: TextStyle(
                //         decoration: TextDecoration.underline,
                //         fontSize: AppSizes.size13,
                //         fontWeight: FontWeight.normal,
                //         color: AppColors.white,
                //       ),
                //     )
                //   ],
                // ),
                // Text(
                //   'Bio',
                //   style: TextStyle(
                //     decoration: TextDecoration.underline,
                //     fontSize: AppSizes.size13,
                //     fontWeight: FontWeight.normal,
                //     color: AppColors.white,
                //   ),
                // ),
                // 10.ph,
                // Row(
                //   children: [
                //     Expanded(flex: 2, child: SizedBox()),
                //     Expanded(
                //       flex: 3,
                //       child: Container(
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(4),
                //           color: AppColors.appColors,
                //         ),
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: 5, vertical: 6),
                //           child: Center(
                //             child: Padding(
                //               padding: const EdgeInsets.only(left: 10),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   Icon(
                //                     Icons.messenger_outline,
                //                     size: 15,
                //                     color: AppColors.white,
                //                   ),
                //                   5.pw,
                //                   Expanded(
                //                     child: CustomSimpleText(
                //                       text: "Send a Message",
                //                       fontSize: AppSizes.size13,
                //                       color: AppColors.white,
                //                       fontWeight: FontWeight.w500,
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //     Expanded(flex: 2, child: SizedBox()),
                //   ],
                // ),
                20.ph,
                Visibility(
                  visible:
                      signinController.providerModel.value.type == "provider"
                          ? false
                          : true,
                  child: Divider(
                    color: AppColors.deepGrey,
                  ),
                ),
                20.ph,
                Visibility(
                  visible:
                      signinController.providerModel.value.type == "provider"
                          ? false
                          : true,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomSimpleText(
                        text: "Provide Suggestion",
                        fontSize: AppSizes.size13,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),

                40.ph,
                Visibility(
                  visible:
                      signinController.providerModel.value.type == "provider"
                          ? false
                          : true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 13.0,
                          mainAxisSpacing: 14.0),
                      itemCount: signinController.providerList.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        var item = signinController.providerList[index];
                        return Stack(
                          children: [
                            Center(
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: AppColors.appColors),
                                  color: Colors.black,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 9,
                                      offset: Offset(0, 0), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: CustomSimpleText(
                                        text: item.contactName ?? '',
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppSizes.size18,
                                        color: AppColors.white,
                                        textAlign: TextAlign.center,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    5.ph,
                                    CustomSimpleText(
                                      text: item.phoneNumber ?? '',
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppSizes.size14,
                                      color: AppColors.white,
                                      textAlign: TextAlign.center,
                                      alignment: Alignment.center,
                                    ),
                                    5.ph,
                                    // 5.ph,
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.center,
                                    //   crossAxisAlignment:
                                    //       CrossAxisAlignment.center,
                                    //   children: [
                                    //     PannableRatingBar(
                                    //       rate: index / 10,
                                    //       items: List.generate(
                                    //           1,
                                    //           (index) => const RatingWidget(
                                    //                 selectedColor:
                                    //                     Colors.orange,
                                    //                 unSelectedColor:
                                    //                     Colors.grey,
                                    //                 child: Icon(
                                    //                   Icons.star,
                                    //                   size: 15,
                                    //                 ),
                                    //               )),
                                    //     ),
                                    //     CustomSimpleText(
                                    //       text: "${index / 10}",
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: AppSizes.size15,
                                    //       color: AppColors.white,
                                    //       textAlign: TextAlign.center,
                                    //       alignment: Alignment.center,
                                    //     ),
                                    //   ],
                                    // ),
                                    // 5.ph,
                                    InkWell(
                                      onTap: () {
                                        // RouteGenerator.pushNamedSms(
                                        //     context, Routes.messageScreen, arguments: [
                                        //       item.id,
                                        //   item.imageBase64,
                                        //   item.providerName
                                        // ]);
                                        RouteGenerator.pushNamedSms(context,
                                            Routes.providerDetailsProfile,
                                            arguments: [item]);
                                        print("item ${item.id}");
                                        indexController.fetchMessages(
                                            receiverId: item.id ?? '');
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        margin: EdgeInsets.only(bottom: 10),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.26,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: AppColors.appColors),
                                        child: CustomSimpleText(
                                          text: "View Details",
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppSizes.size15,
                                          color: AppColors.white,
                                          textAlign: TextAlign.center,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0, // Adjust this value as needed
                              right: 0,
                              left: 0,
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: SizedBox(
                                    height: AppSizes.newSize(8.0),
                                    width: AppSizes.newSize(8.0),
                                    child: item.imageBase64?.isEmpty ?? false
                                        ? Icon(
                                            Icons.person,
                                            size: AppSizes.newSize(8.0),
                                            color: AppColors.white,
                                          )
                                        : Image.memory(
                                            base64Decode(
                                                item.imageBase64 ?? ''),
                                            fit: BoxFit
                                                .cover, // Adjust image display
                                          ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
