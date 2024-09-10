import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_hub/const/utils/consts/app_assets.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/homepage/presentation/controller/controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

import '../../../../../../const/routes/router.dart';

class LicensingPage extends StatelessWidget {
  LicensingPage({super.key});
  var controller = Get.put(HomepageContorller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: "Licensing",
        needTitleCenter: false,
        textColor: AppColors.white,
        fontSize: AppSizes.size24,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomSimpleText(
                text: "Office of Licensing",
                textAlign: TextAlign.center,
                alignment: Alignment.center,
                color: AppColors.white,
                fontSize: AppSizes.size24,
                fontWeight: FontWeight.normal,
              ),
              CustomDivider(),
              15.ph,
              Row(
                children: [
                  Image.asset(
                    AppAssets.connect,
                    height: 55,
                    width: 55,
                  ),
                  Expanded(
                    child: CustomSimpleText(
                      text:
                          "Our Mission: To be the regulatory authority for DBHDS licensed service delivery system through effective oversight.",
                      fontSize: AppSizes.size12,
                      color: AppColors.white,
                      textAlign: TextAlign.justify,
                      maxLines: 15,
                    ),
                  ),
                ],
              ),
              15.ph,
              CustomSimpleText(
                text:
                    "Our Vision: The Office of Licensing will provide consistent, responsive, and reliable regulatory oversight to DBHDS licensed providers by supporting high quality services to meet the diverse needs of its clients.",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.justify,
                maxLines: 20,
              ),
              20.ph,
              CustomDivider(),
              10.ph,
              CustomSimpleText(
                text: "Connect Provider Portal Resources and Information",
                fontSize: AppSizes.size24,
                color: AppColors.white,
                textAlign: TextAlign.center,
                maxLines: 8,
              ),
              10.ph,
              CustomSimpleText(
                text:
                    "Click below for help using the CONNECT Provider Portal or to report an issue.",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                maxLines: 8,
              ),
              20.ph,
              Center(
                child: Container(
                  height: 42,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.blue),
                  child: CustomSimpleText(
                    alignment: Alignment.center,
                    text: "CONNECT HELP DESK",
                    fontSize: AppSizes.size16,
                    color: AppColors.white,
                    textAlign: TextAlign.center,
                    maxLines: 8,
                  ),
                ),
              ),
              20.ph,
              CustomDivider(),
              10.ph,
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.blue),
                  child: CustomSimpleText(
                    alignment: Alignment.center,
                    text: "CONNECT USER \nRESOURCES",
                    fontSize: AppSizes.size16,
                    color: AppColors.white,
                    textAlign: TextAlign.center,
                    maxLines: 8,
                  ),
                ),
              ),
              10.ph,
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.blue),
                  child: CustomSimpleText(
                    alignment: Alignment.center,
                    text: "INITIAL APPLICANTS",
                    fontSize: AppSizes.size16,
                    color: AppColors.white,
                    textAlign: TextAlign.center,
                    maxLines: 8,
                  ),
                ),
              ),
              15.ph,
              CustomDivider(),
              10.ph,
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.blue),
                  child: CustomSimpleText(
                    alignment: Alignment.center,
                    text: "LOG INTO CONNECT",
                    fontSize: AppSizes.size16,
                    color: AppColors.white,
                    textAlign: TextAlign.center,
                    maxLines: 8,
                  ),
                ),
              ),
              15.ph,
              CustomDivider(),
              10.ph,
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.blue),
                  child: CustomSimpleText(
                    alignment: Alignment.center,
                    text: "LICENSED PROVIDER SEARCH",
                    fontSize: AppSizes.size16,
                    color: AppColors.white,
                    textAlign: TextAlign.center,
                    maxLines: 8,
                  ),
                ),
              ),
              10.ph,
              CustomSimpleText(
                text:
                    "Use the Virginia Department of Behavioral Health and Developmental Services Provider Search System to locate licensed providers by a variety of criteria.",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 8,
              ),
              15.ph,
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.blue),
                  child: CustomSimpleText(
                    alignment: Alignment.center,
                    text: "SUBSCRIBE TO THE EMAIL LIST",
                    fontSize: AppSizes.size16,
                    color: AppColors.white,
                    textAlign: TextAlign.center,
                    maxLines: 8,
                  ),
                ),
              ),
              15.ph,
              CustomSimpleText(
                text:
                    "Sign up to get news and updates delivered to your inbox from Office Of Licensing at the Virginia Department of Behavioral Health and Developmental Services.",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                maxLines: 8,
                fontWeight: FontWeight.normal,
              ),
              15.ph,
              CustomDivider(),
              10.ph,
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.blue),
                  child: CustomSimpleText(
                    alignment: Alignment.center,
                    text: "WAITLIST",
                    fontSize: AppSizes.size16,
                    color: AppColors.white,
                    textAlign: TextAlign.center,
                    maxLines: 8,
                  ),
                ),
              ),
              15.ph,
              CustomDivider(),
              10.ph,
              SizedBox(
                height: 300,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    10.ph,
                    CustomSimpleText(
                      text: "CO\nRRE\nSP\nON\nDE\nNC\nE",
                      fontSize: AppSizes.size24,
                      color: AppColors.white,
                      textAlign: TextAlign.start,
                      maxLines: 8,
                    ),
                    70.pw,
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        AppAssets.conrrespondence,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              15.ph,
              CustomRichText(
                  text:
                      ' 2024 Annual Inspections for Providers of Developmental Services Memo ',
                  date: "(December 2023)",
                  onPress: () {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/12/Memo-to-Providers-and-Chart-for-2024-DD-Inspections-1.pdf",
                    );
                  }),
              CustomRichText(
                  text:
                      ' Expectations Regarding Provider Reporting Measures for Residential and Day Support Providers of Developmental Services and Expectations of Provider Risk Management Programs for All Providers of Developmental Services  ',
                  date: "(November 2023)",
                  onPress: () {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/12/Expectations-regarding-provider-reporting-measures-and-risk-management-programs2.pdf",
                    );
                  }),
              CustomRichText(
                  text:
                      ' Incident Management Unit Look Behind Process and Provider Responsibilities  ',
                  date: "(October 2023)",
                  onPress: () {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/10/IMU-Look-Behind-Provider-Notification-Memo-10.6.2023.pdf",
                    );
                  }),
              CustomRichText(
                  text:
                      ' Computerized Human Rights Information System (CHRIS) Enhancement Memo ',
                  date: "(September 2023)",
                  onPress: () {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/09/CHRIS-Enhancement-to-the-Service-Program-Code-and-the-Service-Description_8.31.2023-FINAL.pdf",
                    );
                  }),
              CustomRichText(
                  text:
                      ' General Information and Opportunity to Comment DBHDS 2023 Combined-Study-Workgroup ',
                  date: "(July 2023)",
                  onPress: () {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/07/General-Information-and-Opportunity-to-Comment-DBHDS-2023-Combined-Study-Workgroup.pdf",
                    );
                  }),
              CustomRichText(
                  text:
                      ' Upcoming Webinars for Initial Applicants and New & Experienced DBHDS Licensed Providers ',
                  date: "(June 2023)",
                  onPress: () {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/06/Upcoming-Webinars-for-Initial-Applicants-and-New-Experienced-DBHDS-Licensed-Providers.pdf",
                    );
                  }),
              CustomRichText(
                  text:
                      ' Changes from the Emergency BHE Regulations to the Final BHE Regulations Memo ',
                  date: "(February 2023)",
                  onPress: () {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/02/Final-BHE-Memo-1-1.pdf",
                    );
                  }),
              CustomRichText(
                  text:
                      ' Changes from the Emergency ASAM Regulations to the Final ASAM Regulations Memo ',
                  date: "(February 2023)",
                  onPress: () {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/02/Final-ASAM-Memo.pdf",
                    );
                  }),
              CustomRichText(
                  text:
                      ' Changes from the Emergency Children’s ASAM Regulations to the Final Children’s ASAM Regulations Memo ',
                  date: "(February 2023)",
                  onPress: () {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/02/Final-ASAM-46-Memo.pdf",
                    );
                  }),
              CustomRichText(
                  text:
                      ' Revised-Care-Concern-Criteria-Level-I-Serious-Incidents-Memo ',
                  date: "(February 2023)",
                  onPress: () {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/02/Revised-Care-Concern-Criteria-Level-I-Serious-Incidents-Memo-2.14.23.pdf",
                    );
                  }),
              CustomRichText(
                  text:
                      ' Medication Assisted Opioid Treatment Services (MAT) legislative changes effective January 1, 2023 Memo ',
                  date: "(December 2022)",
                  onPress: () {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2022/12/12-16-22-MAT-Memo.pdf",
                    );
                  }),
              CustomRichText(
                  text: ' TDT and Outpatient Memo ',
                  date: "(August 2022)",
                  onPress: () {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/01/TDT-and-Outpatient-Memo-8.11.22.pdf",
                    );
                  }),
              CustomRichText(
                  text:
                      ' New Regulation Affecting 12VAC35-46 Effective 1-10-22 Memo ',
                  date: "(December 2021)",
                  onPress: () {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/02/New-Regulation-Affecting-12VAC35-46-Effective-1-10-22.Memo_.pdf",
                    );
                  }),
              CustomRichText(
                  text: ' Word Version of the Sponsor Certification Form ',
                  date: "",
                  onPress: () async {
                    await controller.saveImageAndShowNotification(
                        imageUrl:
                            "https://www.figma.com/exit?url=https%3A%2F%2Fdbhds.virginia.gov%2Fassets%2Fdoc%2FQMD%2FOL%2Fsponsor-certification-form-word-version.docx");
                  }),
              CustomRichText(
                  text: ' Sponsored Provider Certification Process ',
                  date: "",
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/assets/doc/QMD/OL/sponsored-provider-certification-process_final-11-23-21.pdf",
                    );
                  }),
              CustomRichText(
                  text:
                      ' December 1, 2021 Behavioral Health Enhancement (BHE)Licensed Services ',
                  date: "(October 2021)",
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/assets/doc/QMD/OL/final-december-1-2021-bhe-memo.pdf",
                    );
                  }),
              CustomRichText(
                  text: ' Memo – Grace Period for Documentation of ISPs ',
                  date: "(March 2021)",
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/assets/doc/QMD/OL/grace-period-for-documentation-of-isps-memo-3-4-2021.pdf",
                    );
                  }),
              20.ph,
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                color: Colors.black12,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: CustomSimpleText(
                  text: "2023 OVERHAUL REGULATORY ADVISORY PANEL (RAP) DRAFTS",
                  fontSize: AppSizes.size12,
                  color: HexColor(
                    "FF0000",
                  ),
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.normal,
                ),
              ),
              20.ph,
              CustomSimpleText(
                text: "Background",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
              ),
              20.ph,
              CustomSimpleText(
                text:
                    "Each state agency must ensure that its regulations are reviewed at least once every four years through a “periodic review.” Agencies must then decide if the regulation will be amended, retained as is, or repealed. After conducting a periodic review of the Licensing Regulations, the agency filed a decision to amend the regulations. In 2019, a public comment forum and a RAP were held to discuss the initial draft of the ‘umbrella’ administrative chapter for all the licensing regulations, the General Chapter.",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.justify,
                fontWeight: FontWeight.normal,
                maxLines: 30,
              ),
              20.ph,
              CustomSimpleText(
                text: "Planned Changes",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
              ),
              20.ph,
              CustomSimpleText(
                text:
                    "Since the development of the draft General Chapter, the Office of Licensing has worked steadily on the “overhaul” of the Licensing Regulations and developed drafts for five new service-specific chapters: \n • Case Management \n• Center-based Services\n• Home/Noncenter-based Services\n• Residential Services\n• Crisis Services\nThe department received public comment via Town Hall on the first four of these chapters in 2021 and 2022. The draft of the new Crisis Services Chapter, the fifth and final service-specific chapter, will be available on Town Hall for public comment late this summer 2023. Note that current drafts incorporate the requirements of the current separate Chapter 46 (12VAC35-46), Regulations for Children’s Residential Facilities.",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 100,
              ),
              20.ph,
              CustomSimpleText(
                text: "RAP Membership and Public Comment",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
              ),
              10.ph,
              CustomSimpleText(
                text:
                    "• DBHDS invited individuals from state agency partners and providers around the state to have balanced representation on the panel.",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 20,
              ),
              CustomSimpleText(
                text:
                    "• Information from the three meetings (6/20, 6/27/ and 7/11) can be found here: https://www.townhall.virginia.gov/L/Meetings.cfm?BoardID=65.",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 20,
              ),
              CustomSimpleText(
                text:
                    "• The draft chapters reviewed by the RAP are posted below. Please keep in mind that once submitted to the State Board of Behavioral Health and Developmental Services for formal action (currently planned for December), additional comment forums will be part of the official regulatory process. In other words, the RAP was not the last time to provide feedback.",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 50,
              ),
              15.ph,
              CustomSimpleText(
                text:
                    "2023 Office of Licensing Overhaul Regulatory Advisory Panel",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 50,
              ),
              15.ph,
              CustomSimpleText(
                text:
                    "Previous Chapter Drafts Reviewed During the 2023 Overhaul RAP",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 50,
              ),
              15.ph,
              CustomSimpleText(
                text:
                    "(Note: These drafts are out of date as they are currently under revision based on comments.)",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 50,
              ),
              CustomRichText(
                  text: " General Chapter – Third Revision",
                  date: '',
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://www.figma.com/exit?url=https%3A%2F%2Fdbhds.virginia.gov%2Fwp-content%2Fuploads%2F2023%2F06%2FGeneralChapter.THIRD_.rev_.2023RAP.pdf",
                    );
                  }),
              CustomRichText(
                  text: " Case Management – Second Revision",
                  date: '',
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/06/CaseManagementChapter.SECONDrev.2023.RAP_.pdf",
                    );
                  }),
              CustomRichText(
                  text: " Center-based Services – Second Revision",
                  date: '',
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/06/Center-basedChapter.SECONDRev-2023RAP.pdf",
                    );
                  }),
              CustomRichText(
                  text: " Home/Noncenter-based Services – Second Revision",
                  date: '',
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/06/HomeNoncenter-basedChapterSECONDrev2023RAP.pdf",
                    );
                  }),
              CustomRichText(
                  text: " Residential Services – Second Revision",
                  date: '',
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/06/ResidentialChapter.SECONDrev.2023RAP.pdf",
                    );
                  }),
              CustomSimpleText(
                text: "• Crisis Services – To come: Initial Draft",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
              ),
              CustomRichText(
                  text:
                      " All other previous overhaul drafts and public comment forums since 2019 can be viewed",
                  date: ' here.',
                  textDecoration2: TextDecoration.underline,
                  textDecoration1: TextDecoration.none,
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://www.figma.com/exit?url=https%3A%2F%2Fwww.townhall.virginia.gov%2FL%2FGeneralNotice.cfm%3FBoardID%3D65%26DateSelection%3DExpired",
                    );
                  }),
              20.ph,
              CustomDivider(),
              20.ph,
              CustomSimpleText(
                text: "REGULATIONS & GUIDANCE",
                fontSize: AppSizes.size24,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 50,
                alignment: Alignment.center,
              ),
              20.ph,
              Image.asset(
                AppAssets.relations,
                height: 165,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              20.ph,
              CustomRichText(
                  text:
                      "The State Board of Behavioral Health and Developmental Services approved this ",
                  date: ' Exempt Action ',
                  text1:
                      "to amend 12VAC35-105 to incorporate federal mobile Medication Assisted Treatment (MAT) requirements into Virginia regulations.",
                  textDecoration2: TextDecoration.underline,
                  textDecoration1: TextDecoration.none,
                  dotNeedOrNot: false,
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://townhall.virginia.gov/L/ViewAction.cfm?actionid=6152",
                    );
                  }),
              CustomRichText(
                  text:
                      "Please note that the action will not be fully visible ",
                  date: ' here ',
                  text1:
                      "until the Office of the Attorney General completes and certifies its review, a date that is unknown at this time.",
                  textDecoration2: TextDecoration.underline,
                  textDecoration1: TextDecoration.none,
                  dotNeedOrNot: false,
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://r20.rs6.net/tn.jsp?f=0017oIteWtGkquLbNx9vTHrZhA98USrHfhbxcrnc1M_XrbuVXIk8TWwbXkYoOD07r9yeQxgoZ3WB3IXYoBY0CYKYsVD0Dgxb1axWzrxcfAquiGTPQc1EwY3MiAHeOC2TyPC7k9WL_Mj6mPsEH0ydmLlCvF58iUo88aHkMAjIGECrYS0QNdGjFv-u3zgjFNwIFDSsVOJ1ehLtRU=&c=Kkm8eoCUTtOLVRcrVsge3LDoLVnC4NiodmJJyIFyXfHpu6wzYL9RbQ==&ch=-GuOtguAl42eGzUWPn2Ww2m327IOUUiFEPQ4QHSFyXCCMOsrtYcDlg==",
                    );
                  }),
              CustomRichText(
                  text:
                      "For more information about exempt regulatory actions, please visit the ",
                  date: ' Virginia Regulatory Town Hall ',
                  text1: "website.",
                  textDecoration2: TextDecoration.underline,
                  textDecoration1: TextDecoration.none,
                  dotNeedOrNot: false,
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://r20.rs6.net/tn.jsp?f=0017oIteWtGkquLbNx9vTHrZhA98USrHfhbxcrnc1M_XrbuVXIk8TWwbXkYoOD07r9yZTdMS_OmYufqAvNitzBUi4v5eUWRYKMo00EXRb_2MBigtNOiXvfBoxKfkgyEgZhCl-y8VVNiJYY1Ofsnmc8NLV3AvMUNzWMxAnK7KAi11j8=&c=Kkm8eoCUTtOLVRcrVsge3LDoLVnC4NiodmJJyIFyXfHpu6wzYL9RbQ==&ch=-GuOtguAl42eGzUWPn2Ww2m327IOUUiFEPQ4QHSFyXCCMOsrtYcDlg==",
                    );
                  }),
              20.ph,
              CustomSimpleText(
                text: "Public Comment Requested",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 50,
                alignment: Alignment.centerLeft,
              ),
              20.ph,
              CustomSimpleText(
                text: "There are no public comment forums at this time.",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 50,
                alignment: Alignment.centerLeft,
              ),
              20.ph,
              CustomSimpleText(
                text: "Regulations",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 50,
                alignment: Alignment.centerLeft,
              ),
              20.ph,
              CustomRichText(
                  text:
                      " Rules and Regulations For Licensing Providers by the Department of Behavioral Health and Developmental Services [12 VAC 35 ‑ 105]",
                  date: '',
                  text1: "",
                  textDecoration2: TextDecoration.underline,
                  textDecoration1: TextDecoration.underline,
                  dotNeedOrNot: true,
                  textDecoration3: TextDecoration.underline,
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://law.lis.virginia.gov/admincode/title12/agency35/chapter105/",
                    );
                  }),
              CustomRichText(
                  text:
                      " Regulations for Children’s Residential Facilities 12VAC35-46",
                  date: '',
                  text1: "",
                  textDecoration2: TextDecoration.underline,
                  textDecoration1: TextDecoration.underline,
                  dotNeedOrNot: true,
                  textDecoration3: TextDecoration.underline,
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://law.lis.virginia.gov/admincode/title12/agency35/chapter46/",
                    );
                  }),
              CustomRichText(
                  text:
                      " Emergency/NOIRA:12VAC35-46. Regulations for Children’s Residential Facilities (adding 12VAC35-46-1260, 12VAC35-46-1270) Effective January 10, 2022 – January 8, 2024",
                  date: '',
                  text1: "",
                  textDecoration2: TextDecoration.underline,
                  textDecoration1: TextDecoration.underline,
                  dotNeedOrNot: true,
                  textDecoration3: TextDecoration.underline,
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url:
                          "https://register.dls.virginia.gov/details.aspx?id=10028",
                    );
                  }),
              20.ph,
              CustomSimpleText(
                text: "Guidance",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 50,
                alignment: Alignment.centerLeft,
              ),
              20.ph,
              CustomRichText(
                  text: " LIC 16: Guidance for A Quality Improvement Program ",
                  date: '(November 2020)',
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
                          "https://www.figma.com/exit?url=https%3A%2F%2Fwww.townhall.virginia.gov%2FL%2FViewGDoc.cfm%3Fgdid%3D6414",
                    );
                  }),
              CustomRichText(
                  text: " LIC 17: Guidance for Serious Incident Reporting ",
                  date: '(November 2020)',
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
                          "https://www.figma.com/exit?url=https%3A%2F%2Fwww.townhall.virginia.gov%2FL%2FViewGDoc.cfm%3Fgdid%3D6415",
                    );
                  }),
              CustomRichText(
                  text:
                      " LIC 18: Individuals with Developmental Disabilities with High Risk Health Conditions ",
                  date: '(June 2020 )',
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
                          "https://www.figma.com/exit?url=https%3A%2F%2Fwww.townhall.virginia.gov%2FL%2FViewGDoc.cfm%3Fgdid%3D6837",
                    );
                  }),
              CustomRichText(
                  text: " LIC 19: Corrective Action Plans (CAPs) ",
                  date: '(August 2020)',
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
                          "https://www.figma.com/exit?url=https%3A%2F%2Fwww.townhall.virginia.gov%2FL%2FViewGDoc.cfm%3Fgdid%3D6875",
                    );
                  }),
              CustomRichText(
                  text: " LIC 20: Guidance on Incident Reporting Requirements ",
                  date: '(August 2020)',
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
                          "https://www.figma.com/exit?url=https%3A%2F%2Fwww.townhall.virginia.gov%2FL%2FViewGDoc.cfm%3Fgdid%3D6876",
                    );
                  }),
              CustomRichText(
                  text: " LIC 21: Guidance for Risk Management ",
                  date: '(August 2020)',
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
                          "https://www.figma.com/exit?url=https%3A%2F%2Fwww.townhall.virginia.gov%2FL%2FViewGDoc.cfm%3Fgdid%3D6874",
                    );
                  }),
              20.ph,
              CustomRichText(
                  text: "Policy and Form Templates ",
                  date: 'Coming Soon!',
                  text1: "",
                  textDecoration1: TextDecoration.none,
                  textDecoration2: TextDecoration.none,
                  textDecoration3: TextDecoration.underline,
                  dotNeedOrNot: false,
                  textColor2: Colors.red,
                  onPress: null),
              20.ph,
              CustomSimpleText(
                text:
                    "These are not required templates; however, utilization of these templates will assist providers in achieving compliance with the regulatory requirements.",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 50,
                alignment: Alignment.centerLeft,
                heightOfStyle: 1.2,
              ),
              15.ph,
              CustomDivider(),
              15.ph,
              CustomSimpleText(
                text: "TRAININGS AND TECHNICAL ASSISTANCE",
                fontSize: AppSizes.size24,
                color: AppColors.white,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.normal,
                maxLines: 50,
                alignment: Alignment.centerLeft,
              ),
              15.ph,
              CustomSimpleText(
                text: "BEHAVIORAL HEALTH ENHANCEMENT AND ASAM",
                fontSize: AppSizes.size14,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 50,
                alignment: Alignment.centerLeft,
              ),
              20.ph,
              CustomRichText(
                  text:
                      " OL Approval of Behavioral Health Link Assessment (BHL) Tool for Crisis Services (November 2021) ",
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
                          "https://www.figma.com/exit?url=https%3A%2F%2Fdbhds.virginia.gov%2Fwp-content%2Fuploads%2F2022%2F08%2FOL-approval-of-BHL-tool-for-crisis-services-11-21.pdf",
                    );
                  }),
              CustomRichText(
                  text:
                      " Aligning the Licensing Regulations with ASAM Criteria Training (April 2021)",
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
                          "https://dbhds.virginia.gov/assets/doc/QMD/OL/aligning-the-licensing-regulations-with-the-asam-criteria-4.19.21.pdf",
                    );
                  }),
              CustomRichText(
                  text:
                      " Memo Behavioral Health Enhancement and American Society of Addiction Medicine (March 2021)",
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
                          "https://dbhds.virginia.gov/assets/doc/QMD/OL/bhe-emergency-regulation-memo.pdf",
                    );
                  }),
              CustomRichText(
                  text: " ICT/ACT Licensing Requirements Crosswalk",
                  date: '(March 2021)',
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
                          "https://dbhds.virginia.gov/assets/doc/QMD/OL/act-ict-licensing-requirements-crosswalk.pdf",
                    );
                  }),
              15.ph,
              CustomSimpleText(
                text:
                    "QUALITY IMPROVEMENT-RISK MANAGEMENT RESOURCES FOR LICENSED PROVIDERS",
                fontSize: AppSizes.size14,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 50,
                alignment: Alignment.centerLeft,
              ),
              15.ph,
              CustomSimpleText(
                text: "Recorded Trainings",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 50,
                alignment: Alignment.centerLeft,
              ),
              20.ph,
              CustomRichText(
                  text:
                      " Risk Management & Quality Improvement Strategies Training by the Center for Developmental Disabilities Evaluation & Research – Recorded Webinar (December 2020)",
                  date: '',
                  text1: "",
                  textDecoration1: TextDecoration.underline,
                  textDecoration2: TextDecoration.none,
                  textDecoration3: TextDecoration.underline,
                  dotNeedOrNot: true,
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url: "https://www.youtube.com/watch?v=NiFyfOjXalI",
                    );
                  }),
              CustomRichText(
                  text:
                      " QI-RM-RCA Webinar Recording December 2021 (February 2022)",
                  date: '',
                  text1: "",
                  textDecoration1: TextDecoration.underline,
                  textDecoration2: TextDecoration.none,
                  textDecoration3: TextDecoration.underline,
                  dotNeedOrNot: true,
                  onPress: () async {
                    RouteGenerator.gotoWebPage(
                      context: context,
                      pageTitle: '',
                      url: "https://www.youtube.com/watch?v=9YepYqRiLzg",
                    );
                  }),
              20.ph,
              CustomSimpleText(
                text: "Root Cause Analysis – 12VAC35-105-160.E.2",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal,
                maxLines: 50,
                alignment: Alignment.centerLeft,
              ),
              5.ph,
              CustomRichText(
                  text: " Sample(s)",
                  date: '',
                  text1: "",
                  textDecoration1: TextDecoration.none,
                  textDecoration2: TextDecoration.none,
                  textDecoration3: TextDecoration.none,
                  dotNeedOrNot: true,
                  onPress: null),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    CustomRichText(
                        text:
                            " Serious Incident Review and RCA Template Example 5 Whys Stories Victor",
                        date: '(July 2023)',
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/12/Serious-Incident-Review-and-RCA-Template-Example-5-Whys-Stories-Victor-July-2023.pdf",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Serious Incident Review and RCA Template Example 5 Whys Stories Billy",
                        date: '(June 2023)',
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/12/Serious-Incident-Review-and-RCA-template_Example_5-Whys-Stories_Billy.pdf",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Serious Incident Review and RCA Template Example 5 Whys Stories Jasmin",
                        date: '(June 2023)',
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/12/Serious-Incident-Review-and-RCA-template_Example_5-Whys-Stories_Jasmine.pdf",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Serious Incident Review and RCA Template Example 5 Whys Stories Sam",
                        date: '(June 2023)',
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/12/Serious-Incident-Review-and-RCA-template_Example_5-Whys-Stories_SAM.pdf",
                          );
                        }),
                    CustomRichText(
                        text: " Sample Root Cause Analysis Policy ",
                        date: '(June 2023)',
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2022/02/SAMPLE-RCA-Policy-02-2022.pdf",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Serious Incident Review and Root Cause Analysis Template  ",
                        date: '(June 2023)',
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/11/Serious-Incident-Review-and-Root-Cause-Analysis-Template-November-2023-1.pdf",
                          );
                        }),
                  ],
                ),
              ),
              5.ph,
              CustomRichText(
                  text: " Training(s)",
                  date: '',
                  text1: "",
                  textDecoration1: TextDecoration.none,
                  textDecoration2: TextDecoration.none,
                  textDecoration3: TextDecoration.none,
                  dotNeedOrNot: true,
                  onPress: null),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    CustomRichText(
                        text: " Flow-Chart Incident Reviews (April 2023)",
                        date: '',
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/03/Flow-Chart_Incident-Review_April-2023.pdf",
                          );
                        }),
                    CustomRichText(
                        text: " QI-RM-RCA Webinar (December 2021)",
                        date: '',
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
                                "https://dbhds.virginia.gov/assets/doc/QMD/OL/regulatory-compliance-with-qi-rm-rca-2021-12-16-21-presentation.pdf",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Regulatory Compliance with Root Cause Analysis Regulations Training (December 2021)",
                        date: '',
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
                                "https://dbhds.virginia.gov/library/licensing/2022/Regulatory%20Compliance%20with%20RCA%20Regulations%2012-21%20.pdf",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Risk Management & Quality Improvement Strategies Training by the Center for Developmental Disabilities Evaluation and Research – Handout (December 2020)",
                        date: '',
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
                                "https://dbhds.virginia.gov/assets/doc/QMD/OL/va-dbhds-risk-management-webinar-final-12-10-2020-handout-with-notes-(1).pdf",
                          );
                        }),
                    CustomRichText(
                        text: " Root Cause Analysis Training (October 2020)",
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/02/Root-Cause-Analysis_October-2020.pdf",
                          );
                        }),
                  ],
                ),
              ),
              5.ph,
              CustomRichText(
                  text: " FAQs",
                  date: '',
                  text1: "",
                  textDecoration1: TextDecoration.none,
                  textDecoration2: TextDecoration.none,
                  textDecoration3: TextDecoration.none,
                  dotNeedOrNot: true,
                  onPress: null),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    CustomRichText(
                        text: " Root Cause Analysis Q&A’s (Updated July 2022)",
                        date: '',
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
                                "https://dbhds.virginia.gov/library/licensing/2022/Frequently%20Asked%20Questions%2012VAC35-105-160.E%20(1).pdf",
                          );
                        }),
                  ],
                ),
              ),
              15.ph,
              CustomDivider(),
              15.ph,
              CustomSimpleText(
                text: "Risk Management – 12VAC35-105-520",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w500,
                maxLines: 50,
                alignment: Alignment.centerLeft,
              ),
              5.ph,
              CustomSimpleText(
                text: "• Attestation",
                fontSize: AppSizes.size12,
                color: AppColors.white,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w500,
                maxLines: 50,
                alignment: Alignment.centerLeft,
              ),
              20.ph,
              CustomRichText(
                  text: " Sample(s)",
                  date: '',
                  text1: "",
                  textDecoration1: TextDecoration.none,
                  textDecoration2: TextDecoration.none,
                  textDecoration3: TextDecoration.none,
                  dotNeedOrNot: true,
                  onPress: null),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    CustomRichText(
                        text:
                            " Systemic Risk Assessment Sample 1 Non Residential Provider",
                        date: '(August 2023)',
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/08/Systemic-Risk-Assessment-Sample-1-Non-Residential-Provider-August-2023.pdf",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Systemic Risk Assessment Sample 2 Provider of a 4-Bed Group Home ",
                        date: '(August 2023)',
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/08/Systemic-Risk-Assessment-Sample-2-Provider-of-a-4-Bed-Group-Home-August-2023.pdf",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Systemic Risk Assessment Sample 3 Intensive In Home Service Provider ",
                        date: '(August 2023)',
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/08/Systemic-Risk-Assessment-Sample-3-Intensive-In-Home-Service-Provider-August-2023.pdf",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Systemic Risk Assessment Sample 4 Medication Assistance Service",
                        date: ' (August 2023)',
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/08/Systemic-Risk-Assessment-Sample-4-Medication-Assistance-Services-August-2023.pdf",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Sample Provider Risk Management Plan (June 2021)",
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
                                "https://dbhds.virginia.gov/assets/doc/QMD/OL/sample-provider-risk-management-plan-6-2021.pdf",
                          );
                        }),
                  ],
                ),
              ),
              20.ph,
              CustomRichText(
                  text: " Tools and Templates",
                  date: '',
                  text1: "",
                  textDecoration1: TextDecoration.none,
                  textDecoration2: TextDecoration.none,
                  textDecoration3: TextDecoration.none,
                  dotNeedOrNot: true,
                  onPress: null),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    CustomRichText(
                        text: " Individual Risk Tracking Tool (April 2023)",
                        date: '',
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
                                "https://view.officeapps.live.com/op/view.aspx?src=https%3A%2F%2Fdbhds.virginia.gov%2Fwp-content%2Fuploads%2F2023%2F05%2FIndividual-Risk-Tracking-Tool-April-2023.xlsx&wdOrigin=BROWSELINK",
                          );
                        }),
                    CustomRichText(
                        text: " Monthly Risk Tracking Tool (April 2023)",
                        date: '',
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
                                "https://view.officeapps.live.com/op/view.aspx?src=https%3A%2F%2Fdbhds.virginia.gov%2Fwp-content%2Fuploads%2F2023%2F05%2FMonthly-Risk-Tracking-Tool-April-2023.xlsx&wdOrigin=BROWSELINK",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Instructional Video-Risk Tracking Tool (April 2023)",
                        date: '',
                        text1: "",
                        textDecoration1: TextDecoration.underline,
                        textDecoration2: TextDecoration.none,
                        textDecoration3: TextDecoration.underline,
                        dotNeedOrNot: true,
                        onPress: () async {
                          RouteGenerator.gotoWebPage(
                            context: context,
                            pageTitle: '',
                            url: "https://www.youtube.com/watch?v=6u9ouDVulec",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Serious Incident Review and Root Cause Analysis Template (November 2023)",
                        date: '',
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/11/Serious-Incident-Review-and-Root-Cause-Analysis-Template-November-2023-1.pdf",
                          );
                        }),
                    CustomRichText(
                        text: " Systemic Risk Assessment Template (April 2023)",
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/05/Systemic-Risk-Assessment-Template_fillable-with-examples.pdf",
                          );
                        }),
                  ],
                ),
              ),
              20.ph,
              CustomRichText(
                  text: " Training(s)",
                  date: '',
                  text1: "",
                  textDecoration1: TextDecoration.none,
                  textDecoration2: TextDecoration.none,
                  textDecoration3: TextDecoration.none,
                  dotNeedOrNot: true,
                  onPress: null),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    CustomRichText(
                        text:
                            " Day 1: Minimizing Risk Session 1 Webinar (April 2023)",
                        date: '',
                        text1: "",
                        textDecoration1: TextDecoration.underline,
                        textDecoration2: TextDecoration.none,
                        textDecoration3: TextDecoration.underline,
                        dotNeedOrNot: true,
                        onPress: () async {
                          RouteGenerator.gotoWebPage(
                            context: context,
                            pageTitle: '',
                            url: "https://www.youtube.com/watch?v=KoYiYAkF808",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Minimizing Risk Session 1 PowerPoint (April 2023)",
                        date: '',
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
                                "https://dbhds.virginia.gov/assets/Office-of-Licensing/2023/Minimizing%20Risk%20Session%201%20PowerPoint%20(April%202023).pdf",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Day 2: Minimizing Risk Session 2 Webinar (April 2023)",
                        date: '',
                        text1: "",
                        textDecoration1: TextDecoration.underline,
                        textDecoration2: TextDecoration.none,
                        textDecoration3: TextDecoration.underline,
                        dotNeedOrNot: true,
                        onPress: () async {
                          RouteGenerator.gotoWebPage(
                            context: context,
                            pageTitle: '',
                            url: "https://www.youtube.com/watch?v=Ru14NHoaiVE",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Minimizing Risk Session 2 PowerPoint (April 2023)",
                        date: '',
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
                                "https://dbhds.virginia.gov/assets/Office-of-Licensing/2023/Minimizing%20Risk%20Session%202%20PowerPoint%20(April%202023).pdf",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Day 3: Minimizing Risk Session 3 Webinar (April 2023)",
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
                                "https://www.youtube.com/watch?v=zntmZXu1Zoo&feature=youtu.be",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Minimizing Risk Session 3 PowerPoint (April 2023)",
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
                                "https://dbhds.virginia.gov/assets/Office-of-Licensing/2023/Minimizing%20Risk_Day3_FINAL%20(1).pdf",
                          );
                        }),
                    CustomRichText(
                        text: " Flow-Chart Incident Reviews (April 2023)",
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/05/Flow-Chart_Incident-Review_April-2023.pdf",
                          );
                        }),
                    CustomRichText(
                        text: " QI-RM-RCA Webinar (December 2021)",
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
                                "https://dbhds.virginia.gov/assets/doc/QMD/OL/regulatory-compliance-with-qi-rm-rca-2021-12-16-21-presentation.pdf",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Regulatory Compliance with Risk Management Regulations Training (December 2021)",
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
                                "https://dbhds.virginia.gov/library/licensing/2022/Regulatory%20Compliance%20with%20Risk%20Management%20Regulation%2012-21.pdf",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Risk Management Tips and Tools Training (June 2021)",
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
                                "https://dbhds.virginia.gov/library/licensing/2022/Risk%20Management%20Tips%20and%20Tools%20June%202021%20Updated%20June%202022.pdf",
                          );
                        }),
                    CustomRichText(
                        text:
                            " Risk Management & Quality Improvement Strategies Training by the Center for Developmental Disabilities Evaluation & Research – Recorded Webinar (December 2020)",
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
                            url: "https://www.youtube.com/watch?v=NiFyfOjXalI",
                          );
                        }),
                    CustomRichText(
                        text: " Risk Management Training (November 2020)",
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
                                "https://dbhds.virginia.gov/library/licensing/2022/Risk%20Management%20Training%20November%202020.pdf",
                          );
                        }),
                  ],
                ),
              ),
              20.ph,
              CustomRichText(
                  text: " Care Concerns",
                  date: '',
                  text1: "",
                  textDecoration1: TextDecoration.none,
                  textDecoration2: TextDecoration.none,
                  textDecoration3: TextDecoration.none,
                  dotNeedOrNot: true,
                  onPress: null),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    CustomRichText(
                        text: " 2023 Care Concern Threshold Criteria Memo ",
                        date: '(February 2023)',
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/02/2023-Care-Concern-Thresholds-Criteria_OL-MEMO_final.pdf",
                          );
                        }),
                    CustomRichText(
                        text: " IMU Care Concern PowerPoint Training ",
                        date: '(February 2023)',
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
                                "https://dbhds.virginia.gov/assets/Office-of-Licensing/2023/IMU_Care%20Concern%20PowerPoint%20Training_Effective%201.1.2023_Final.pdf",
                          );
                        }),
                    CustomRichText(
                        text: " Risk Triggers and Threshold Handout ",
                        date: '(February 2023)',
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
                                "https://dbhds.virginia.gov/wp-content/uploads/2023/02/Risk-Triggers-and-Thresholds-Handout-1.1.23.pdf",
                          );
                        }),
                  ],
                ),
              ),
              20.ph,
              CustomRichText(
                  text: " FAQ",
                  date: '',
                  text1: "",
                  textDecoration1: TextDecoration.none,
                  textDecoration2: TextDecoration.none,
                  textDecoration3: TextDecoration.none,
                  dotNeedOrNot: true,
                  onPress: null),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    CustomRichText(
                        text: " Risk Management Q&A’s (Updated July 2022)",
                        date: '',
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
                                "https://dbhds.virginia.gov/library/licensing/2022/Frequently%20Asked%20Questions%2012VAC35-105-520%20(1).pdf",
                          );
                        }),
                  ],
                ),
              ),
              15.ph,
              CustomDivider(),
              15.ph,
              CustomSimpleText(
                text: "Monitoring and Evaluating Service Quality – Quality Improvement – 12VAC35-105-620",
                textAlign: TextAlign.start,
                alignment: Alignment.center,
                color: AppColors.white,
                fontSize: AppSizes.size12,
                fontWeight: FontWeight.normal,
              ),
              CustomRichText(
                  text: " Memo(s)",
                  date: '',
                  text1: "",
                  textDecoration1: TextDecoration.none,
                  textDecoration2: TextDecoration.none,
                  textDecoration3: TextDecoration.none,
                  dotNeedOrNot: true,
                  onPress: null),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    CustomRichText(
                        text: " Tracking of Level I Serious Incidents vs Baseline Behaviors Memo",
                        date: ' (February 2023)',
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
                            "https://dbhds.virginia.gov/wp-content/uploads/2023/02/Tracking-of-Level-I-Serious-Incidents-vs.-Baseline-Behaviors-Memo.pdf",
                          );
                        }),
                  ],
                ),
              ),
              15.ph,
              CustomRichText(
                  text: " Sample(s)",
                  date: '',
                  text1: "",
                  textDecoration1: TextDecoration.none,
                  textDecoration2: TextDecoration.none,
                  textDecoration3: TextDecoration.none,
                  dotNeedOrNot: true,
                  onPress: null),
              15.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    CustomRichText(
                        text: " Tools for Developing a Quality Improvement Program (February 2022)",
                        date: '',
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
                            "https://dbhds.virginia.gov/wp-content/uploads/2022/02/Tools-for-Developing-a-Quality-Improvement-Program-02.2022.pdf",
                          );
                        }),
                    CustomRichText(
                        text: " Sample Provider Quality Improvement Plan (June 2021)",
                        date: '',
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
                            "https://dbhds.virginia.gov/assets/doc/QMD/OL/sample-provider-quality-improvement-plan-6-2021.pdf",
                          );
                        }),
                  ],
                ),
              ),
              15.ph,
              CustomRichText(
                  text: " Training(s)",
                  date: '',
                  text1: "",
                  textDecoration1: TextDecoration.none,
                  textDecoration2: TextDecoration.none,
                  textDecoration3: TextDecoration.none,
                  dotNeedOrNot: true,
                  onPress: null),
              15.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    CustomRichText(
                        text: " QI-RM-RCA Webinar (December 2021)",
                        date: '',
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
                            "https://dbhds.virginia.gov/assets/doc/QMD/OL/regulatory-compliance-with-qi-rm-rca-2021-12-16-21-presentation.pdf",
                          );
                        }),
                    CustomRichText(
                        text: " Regulatory Compliance with Quality Improvement Regulations Training (December 2021)",
                        date: '',
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
                            "https://dbhds.virginia.gov/library/licensing/2022/Regulatory%20Compliance%20with%20Quality%20Improvement%20Regulations%2012-21.pdf",
                          );
                        }),
                    CustomRichText(
                        text: " Quality Improvement Tips and Tools Training (June 2021)",
                        date: '',
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
                            "https://dbhds.virginia.gov/library/licensing/2022/Quality%20Improvement%20Tips%20and%20Tools%206-2021%20(10).pdf",
                          );
                        }),
                    CustomRichText(
                        text: " Risk Management & Quality Improvement Strategies Training by the Center for Developmental Disabilities Evaluation & Research – Recorded Webinar (December 2020)",
                        date: '',
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
                            "https://www.youtube.com/watch?v=NiFyfOjXalI",
                          );
                        }),
                    CustomRichText(
                        text: " Quality Improvement Training (November 2020)",
                        date: '',
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
                            "https://dbhds.virginia.gov/library/licensing/2022/Quality%20Improvement%20Training%20November%202022.pdf",
                          );
                        }),

                  ],
                ),
              ),
              5.ph,
              CustomRichText(
                  text: " FAQs",
                  date: '',
                  text1: "",
                  textDecoration1: TextDecoration.none,
                  textDecoration2: TextDecoration.none,
                  textDecoration3: TextDecoration.none,
                  dotNeedOrNot: true,
                  onPress: null),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    CustomRichText(
                        text: " Quality Improvement Q&A’s (Updated June 2022)",
                        date: '',
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
                            "https://dbhds.virginia.gov/library/licensing/2022/Frequently%20Asked%20Questions%2012VAC35-105-620%20(1).pdf",
                          );
                        }),
                  ],
                ),
              ),
              15.ph,
              CustomDivider(),
              15.ph,
              CustomSimpleText(
                text: "Additional Trainings",
                textAlign: TextAlign.start,
                alignment: Alignment.centerLeft,
                color: AppColors.white,
                fontSize: AppSizes.size12,
                fontWeight: FontWeight.normal,
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    CustomRichText(
                        text: " Licensed Provider Coaching Seminar I",
                        date: '',
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
                            "https://dbhds.virginia.gov/assets/Office-of-Licensing/2023/Licensed%20Provider%20Coaching%20Seminar%20I%20(June%202023).pdf",
                          );
                        }),
                    CustomRichText(
                        text: " Licensed Provider Coaching Seminar I YouTube Video",
                        date: '',
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
                            "https://www.youtube.com/watch?v=ko8LxgC74Lw",
                          );
                        }),
                    CustomRichText(
                        text: " Licensed Provider Coaching Seminar II",
                        date: '',
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
                            "https://dbhds.virginia.gov/assets/Office-of-Licensing/2023/Licensed%20Provider%20Coaching%20Seminar%20II%20(July%202023).pdf",
                          );
                        }),
                    CustomRichText(
                        text: " Licensed Provider Coaching Seminar II YouTube Video",
                        date: '',
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
                            "https://www.youtube.com/watch?v=UgVCX-Ra8T0",
                          );
                        }),
                    CustomRichText(
                        text: " Licensed Provider Coaching Seminar III",
                        date: '',
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
                            "https://dbhds.virginia.gov/assets/Office-of-Licensing/2023/Licensed%20Provider%20Coaching%20Seminar%20III%20(July%202023).pdf",
                          );
                        }),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CustomDivider() {
    return Column(
      children: [
        const Divider(height: 0.0, thickness: 1.0),
        5.ph,
        const Divider(height: 0.0, thickness: 1.0),
      ],
    );
  }

  Widget CustomRichText({
    required String text,
    String? text1,
    required String date,
    VoidCallback? onPress,
    TextDecoration? textDecoration2,
    TextDecoration? textDecoration1,
    TextDecoration? textDecoration3,
    Color? textColor1,
    Color? textColor2,
    Color? textColor3,
    bool? dotNeedOrNot,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onPress,
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                text: dotNeedOrNot == false ? "" : '•',
                style: GoogleFonts.roboto(
                  letterSpacing: 0.2,
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.transparent,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: text,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        decoration: textDecoration1 ?? TextDecoration.underline,
                        color: textColor1 ?? Colors.white,
                      )),
                  TextSpan(
                      text: date,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        decoration: textDecoration2 ?? TextDecoration.none,
                        color: textColor2 ?? Colors.white,
                      )),
                  TextSpan(
                      text: text1,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        decoration: textDecoration3 ?? TextDecoration.none,
                        color: textColor3 ?? Colors.white,
                      )),
                ],
              ),
            ),
          ),
        ),
        5.ph,
      ],
    );
  }
}
