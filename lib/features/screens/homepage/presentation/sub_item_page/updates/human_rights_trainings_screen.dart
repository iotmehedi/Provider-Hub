import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';

import '../../../../../../const/routes/router.dart';
import '../../../../../../const/utils/consts/app_colors.dart';
import '../../../../../../const/utils/consts/app_sizes.dart';
import '../../../../../widget/custom_appbar/custom_appbar.dart';
import '../../../../../widget/custom_simple_text/custom_simple_text.dart';
import '../../controller/controller.dart';
import 'licensing_page.dart';

class HumanRightsTrainingsScreen extends StatelessWidget {
  HumanRightsTrainingsScreen({super.key});
  var controller = Get.put(HomepageContorller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: "Human Rights Trainings",
        needTitleCenter: false,
        textColor: AppColors.white,
        fontSize: AppSizes.size24,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.ph,
              CustomSimpleText(
                text: "Training Resources for Providers",
                textAlign: TextAlign.center,
                alignment: Alignment.center,
                color: AppColors.white,
                fontSize: AppSizes.size24,
                fontWeight: FontWeight.normal,
              ),
              15.ph,
              CustomDivider(),
              15.ph,
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: CustomSimpleText(
                  text: "Select a Section for More Information",
                  textAlign: TextAlign.center,
                  alignment: Alignment.center,
                  color: AppColors.white,
                  fontSize: AppSizes.size12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              1.ph,
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: CustomRichText(
                    text: "Resources for Individuals",
                    date: '',
                    text1: "",
                    alignment: Alignment.center,
                    textDecoration1: TextDecoration.underline,
                    textDecoration2: TextDecoration.underline,
                    textDecoration3: TextDecoration.underline,
                    dotNeedOrNot: false,
                    onPress: () async {
                      RouteGenerator.gotoWebPage(
                        context: context,
                        pageTitle: '',
                        url:
                            "https://dbhds.virginia.gov/quality-management/human-rights/resources-for-individuals/",
                      );
                    }),
              ),
              1.ph,
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: CustomRichText(
                    text: "Resources for Licensed Providers",
                    date: '',
                    text1: "",
                    alignment: Alignment.center,
                    textDecoration1: TextDecoration.underline,
                    textDecoration2: TextDecoration.underline,
                    textDecoration3: TextDecoration.underline,
                    dotNeedOrNot: false,
                    onPress: () async {
                      RouteGenerator.gotoWebPage(
                        context: context,
                        pageTitle: '',
                        url:
                            "https://dbhds.virginia.gov/quality-management/human-rights/provider-resources/",
                      );
                    }),
              ),
              1.ph,
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: CustomRichText(
                    text: "Resources for State Operated Facilities",
                    date: '',
                    text1: "",
                    alignment: Alignment.center,
                    textDecoration1: TextDecoration.underline,
                    textDecoration2: TextDecoration.underline,
                    textDecoration3: TextDecoration.underline,
                    dotNeedOrNot: false,
                    onPress: () async {
                      RouteGenerator.gotoWebPage(
                        context: context,
                        pageTitle: '',
                        url:
                            "https://dbhds.virginia.gov/quality-management/human-rights/resources-for-state-operated-facilities/",
                      );
                    }),
              ),
              1.ph,
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: CustomRichText(
                    text: "Training Resources for Providers",
                    date: '',
                    text1: "",
                    alignment: Alignment.center,
                    textDecoration1: TextDecoration.underline,
                    textDecoration2: TextDecoration.underline,
                    textDecoration3: TextDecoration.underline,
                    dotNeedOrNot: false,
                    onPress: () async {
                      RouteGenerator.gotoWebPage(
                        context: context,
                        pageTitle: '',
                        url:
                            "https://dbhds.virginia.gov/quality-management/human-rights/training-resources-for-providers/",
                      );
                    }),
              ),
              1.ph,
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: CustomRichText(
                    text: "LHRC & SHRC",
                    date: '',
                    text1: "",
                    alignment: Alignment.center,
                    textDecoration1: TextDecoration.underline,
                    textDecoration2: TextDecoration.underline,
                    textDecoration3: TextDecoration.underline,
                    dotNeedOrNot: false,
                    onPress: () async {
                      RouteGenerator.gotoWebPage(
                        context: context,
                        pageTitle: '',
                        url:
                            "https://dbhds.virginia.gov/quality-management/human-rights/lhrc-shrc/",
                      );
                    }),
              ),
              1.ph,
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: CustomRichText(
                    text: "Data & Statistics",
                    date: '',
                    text1: "",
                    alignment: Alignment.center,
                    textDecoration1: TextDecoration.underline,
                    textDecoration2: TextDecoration.underline,
                    textDecoration3: TextDecoration.underline,
                    dotNeedOrNot: false,
                    onPress: () async {
                      RouteGenerator.gotoWebPage(
                        context: context,
                        pageTitle: '',
                        url:
                            "https://dbhds.virginia.gov/quality-management/human-rights/data-statistics/",
                      );
                    }),
              ),
              1.ph,
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: CustomRichText(
                    text: "Contact Information",
                    date: '',
                    text1: "",
                    alignment: Alignment.center,
                    textDecoration1: TextDecoration.underline,
                    textDecoration2: TextDecoration.underline,
                    textDecoration3: TextDecoration.underline,
                    dotNeedOrNot: false,
                    onPress: () async {
                      RouteGenerator.gotoWebPage(
                        context: context,
                        pageTitle: '',
                        url:
                            "https://dbhds.virginia.gov/quality-management/human-rights/ohr-contact-info",
                      );
                    }),
              ),
              30.ph,
              CustomSimpleText(
                text: "Licensed Providers",
                textAlign: TextAlign.center,
                alignment: Alignment.center,
                color: AppColors.white,
                fontSize: AppSizes.size24,
                fontWeight: FontWeight.normal,
              ),
              15.ph,
              CustomSimpleText(
                text: "Training Schedules",
                textAlign: TextAlign.start,
                alignment: Alignment.centerLeft,
                color: AppColors.white,
                fontSize: AppSizes.size12,
                fontWeight: FontWeight.w500,
              ),
              15.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomRichText(
                    text: "2023 Community Provider Trainings (rev. 7.7.23)",
                    date: '',
                    text1: "",
                    textDecoration1: TextDecoration.none,
                    textDecoration2: TextDecoration.underline,
                    textDecoration3: TextDecoration.underline,
                    dotNeedOrNot: true,
                    onPress: () async {
                      RouteGenerator.gotoWebPage(
                        context: context,
                        pageTitle: '',
                        url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2023/07/2023-Community-Provider-Training-Schedule-1.pdf",
                      );
                    }),
              ),
              15.ph,
              CustomSimpleText(
                text: "Frequently Asked Questions",
                textAlign: TextAlign.start,
                alignment: Alignment.centerLeft,
                color: AppColors.white,
                fontSize: AppSizes.size12,
                fontWeight: FontWeight.w500,
              ),
              15.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomRichText(
                    text: "OHR Training Series FAQs_7.8.22",
                    date: '',
                    text1: "",
                    textDecoration1: TextDecoration.underline,
                    textDecoration2: TextDecoration.underline,
                    textDecoration3: TextDecoration.underline,
                    dotNeedOrNot: true,
                    onPress: () async {
                      RouteGenerator.gotoWebPage(
                        context: context,
                        pageTitle: '',
                        url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2022/07/FAQs-OHR-Statewide-Training-Series_7.8.22.pdf",
                      );
                    }),
              ),
              15.ph,
              CustomSimpleText(
                text: "Recordings, Slide Decks, & Supplemental Materials",
                textAlign: TextAlign.center,
                alignment: Alignment.centerLeft,
                color: AppColors.white,
                fontSize: AppSizes.size12,
                fontWeight: FontWeight.normal,
              ),
              15.ph,
              CustomSimpleText(
                text: "Reporting in CHRIS: Abuse, Neglect, Exploitation, & Human Rights Complaints",
                textAlign: TextAlign.start,
                alignment: Alignment.centerLeft,
                color: AppColors.white,
                fontSize: AppSizes.size12,
                fontWeight: FontWeight.normal,
              ),
              15.ph,
              CustomRichText(
                  text: "Slide Deck",
                  date: '',
                  text1: "",
                  textDecoration1: TextDecoration.underline,
                  textDecoration2: TextDecoration.underline,
                  textDecoration3: TextDecoration.underline,
                  dotNeedOrNot: true,
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                      "https://dbhds.virginia.gov/wp-content/uploads/2022/08/Reporting-in-CHRIS_2022-Handout.pdf",
                    );
                  }),
              CustomRichText(
                  text: "Supplemental Slides - ",
                  date: 'coming soon',
                  text1: "",
                  textDecoration1: TextDecoration.underline,
                  textDecoration2: TextDecoration.none,
                  textDecoration3: TextDecoration.underline,
                  dotNeedOrNot: true,
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                      "https://dbhds.virginia.gov/Users/dwm44784/Documents/Training%20&%20Development/Trainings/Statewide%20Trainings/CHRIS/Reporting%20in%20CHRIS%20-%20SUPPLEMENTAL%20SLIDES.pdf",
                    );
                  }),
              15.ph,
              CustomSimpleText(
                text: "Restrictions, Behavioral Treatment Plans, & Restraints",
                textAlign: TextAlign.start,
                alignment: Alignment.centerLeft,
                color: AppColors.white,
                fontSize: AppSizes.size12,
                fontWeight: FontWeight.normal,
              ),
              15.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomRichText(
                    text: "Slide Deck",
                    date: '',
                    text1: "",
                    textDecoration1: TextDecoration.underline,
                    textDecoration2: TextDecoration.underline,
                    textDecoration3: TextDecoration.underline,
                    dotNeedOrNot: true,
                    onPress: () async {
                      RouteGenerator.gotoWebPage(
                        context: context,
                        pageTitle: '',
                        url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2022/08/Restrictions-BTPs-Restraints_2022.pdf",
                      );
                    }),
              ),
              15.ph,
              CustomSimpleText(
                text: "The Human Rights Regulations: An Overview",
                textAlign: TextAlign.start,
                alignment: Alignment.centerLeft,
                color: AppColors.white,
                fontSize: AppSizes.size12,
                fontWeight: FontWeight.normal,
              ),
              15.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomRichText(
                    text: "Slide Deck",
                    date: '',
                    text1: "",
                    textDecoration1: TextDecoration.underline,
                    textDecoration2: TextDecoration.underline,
                    textDecoration3: TextDecoration.underline,
                    dotNeedOrNot: true,
                    onPress: () async {
                      RouteGenerator.gotoWebPage(
                        context: context,
                        pageTitle: '',
                        url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2022/08/The-Human-Rights-Regulations-An-Overview_2022-HANDOUT.pdf",
                      );
                    }),
              ),
              15.ph,
              CustomSimpleText(
                text: "Investigating Abuse & Neglect: An Overview for Community Providers",
                textAlign: TextAlign.start,
                alignment: Alignment.centerLeft,
                color: AppColors.white,
                fontSize: AppSizes.size12,
                fontWeight: FontWeight.normal,
              ),
              15.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRichText(
                        text: "Slide Deck",
                        date: '',
                        text1: "",
                        textDecoration1: TextDecoration.underline,
                        textDecoration2: TextDecoration.underline,
                        textDecoration3: TextDecoration.underline,
                        dotNeedOrNot: true,
                        onPress: () async {
                          RouteGenerator.gotoWebPage(
                            context: context,
                            pageTitle: '',
                            url:
                            "https://dbhds.virginia.gov/wp-content/uploads/2022/08/Investigating-Abuse-Neglect_2022.pdf",
                          );
                        }),
                    CustomRichText(
                        text: "Investigations Training Manual",
                        date: '',
                        text1: "",
                        textDecoration1: TextDecoration.underline,
                        textDecoration2: TextDecoration.underline,
                        textDecoration3: TextDecoration.underline,
                        dotNeedOrNot: true,
                        onPress: () async {
                          RouteGenerator.gotoWebPage(
                            context: context,
                            pageTitle: '',
                            url:
                            "https://dbhds.virginia.gov/assets/doc/QMD/human-rights/Investigations-Training-Manual.docx",
                          );
                        }),
                    CustomRichText(
                        text: "Optional Investigation Form",
                        date: '',
                        text1: "",
                        textDecoration1: TextDecoration.underline,
                        textDecoration2: TextDecoration.underline,
                        textDecoration3: TextDecoration.underline,
                        dotNeedOrNot: true,
                        onPress: () async {
                          RouteGenerator.gotoWebPage(
                            context: context,
                            pageTitle: '',
                            url:
                            "https://dbhds.virginia.gov/assets/doc/QMD/human-rights/Optional-Forms.docx",
                          );
                        }),
                    CustomRichText(
                        text: "Investigation Review Sheet",
                        date: '',
                        text1: "",
                        textDecoration1: TextDecoration.underline,
                        textDecoration2: TextDecoration.underline,
                        textDecoration3: TextDecoration.underline,
                        dotNeedOrNot: true,
                        onPress: () async {
                          RouteGenerator.gotoWebPage(
                            context: context,
                            pageTitle: '',
                            url:
                            "https://dbhds.virginia.gov/assets/doc/QMD/human-rights/Investigation-Review-Worksheet.docx",
                          );
                        }),
                  ],
                ),
              ),
              15.ph,
              CustomSimpleText(
                text: "State Operated Facilities",
                textAlign: TextAlign.center,
                alignment: Alignment.center,
                color: AppColors.white,
                fontSize: AppSizes.size24,
                fontWeight: FontWeight.normal,
              ),

              15.ph,
              Column(
                children: [
                  CustomSimpleText(
                    text: "Training Schedule",
                    textAlign: TextAlign.start,
                    alignment: Alignment.centerLeft,
                    color: AppColors.white,
                    fontSize: AppSizes.size12,
                    fontWeight: FontWeight.normal,
                  ),
                  15.ph,
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRichText(
                            text: "2023 State Operated Facility Trainings",
                            date: '',
                            text1: "",
                            textDecoration1: TextDecoration.underline,
                            textDecoration2: TextDecoration.underline,
                            textDecoration3: TextDecoration.underline,
                            dotNeedOrNot: true,
                            onPress: () async {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: '',
                                url:
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/03/2023-State-Operated-Facility-Training-Schedule.pdf",
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),

              15.ph,
              Column(
                children: [
                  CustomSimpleText(
                    text: "Frequently Asked Questions",
                    textAlign: TextAlign.start,
                    alignment: Alignment.centerLeft,
                    color: AppColors.white,
                    fontSize: AppSizes.size12,
                    fontWeight: FontWeight.normal,
                  ),
                  15.ph,
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRichText(
                            text: "In development",
                            date: '',
                            text1: "",
                            textDecoration1: TextDecoration.none,
                            textDecoration2: TextDecoration.underline,
                            textDecoration3: TextDecoration.underline,
                            dotNeedOrNot: true,
                            onPress: null),
                      ],
                    ),
                  ),
                ],
              ),
              15.ph,
              CustomSimpleText(
                text: "Recordings, Slide Decks, & Supplemental Materials",
                textAlign: TextAlign.start,
                alignment: Alignment.centerLeft,
                color: AppColors.white,
                fontSize: AppSizes.size12,
                fontWeight: FontWeight.normal,
              ),
              15.ph,
              Column(
                children: [
                  CustomSimpleText(
                    text: "Reporting in CHRIS: Abuse, Neglect, Exploitation, & Human Rights Complaints",
                    textAlign: TextAlign.start,
                    alignment: Alignment.centerLeft,
                    color: AppColors.white,
                    fontSize: AppSizes.size12,
                    fontWeight: FontWeight.normal,
                  ),
                  15.ph,
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRichText(
                            text: "In development",
                            date: '',
                            text1: "",
                            textDecoration1: TextDecoration.none,
                            textDecoration2: TextDecoration.underline,
                            textDecoration3: TextDecoration.underline,
                            dotNeedOrNot: true,
                            onPress: null),
                      ],
                    ),
                  ),
                ],
              ),
              15.ph,
              CustomSimpleText(
                text: "Facility Investigation Training (FIT)",
                textAlign: TextAlign.start,
                alignment: Alignment.centerLeft,
                color: AppColors.white,
                fontSize: AppSizes.size12,
                fontWeight: FontWeight.normal,
              ),
              15.ph,
              CustomSimpleText(
                text: "Please visit the Resources for Facility Investigators channel in MS Teams for the resources relevant to this training. If you need access to this channel, please contact your Facility Advocate.",
                textAlign: TextAlign.start,
                alignment: Alignment.centerLeft,
                color: AppColors.white,
                fontSize: AppSizes.size12,
                fontWeight: FontWeight.normal,
              ),
              20.ph,
            ],
          ),
        ),
      ),
    );
  }
}
