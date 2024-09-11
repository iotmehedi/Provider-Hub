import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider_hub/const/utils/consts/app_assets.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../const/routes/router.dart';
import '../../../../../../const/utils/consts/app_colors.dart';
import '../../../../../../const/utils/consts/app_sizes.dart';
import '../../../../../widget/custom_appbar/custom_appbar.dart';
import '../../../../../widget/custom_simple_text/custom_simple_text.dart';
import 'licensing_page.dart';

class BiuScreen extends StatelessWidget {
  const BiuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: "BIU",
        needTitleCenter: false,
        textColor: AppColors.white,
        fontSize: AppSizes.size24,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            10.ph,
            CustomSimpleText(
              text: "Background Investigations Unit – New",
              textAlign: TextAlign.center,
              alignment: Alignment.center,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomDivider(),
            15.ph,
            Row(
              children: [
                Image.asset(
                  AppAssets.biu,
                  height: AppSizes.newSize(12.7),
                  width: AppSizes.newSize(11.8),
                ),
                20.pw,
                Expanded(
                  child: CustomSimpleText(
                    text: "Code of Virginia Requirements",
                    textAlign: TextAlign.start,
                    alignment: Alignment.centerLeft,
                    color: AppColors.white,
                    fontSize: AppSizes.size24,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            15.ph,
            CustomRichText(
                text: "Under ",
                date: '§37.2-416',
                text1:
                    " of the Code of Virginia, every DBHDS-licensed provider shall require any applicant who accepts employment in a direct consumer care position (or supervises a direct consumer care position) to undergo fingerprinting and a criminal background check. Private providers who have received preliminary approval by the Office of Licensing of their licensing application policies, procedures and forms, may then register with the Background Investigations Unit as referenced below.",
                alignment: Alignment.center,
                textDecoration1: TextDecoration.none,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.none,
                dotNeedOrNot: false,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'BIU Rights Trainings',
                    url:
                        "http://law.lis.virginia.gov/vacode/title37.2/chaper4/section37.2-416",
                  );
                }),
            15.ph,
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "All DBHDS licensed providers (Adult and Children) are required to initiate checks of child abuse and neglect for applicants through the ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppSizes.size12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text:
                          "Virginia Department of Social Services (VDSS) Central Registry.",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppSizes.size12,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          RouteGenerator.gotoWebPage(
                            context: context,
                            pageTitle: 'BIU',
                            url: "http://www.dss.virginia.gov",
                          );
                        },
                    ),
                    TextSpan(
                      text: "Obtain the required ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppSizes.size12,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    TextSpan(
                      text: "Central Registry form ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppSizes.size12,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          RouteGenerator.gotoWebPage(
                            context: context,
                            pageTitle: 'BIU',
                            url:
                                "https://dbhds.virginia.gov/assets/document-library/archive/library/licensing/central%20registry%20form.pdf",
                          );
                          // RouteGenerator.gotoWebPage(
                          //   context: context,
                          //   pageTitle: 'BIU Rights Trainings',
                          //   url:
                          //   "https://dbhds.virginia.gov/quality-management/human-rights/resources-for-individuals/",
                          // );
                        },
                    ),
                    TextSpan(
                      text: "from the VDSS web site or email ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppSizes.size12,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    TextSpan(
                      text: "crs_operations@dss.virginia.gov.",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppSizes.size12,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          _sendEmail("crs_operations@dss.virginia.gov");
                        },
                    ),
                  ],
                ),
              ),
            ),
            15.ph,
            CustomDivider(),
            15.ph,
            Center(
              child: Container(
                // height: 42,
                width: MediaQuery.of(context).size.width * 0.6,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue),
                child: Column(
                  children: [
                    CustomSimpleText(
                      alignment: Alignment.center,
                      text: "PROCEDURES FOR CONDUCTING",
                      fontSize: AppSizes.size16,
                      color: AppColors.white,
                      textAlign: TextAlign.center,
                      maxLines: 8,
                    ),
                    5.ph,
                    CustomSimpleText(
                      alignment: Alignment.center,
                      text: "BACKGROUND INVERTIGATIONS",
                      fontSize: AppSizes.size16,
                      color: AppColors.white,
                      textAlign: TextAlign.center,
                      maxLines: 8,
                    ),
                  ],
                ),
              ),
            ),
            15.ph,
            CustomDivider(),
            15.ph,
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.blue),
                child: CustomSimpleText(
                  alignment: Alignment.center,
                  text: "How to Begin Registration".toUpperCase(),
                  fontSize: AppSizes.size16,
                  color: AppColors.white,
                  textAlign: TextAlign.center,
                  maxLines: 8,
                ),
              ),
            ),
            15.ph,
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.blue),
                child: CustomSimpleText(
                  alignment: Alignment.center,
                  text: "Guidance and Procedures".toUpperCase(),
                  fontSize: AppSizes.size16,
                  color: AppColors.white,
                  textAlign: TextAlign.center,
                  maxLines: 8,
                ),
              ),
            ),
            15.ph,
            CustomRichText(
                text: "How to Manage Background Check Contacts on the CONNECT Provider Portal",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: false,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'BIU',
                    url:
                    "https://dbhds.virginia.gov/wp-content/uploads/2022/10/How-to-Manage-Background-Check-Contacts-on-Provider-Portal-1-1-1-1.pdf",
                  );
                }),
            15.ph,
            CustomRichText(
                text: "Implementation of the Fieldprint© Process Presentation [PDF]",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: false,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'BIU',
                    url:
                    "https://dbhds.virginia.gov/assets/doc/hr/biu/fieldprintimplementationpresentationnofpcode.pdf",
                  );
                }),
            20.ph,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  CustomRichText(
                      text:
                      "How to Manage Background Check Contacts on the CONNECT Provider Portal",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'BIU',
                          url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2022/10/How-to-Manage-Background-Check-Contacts-on-Provider-Portal-1-1-1-1.pdf",
                        );
                      }),
                  CustomRichText(
                      text:
                      "Procedures for Conducting Background Investigations",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: null),
                  CustomRichText(
                      text:
                      "Procedures for Conducting Criminal History Record Name and Sex Offender Searches",
                      date: '(June 2023)',
                      text1: "",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: null),
                  CustomRichText(
                      text:
                      "Procedures for Criminal History Records Retention",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: null),
                  CustomRichText(
                      text: "Convictions Requiring Registration in the Sex Offender and Crimes Against Minors Registry ",
                      date: 'http://sex-offender.vsp.virginia.gov/sor/statutes.html',
                      text1: "",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'BIU',
                          url:
                          "http://sex-offender.vsp.virginia.gov/sor/statutes.html",
                        );
                      }),
                  CustomRichText(
                      text:
                      "Legal Terms/Abbreviations",
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
            15.ph,
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue),
                child: CustomSimpleText(
                  alignment: Alignment.center,
                  text: "Request Name and Sex Offender Search".toUpperCase(),
                  fontSize: AppSizes.size16,
                  color: AppColors.white,
                  textAlign: TextAlign.center,
                  maxLines: 8,
                ),
              ),
            ),
            20.ph,
            CustomSimpleText(
              text: "Providers must be registered with the DBHDS Background Investigations Unit prior to requesting a Name and Sex Offender Search.\nPlease note: Name and Sex Offender searches are not done in conjunction with Fingerprint Criminal Background Checks. These searches are only requested on Contractors, Interns, Students and/or Volunteers if required by the provider’s policies and procedures.\nInclude the following in your request for a Name and Sex Offender Search:",
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
                      text:
                      "1. Organization check or money order in the amount of \$25.00",
                      date: '(July 2023)',
                      text1: "",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: false,
                      onPress: null),
                  CustomRichText(
                      text:
                      "2. Make the check or money order out to “Treasurer of Virginia",
                      date: '(June 2023)',
                      text1: "",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: false,
                      onPress: null),
                  CustomRichText(
                      text:
                      "3. Read the ",
                      date: 'BIUSP-167 Procedures',
                      text1: "",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: false,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'BIU',
                          url:
                          "https://dbhds.virginia.gov/assets/doc/hr/biu/form-biusp-167-procedures--072019.pdf",
                        );
                      }),
                  CustomRichText(
                      text:
                      "4. ",
                      date: 'Form BIUSP-167',
                      text1: "– completed by the individual, provider and notary public",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.none,
                      dotNeedOrNot: false,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'BIU',
                          url:
                          "https://dbhds.virginia.gov/assets/doc/hr/biu/form-biusp-167-072019.pdf",
                        );
                      }),
                  20.ph,
                  CustomRichText(
                      text:
                      "For any questions or issues concerning the Name and Sex Offender searches, please e-mail",
                      date: 'Belinda Turner.',
                      text1: "",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.none,
                      dotNeedOrNot: false,
                      onPress: () async {
                        _sendEmail("mailto:belinda.turner@dbhds.virginia.gov?subject=Request%20Name%20and%20Sex%20Offender%20Search");
                      }),
                  15.ph,
                  CustomDivider(),
                  15.ph,
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue),
                      child: CustomSimpleText(
                        alignment: Alignment.center,
                        text: "BIU Contact Information".toUpperCase(),
                        fontSize: AppSizes.size16,
                        color: AppColors.white,
                        textAlign: TextAlign.center,
                        maxLines: 8,
                      ),
                    ),
                  ),
                  20.ph,
                  CustomSimpleText(
                    text: "Mailing Address:",
                    textAlign: TextAlign.start,
                    alignment: Alignment.centerLeft,
                    color: AppColors.white,
                    fontSize: AppSizes.size12,
                    fontWeight: FontWeight.normal,
                  ),
                  15.ph,
                  CustomSimpleText(
                    text: "Virginia Department of Behavioral Health and Developmental ServicesP.O. Box 1797Richmond, VA 23218",
                    textAlign: TextAlign.start,
                    alignment: Alignment.centerLeft,
                    color: AppColors.white,
                    fontSize: AppSizes.size12,
                    fontWeight: FontWeight.normal,
                  ),
                  15.ph,
                  CustomSimpleText(
                    text: "Malinda Roberts, Supervisor\n1220 Bank Street | Richmond, VA 23219Work – \n804-786-6384Cell – ",
                    textAlign: TextAlign.start,
                    alignment: Alignment.centerLeft,
                    color: AppColors.white,
                    fontSize: AppSizes.size12,
                    fontWeight: FontWeight.normal,
                  ),
                  CustomRichText(
                      text:
                      "804-840-9837",
                      date: 'malinda.roberts@dbhds.virginia.gov',
                      text1: "",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.none,
                      dotNeedOrNot: false,
                      onPress: () async {
                        _sendEmail("malinda.roberts@dbhds.virginia.gov");
                      }),
                  15.ph,
                  CustomSimpleText(
                    text: "Belinda Turner, BIU Assistant\n1220 Bank Street | Richmond, VA 23219Work – ",
                    textAlign: TextAlign.start,
                    alignment: Alignment.centerLeft,
                    color: AppColors.white,
                    fontSize: AppSizes.size12,
                    fontWeight: FontWeight.normal,
                  ),
                  CustomRichText(
                      text:
                      "804-887-7393",
                      date: 'belinda.turner@dbhds.virginia.gov',
                      text1: "",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.none,
                      dotNeedOrNot: false,
                      onPress: () async {
                        _sendEmail("belinda.turner@dbhds.virginia.gov");
                      }),
                ],
              ),
            ),
            15.ph,
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue),
                child: CustomSimpleText(
                  alignment: Alignment.center,
                  text: "attachments and forms".toUpperCase(),
                  fontSize: AppSizes.size16,
                  color: AppColors.white,
                  textAlign: TextAlign.center,
                  maxLines: 8,
                ),
              ),
            ),
            20.ph,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  CustomRichText(
                      text:
                      "Form BIUSP-167",
                      date: '– Criminal History Record Name & Sex Offender Search Request',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'BIU',
                          url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/01/Form-BIUSP-167-01_22.pdf",
                        );
                      }),
                  CustomRichText(
                      text:
                      "Attachment 2",
                      date: ' – “Barrier Crimes List"',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'BIU',
                          url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/01/Attachment-2-Barrier-Crimes-01_23.pdf",
                        );
                      }),
                  CustomRichText(
                      text:
                      "Attachment 3",
                      date: ' – Disclosure Statement for Licensed Private Provider Employees',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'BIU',
                          url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/01/Attachment-3-Disclosure-Statement-01_23.pdf",
                        );
                      }),
                  CustomRichText(
                      text:
                      "Attachment 4",
                      date: ' – Authority for Release of Information',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'BIU',
                          url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/01/Attachment-4-Authority-for-Release-of-Information-01_23.pdf",
                        );
                      }),
                  CustomRichText(
                      text:
                      "Attachment 6",
                      date: ' – Applicant’s Rights',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'BIU',
                          url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/01/Attachment-6-Applicants-Rights-01_23.pdf",
                        );
                      }),
                  CustomRichText(
                      text:
                      "Attachment 9",
                      date: ' – Procedures for Challenging Virginia State Police Investigative Results',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'BIU',
                          url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/01/Attachment-9-Procedures-For-Challenging-VA-State-Police-Investigative-Results-1_23.pdf",
                        );
                      }),
                  CustomRichText(
                      text:
                      "Attachment 10a",
                      date: ' – Applicant’s rights and procedures for Challenging FBI Results',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'BIU',
                          url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/01/Attachment-10-a-Applicants-Rights-and-Procedures-For-Challenging-FBI-Rights-01_23.pdf",
                        );
                      }),
                  CustomRichText(
                      text:
                      "Attachment 10b",
                      date: ' – Sample Letter: “Challenging FBI Checks”',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'BIU',
                          url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/01/Attachment-10-b-Sample-Letter-Challenging-FBI-Checks-01_23.pdf",
                        );
                      }),

                ],
              ),
            ),
            15.ph,
            CustomDivider(),
            15.ph,
            CustomSimpleText(
              text: "Click below for help using the CONNECT Provider Portal or to report an issue.",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
            ),

            15.ph,
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.blue),
                child: CustomSimpleText(
                  alignment: Alignment.center,
                  text: "CONNECT Help Desk".toUpperCase(),
                  fontSize: AppSizes.size16,
                  color: AppColors.white,
                  textAlign: TextAlign.center,
                  maxLines: 8,
                ),
              ),
            ),
            15.ph,
            CustomSimpleText(
              text: "Click below for help using the CONNECT Provider Portal or to report an issue.",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomSimpleText(
              text: "CONNECT Help Instructions",
              textAlign: TextAlign.center,
              alignment: Alignment.center,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomSimpleText(
              text: "If you are having trouble accessing or using the CONNECT Provider Portal, please click the Report an Issue button below.",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            15.ph,
            CustomSimpleText(
              text: "Please allow up to two business days for the Help Desk staff to respond to your issue.",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.red,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.blue),
                child: InkWell(
                  onTap: (){
                    _sendEmail("mailto:licensingconnectinquiry@dbhds.virginia.gov?subject=DBHDS%20Provider%20Request%20CONNECT%20Tech%20Support&body=You%20must%20provide%20the%20Provider%20ID%20and%20Service%20License%20in%20order%20to%20not%20delay%20the%20resolution%20of%20your%20issue.%20%0A%0APlease%20complete%20the%20following%20information%3A%0A%0AName%3A%20%0A%0AProvider%20ID%3A%0A%0AService%20License%20(If%20Applicable)%3A%0A%0AProvider%20Name%20(Optional)%3A%20%0A%0ABest%20Contact%20Phone%20Number%3A%20%0A%0ADescribe%20the%20issue%20that%20is%20occurring%3A%20%0A%0ANote%3A%20Please%20attach%20a%20screenshot%20of%20the%20CONNECT%20error%20message%20(this%20will%20expedite%20the%20triage%20of%20your%20reported%20issue).%0A%0AThe%20DBHDS%20CONNECT%20Help%20Desk%20will%20respond%20within%202%20business%20days%20to%20provide%20a%20status%20on%20the%20issue%20reported.");
                  },
                  child: CustomSimpleText(
                    alignment: Alignment.center,
                    text: "Report an Issue".toUpperCase(),
                    fontSize: AppSizes.size16,
                    color: AppColors.white,
                    textAlign: TextAlign.center,
                    maxLines: 8,
                  ),
                ),
              ),
            ),
            15.ph,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  CustomRichText(
                      text:
                      "Serious Incident Review and RCA Template Example 5 Whys Stories Victor",
                      date: '(July 2023)',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Licensing',
                          url:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/12/Serious-Incident-Review-and-RCA-Template-Example-5-Whys-Stories-Victor-July-2023.pdf",
                        );
                      }),
                  CustomRichText(
                      text:
                      "Your device sometimes may not allow the above button to function as intended. In that case, please send an email directly to ",
                      date: 'licensingconnectinquiry@dbhds.virginia.gov',
                      text1: "with the information below:",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.none,
                      dotNeedOrNot: true,
                      onPress: () async {
                        _sendEmail("licensingconnectinquiry@dbhds.virginia.gov");
                      }),
                  15.ph,
                  CustomRichText(
                      text:
                      "Name",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.none,
                      dotNeedOrNot: true,
                      onPress: null),
                  CustomRichText(
                      text:
                      "Provider ID",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.none,
                      dotNeedOrNot: true,
                      onPress: null),
                  CustomRichText(
                      text:
                      "Service License (If Applicable)",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.none,
                      dotNeedOrNot: true,
                      onPress: null),
                  CustomRichText(
                      text:
                      "Provider Name (Optional)",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.none,
                      dotNeedOrNot: true,
                      onPress: null),
                  CustomRichText(
                      text:
                      "Best Contact Phone Number",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.none,
                      dotNeedOrNot: true,
                      onPress: null),
                  CustomRichText(
                      text:
                      "Describe the issue that is occurring",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.none,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.none,
                      dotNeedOrNot: true,
                      onPress: null),
                ],
              ),
            ),
            CustomSimpleText(
              text: "You must provide the Provider ID and Service License in order to not delay the resolution of your issue.",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomSimpleText(
              text: "Thank you for contacting the DBHDS Office of Licensing’s CONNECT Help Desk.",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomDivider(),
            15.ph,
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.blue),
                child: CustomSimpleText(
                  alignment: Alignment.center,
                  text: "BIU FAQ’s".toUpperCase(),
                  fontSize: AppSizes.size16,
                  color: AppColors.white,
                  textAlign: TextAlign.center,
                  maxLines: 8,
                ),
              ),
            ),
            15.ph,
            CustomDivider(),
            15.ph,
          ],
        ),
      ),
    );
  }

  void _sendEmail(email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': "",
        'body': "",
      },
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }
}
