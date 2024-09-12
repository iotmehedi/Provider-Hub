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
import 'package:provider_hub/main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../const/routes/router.dart';
import '../updates/licensing_page.dart';

class ProviderResourcesScreen extends StatelessWidget {
  ProviderResourcesScreen({super.key});
  var controller = Get.put(HomepageContorller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: "Provider Resources",
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
              text: "Office of Provider Network Supports",
              textAlign: TextAlign.center,
              alignment: Alignment.center,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomDivider(),
            15.ph,
            CustomSimpleText(
              text: "Overview",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.w500,
            ),
            15.ph,
            CustomSimpleText(
              text:
                  "The Office of Provider Network Supports focuses on developing and sustaining a qualified community of providers in Virginia so that people who have developmental disabilities and their families have choice and access to options that meet their needs. Here you will find resources from Provider Development including information on becoming a provider, information about Virginia’s Person-Centered ISP, who to contact for technical assistance, and various training resources.",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomSimpleText(
              text: "Announcements",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.w500,
            ),
            15.ph,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  CustomRichText(
                      text: "Toolkit for Prospective DD Waiver Providers.",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/wp-content/uploads/2022/06/Prospective-Provider-Toolkit-Final-Copy-6.28.22.pdf",
                        );
                      }),
                  CustomRichText(
                      text:
                          "Join the Provider Network Listserv at Constant Contact.",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://lp.constantcontactpages.com/su/Z8Uy2i7/providernetwork",
                        );
                      }),
                  CustomRichText(
                      text:
                          "Provider Network Supports CRC Contact Chart effective 7/1/23.",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/wp-content/uploads/2022/03/CRC-Contacts-by-Capacity-Area-Effective-1.1.22-final-3.pdf",
                        );
                      }),
                  CustomRichText(
                      text: "Information about Social Capital.",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/assets/doc/DS/pd/1.-information-about-social-capital.pdf",
                        );
                      }),
                  CustomRichText(
                      text:
                          "Addressing Risk in the WaMS ISP v.3.3 Webinar Recording.",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url: "https://vimeo.com/705507408/ccd093ad4d",
                        );
                      }),
                ],
              ),
            ),
            15.ph,
            CustomSimpleText(
              text: "Provider Roundtables",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.w500,
            ),
            15.ph,
            CustomSimpleText(
              text: "October 2023",
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
                children: [
                  CustomRichText(
                      text: "Recording",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://www.youtube.com/watch?v=mp0H3COw_WE&list=PLmFe443VQ9xUFYE29Ym9_JPaw9I3i6dZ8&index=12",
                        );
                      }),
                  CustomRichText(
                      text: "Q&A Coming Soon",
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
            CustomSimpleText(
              text: "July 2023",
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
                children: [
                  CustomRichText(
                      text: "Recording",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://www.youtube.com/watch?v=4be59_GE-SU&list=PLmFe443VQ9xUFYE29Ym9_JPaw9I3i6dZ8&index=13",
                        );
                      }),
                  CustomRichText(
                      text: "Q&A Coming Soon",
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
            CustomSimpleText(
              text: "April 2023",
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
                children: [
                  CustomRichText(
                      text: "Recording",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://www.youtube.com/watch?v=D97D7EY-Xhs&list=PLmFe443VQ9xUFYE29Ym9_JPaw9I3i6dZ8&index=15",
                        );
                      }),
                  CustomRichText(
                      text: "Q&A Coming Soon",
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
            CustomSimpleText(
              text: "April 2023",
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
                children: [
                  CustomRichText(
                      text: "Recording",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://www.youtube.com/watch?v=D97D7EY-Xhs&list=PLmFe443VQ9xUFYE29Ym9_JPaw9I3i6dZ8&index=15",
                        );
                      }),
                  CustomRichText(
                      text: "Q&A Coming Soon",
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
            CustomSimpleText(
              text: "January 2023",
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
                children: [
                  CustomRichText(
                      text: "Recording",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://www.youtube.com/watch?v=D97D7EY-Xhs&list=PLmFe443VQ9xUFYE29Ym9_JPaw9I3i6dZ8&index=15",
                        );
                      }),
                  CustomRichText(
                      text: "Q&A",
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
            CustomSimpleText(
              text:
                  "HCBS Waivers Quality Assurance Program: End of Year Report",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.w500,
            ),
            15.ph,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  CustomRichText(
                      text: "Overview of DBHDS DD Waiver Quality Assurances",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/wp-content/uploads/2022/09/Overview-of-DBHDS-DD-Waiver-Quality-Assurances-FINAL-ppt-for-website.pdf",
                        );
                      }),
                  CustomRichText(
                      text: "QRT Performance Measures for CMS Assurances",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/wp-content/uploads/2022/09/DD-Waivers-QRT-PMs-for-CMS-Assurances.pdf",
                        );
                      }),
                  CustomRichText(
                      text: "FY19 QRT End of Year Report",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/assets/doc/DS/pd/final-qrt-year-end-report-5-2020-v2.pdf",
                        );
                      }),
                  CustomRichText(
                      text: "FY20 QRT End of Year Report",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/assets/doc/DS/pd/revised-final-qrt-end-of-year-report-9-27-2021-(1).pdf",
                        );
                      }),
                  CustomRichText(
                      text: "FY21 QRT End of Year Report",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/assets/doc/DS/pd/revised-final-qrt-end-of-year-report-9-27-2021-(1).pdf",
                        );
                      }),
                ],
              ),
            ),
            15.ph,
            CustomSimpleText(
              text:
                  "Provider Innovation Collaborative Presentations – Click Here",
              textAlign: TextAlign.center,
              alignment: Alignment.center,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.w500,
            ),
            CustomSimpleText(
              text: "Virginia Provider Data Summary",
              textAlign: TextAlign.center,
              alignment: Alignment.center,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.w500,
            ),
            20.ph,
            CustomSimpleText(
              text:
                  "On November 9th, 2017, the Office of Provider Network Supports in the Division of Developmental Services (DDS) at the Department of Behavioral Health and Developmental Services (DBHDS) hosted the first Provider Data Summary webinar as a way to engage and inform Virginia’s developmental disabilities (DD) providers about the state of DD services across the Commonwealth. Provider Data Summary webinars are planned to continue on a semi-annual basis to provide a forum for sharing the results of ongoing analysis of gaps in DD services across all regions. Information from these webinars will be available here following each scheduled event in May and November.",
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
                      text: "2023 Baseline Measurement Tool",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/wp-content/uploads/2023/05/DR0058-BMT-10312022-1.xlsx",
                        );
                      }),
                  CustomRichText(
                      text: "Report November 2022",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/assets/Developmental-Services/provider-data/2023/18.1_18.3_18.5_Provider%20Data%20Summary%20Report%20Nov%202022%20Final%20(4.26.23).pdf",
                        );
                      }),
                  CustomRichText(
                      text: "2022 Baseline Measurement Tool",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/wp-content/uploads/2022/08/DR0058-BMT-06092022-PUBLIC-2.xlsx",
                        );
                      }),
                  CustomRichText(
                      text: "Report May 2022",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/assets/Provider%20Data%20Summary%20Report%20May%202022%20PDF%20final%20v7.21.22%20(1).pdf",
                        );
                      }),
                  CustomRichText(
                      text: "Webinar Recording May 2022",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url: "https://vimeo.com/733330887/90acd349f1",
                        );
                      }),
                  CustomRichText(
                      text: "Webinar Slides May 2022",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/assets/PDS%20State%20of%20the%20State%20slides%207-21-22%20FINAL%20PDF.pdf",
                        );
                      }),
                  CustomRichText(
                      text: "Webinar Q&A May 2022",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/wp-content/uploads/2022/08/PDS-QandA-7-25-22-final-1.pdf",
                        );
                      }),
                  CustomRichText(
                      text: "Report May 2021",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/assets/doc/DS/pd/provider-data-summary-report-may-2021-final-8.4.21-final-(4).pdf",
                        );
                      }),
                  CustomRichText(
                      text: "Webinar Recording May 2021",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url: "https://vimeo.com/583100421/386304b8d6",
                        );
                      }),
                  CustomRichText(
                      text: "Webinar Slides May 2021",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/assets/doc/DS/pd/provider-data-summary-webinar-may-2021wnotes.pdf",
                        );
                      }),
                  CustomRichText(
                      text: "Provider Data Summary Report (June-Nov 18 2018)",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.underline,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/assets/doc/DS/pd/provider-data-summary-report-nov-2018-final.pdf",
                        );
                      }),
                ],
              ),
            ),
            15.ph,
            CustomSimpleText(
              text: "Jump-Start Funding Program",
              textAlign: TextAlign.center,
              alignment: Alignment.center,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomSimpleText(
              text:
                  "Jump-Start is a funding initiative designed for individuals seeking certain integrated community service options with new and expanding DD providers. This one-time funding is to develop infrastructure and capacity in community-based service organizations to support specific individuals while preparing to meet future community needs especially in geographically underserved areas.",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomSimpleText(
              text:
                  "Jump-Start Materials: (complete these fillable forms, and send as attachments)",
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
                      text: "Assignment of Award",
                      date: '– 7/24/2022',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/wp-content/uploads/2022/08/DBHDS-Jump-Start-Assignment-of-Award-7.24.22-Protected-Version.pdf",
                        );
                      }),
                  CustomRichText(
                      text: "Application",
                      date: '– 10/24/23',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/wp-content/uploads/2023/12/DBHDS-Jump-Start-Application.10.24.23-1.pdf",
                        );
                      }),
                  CustomRichText(
                      text: "Funding Program Information",
                      date: '– 10/24/23',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/wp-content/uploads/2023/12/DBHDS-Jump-Start-Funding-Information-rev-10.24.23.pdf",
                        );
                      }),
                ],
              ),
            ),
            CustomSimpleText(
              text: "Questions regarding Jump-Start can be sent to ",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
            ),
            CustomRichText(
                text: "Jumpstart@dbhds.virginia.gov",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: false,
                onPress: () async {
                  _sendEmail("Jumpstart@dbhds.virginia.gov");
                }),
            15.ph,
            CustomSimpleText(
              text: "Shared Living information",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.w500,
            ),
            15.ph,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  CustomRichText(
                      text: "Shared Living Training",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        await controller.saveImageAndShowNotification(
                            imageUrl:
                                "https://dbhds.virginia.gov/assets/doc/DS/pd/final-shared-living-training-version102019.pptx");
                      }),
                  CustomRichText(
                      text: "Shared Living toolkit",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/assets/doc/DS/pd/final-shared-living-toolkit.pdf",
                        );
                      }),
                  CustomRichText(
                      text: "Shared Living FAQ",
                      date: '',
                      text1: "",
                      textDecoration1: TextDecoration.underline,
                      textDecoration2: TextDecoration.none,
                      textDecoration3: TextDecoration.underline,
                      dotNeedOrNot: true,
                      onPress: () async {
                        RouteGenerator.gotoWebPage(
                          context: context,
                          pageTitle: 'Provider Resources',
                          url:
                              "https://dbhds.virginia.gov/assets/doc/DS/pd/shared-living-final-faqs.pdf",
                        );
                      }),
                ],
              ),
            ),
            CustomSimpleText(
              text: "Join the Provider Database!",
              textAlign: TextAlign.center,
              alignment: Alignment.center,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.normal,
            ),
            20.ph,
            CustomRichText(
                text:
                    "The Department of Behavioral Health & Developmental Services (DBHDS), Office of Provider Network Supports (OPNS)has begun another exciting partnership with Senior Navigator of Virginia in which they will serve as the search enginefor Virginia’s providers of Developmental Disabilities Waiver Services at ",
                date: 'http://mylifemycommunityvirginia.org',
                text1: ".",
                textDecoration1: TextDecoration.none,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.none,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url: "https://mylifemycommunityvirginia.org/",
                  );
                }),
            15.ph,
            CustomSimpleText(
              text:
                  "If you have not visited the site or participated in the free registration to become a professional member, do not delay.",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
            ),
            20.ph,
            CustomRichText(
                text: "To register, visit: ",
                date:
                    'http://mylifemycommunityvirginia.org/taxonomy/mlmc-menu-zone/verify-or-register-new-provider-profile',
                text1: "",
                textDecoration1: TextDecoration.none,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: false,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "http://mylifemycommunityvirginia.org/taxonomy/mlmc-menu-zone/verify-or-register-new-provider-profile",
                  );
                }),
            20.ph,
            CustomRichText(
                text:
                    "If you are already registered, manage your agency profile here: ",
                date: 'http://mylifemycommunityvirginia.org/login',
                text1: "",
                textDecoration1: TextDecoration.none,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: false,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url: "http://mylifemycommunityvirginia.org/login",
                  );
                }),
            15.ph,
            CustomSimpleText(
              text: "Regional Support Teams (RST)",
              textAlign: TextAlign.center,
              alignment: Alignment.center,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomSimpleText(
              text:
                  "The Department of Behavioral Health and Development Services (DBHDS) implemented five Regional Support Teams (RSTs) in March 2013. The RSTs are comprised of professionals with experience and expertise in serving individuals with developmental disabilities and complex behavioral and medical needs. The RST will seek to resolve identified barriers and ensure supports are provided in the most integrated setting are appropriate to the individual’s needs and are consistent with the individual’s informed choice.",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomRichText(
                text:
                    "Questions about the RST process can be discussed with an Individual Team CRC or by contacting: ",
                date: 'RST.Referrals@dbhds.virginia.gov',
                text1: "",
                textDecoration1: TextDecoration.none,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: false,
                onPress: () async {
                  _sendEmail("RST.Referrals@dbhds.virginia.gov");
                }),
            20.ph,
            CustomRichText(
                text: "WaMS RST Preview Session Recording ",
                date:
                    '(WaMS RST Referral User Guide can be located in WaMS in the Training Manuals, Webinars, and FAQs section.)',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url: "https://vimeo.com/manage/videos/792647390/1082a9683f",
                  );
                }),
            CustomRichText(
                text: "When to Submit RST Referral",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/assets/doc/DS/rsu/when-to-submit-rst-6.5.19.pdf",
                  );
                }),
            CustomRichText(
                text: "RST Meeting Schedule and Regions",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2023/08/RST-Meeting-Schedule-CSB-CRC-Regional-Contacts-8.3.2023.pdf",
                  );
                }),
            CustomRichText(
                text: "RST Referral Process",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2023/02/RST-Referral-Process-Flow-2.6.23.pdf",
                  );
                }),
            CustomRichText(
                text: "Virginia Informed Choice (VIC) Form",
                date: ' -[word file] (uploaded August 2023)',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  await controller.saveImageAndShowNotification(
                      imageUrl:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/08/virginia-informed-choice-5.25.23-final.docx");
                }),
            CustomRichText(
                text: "VIC Protocol",
                date: '-[word file]',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2023/04/virginia-informed-choice-protocol-4.4.23.pdf",
                  );
                }),
            15.ph,
            CustomSimpleText(
              text: "Training Resources",
              textAlign: TextAlign.center,
              alignment: Alignment.center,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.normal,
            ),
            20.ph,
            CustomRichText(
                text:
                    "Upcoming trainings and meetings are announced through the Provider Network Listserv quarterly. Be sure to sign up for announcements ",
                date: 'here',
                text1: "",
                textDecoration1: TextDecoration.none,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: false,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://lp.constantcontactpages.com/su/Z8Uy2i7/providernetwork",
                  );
                }),
            20.ph,
            CustomRichText(
                text:
                    "Employment and Community Transportation Service Provider Module Video",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url: "https://vimeo.com/646075432/585faaf7d8",
                  );
                }),
            CustomRichText(
                text:
                    "Employment and Community Transportation Service Provider Module Slides (Coming Soon)",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.none,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: null),
            CustomRichText(
                text: "My Life My Community Waiver Training Resources",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/developmental-services/my-life-my-community-waiver",
                  );
                }),
            CustomRichText(
                text: "Providers: Set Up WaMS Account",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/assets/doc/ds/pd/ja_wams_provider-access-to-wams.pdf",
                  );
                }),
            15.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomSimpleText(
                text: "ISP Guidance, Templates, Training",
                textAlign: TextAlign.center,
                alignment: Alignment.center,
                color: AppColors.white,
                fontSize: AppSizes.size24,
                fontWeight: FontWeight.normal,
              ),
            ),
            15.ph,
            CustomRichText(
                text: "Person Centered ISP Guidance Document 2021",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2022/05/2021-Person-Centered-ISP-Changes-Guidance-6.7.21-final-for-use.pdf",
                  );
                }),
            CustomRichText(
                text:
                    "ISP v3.3 Q&A (includes ISP updates for Employment and Integrated Community Involvement)",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2023/09/ISP-version-3.3-Updates-Questions-and-Answers-Final.pdf",
                  );
                }),
            CustomRichText(
                text: "ISP Training Resources",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2023/04/ISP-Training-Resources-4-2023.pdf",
                  );
                }),
            CustomRichText(
                text: "ISP Training Resources",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2023/04/ISP-Training-Resources-4-2023.pdf",
                  );
                }),
            CustomRichText(
                text: "Part V Template with Support Instructions (2022)",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  await controller.saveImageAndShowNotification(
                      imageUrl:
                          "https://dbhds.virginia.gov/wp-content/uploads/2022/05/Part-V-template-blank-with-Support-Instructions-4.7.22.docx");
                }),
            CustomRichText(
                text: "Part V Template Instructions",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2022/06/Instructions-for-Part-V-Template-FINAL-5.31.22.pdf",
                  );
                }),
            CustomRichText(
                text:
                    "Blended Part V Template with Support Instructions (2023)",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  await controller.saveImageAndShowNotification(
                      imageUrl:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/06/Blended-Part-V-template-blank-with-Support-Instructions-6.7.23.docx");
                }),
            CustomRichText(
                text: "Blended Person-Centered Review Template (2023)",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  await controller.saveImageAndShowNotification(
                      imageUrl:
                          "https://dbhds.virginia.gov/wp-content/uploads/2023/06/Combined-PC-Review-Optional-Template-6.7.23.docx");
                  // RouteGenerator.gotoWebPage(
                  //   context: context,
                  //   pageTitle: 'Provider Resources',
                  //   url:
                  //   "https://dbhds.virginia.gov/wp-content/uploads/2022/06/Instructions-for-Part-V-Template-FINAL-5.31.22.pdf",
                  // );
                }),
            CustomRichText(
                text: "Blended Part V Sample, Maria (2023)",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  // await controller.saveImageAndShowNotification(imageUrl: "https://dbhds.virginia.gov/wp-content/uploads/2023/06/Combined-PC-Review-Optional-Template-6.7.23.docx");
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2023/06/Maria-Sample-ISP-with-blended-Part-V-and-PCR-6.8.23.pdf",
                  );
                }),
            CustomRichText(
                text:
                    "Allowable Activities and Considerations for Developing Skill Building Activities",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  // await controller.saveImageAndShowNotification(imageUrl: "https://dbhds.virginia.gov/wp-content/uploads/2023/06/Combined-PC-Review-Optional-Template-6.7.23.docx");
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2022/06/DD-Waiver-Services-with-Skill-Builders-5.pdf",
                  );
                }),
            CustomRichText(
                text: "Quarterly Person Centered Review Template (.docx)",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  await controller.saveImageAndShowNotification(
                      imageUrl:
                          "https://dbhds.virginia.gov/wp-content/uploads/2022/05/PC-Review-4.12.18-final-for-use-3-1.docx");
                  // RouteGenerator.gotoWebPage(
                  //   context: context,
                  //   pageTitle: 'Provider Resources',
                  //   url:
                  //   "https://dbhds.virginia.gov/wp-content/uploads/2022/06/DD-Waiver-Services-with-Skill-Builders-5.pdf",
                  // );
                }),
            CustomRichText(
                text:
                    "Personal Assistance, Respite, and Companion- Modified Use of Part V in WaMS",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  // await controller.saveImageAndShowNotification(imageUrl: "https://dbhds.virginia.gov/wp-content/uploads/2022/05/PC-Review-4.12.18-final-for-use-3-1.docx");
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2022/05/ISP_97AB_PPTool_P5_0918-1.pdf",
                  );
                }),
            CustomRichText(
                text: "Personal Preferences Tool for use with DMAS 97 A/B",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  await controller.saveImageAndShowNotification(
                      imageUrl:
                          "https://dbhds.virginia.gov/wp-content/uploads/2022/05/Personal-Preferences-Tool-rev-3-17-21-1.doc");
                  // RouteGenerator.gotoWebPage(
                  //   context: context,
                  //   pageTitle: 'Provider Resources',
                  //   url:
                  //   "https://dbhds.virginia.gov/wp-content/uploads/2022/05/ISP_97AB_PPTool_P5_0918-1.pdf",
                  // );
                }),
            CustomRichText(
                text: "Personal Preferences Tool Sample",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  // await controller.saveImageAndShowNotification(imageUrl: "https://dbhds.virginia.gov/wp-content/uploads/2022/05/Personal-Preferences-Tool-rev-3-17-21-1.doc");
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2022/05/Personal-Preferences-Tool-SAMPLE-3-17-21.pdf",
                  );
                }),
            CustomRichText(
                text: "ISP Fact Sheet: Integrated Community Involvement",
                date: ' (added 10/24/23)',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  // await controller.saveImageAndShowNotification(imageUrl: "https://dbhds.virginia.gov/wp-content/uploads/2022/05/Personal-Preferences-Tool-rev-3-17-21-1.doc");
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2023/10/ICI-Fact-Sheet-FINAL_newlogo-1.pdf",
                  );
                }),
            CustomRichText(
                text: "ISP Life Area Cheat Sheet",
                date: ' (added 10/24/23)',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  // await controller.saveImageAndShowNotification(imageUrl: "https://dbhds.virginia.gov/wp-content/uploads/2022/05/Personal-Preferences-Tool-rev-3-17-21-1.doc");
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2023/10/ICI-Fact-Sheet-FINAL_newlogo-1.pdf",
                  );
                }),
            15.ph,
            CustomSimpleText(
              text: "DSP and Supervisor Orientation Training and Competencies",
              textAlign: TextAlign.center,
              alignment: Alignment.center,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomRichText(
                text:
                    "DSP supervisors were established in 2016. Certain providers of DD Waiver services are required to meet training requirements established by DBHDS. When services and supports are provided in DBHDS-licensed settings, competency observation and documentation also applies.See more information at the ",
                date: ' Centralized Training for Providers webpage.',
                text1: "",
                textDecoration1: TextDecoration.none,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  // await controller.saveImageAndShowNotification(imageUrl: "https://dbhds.virginia.gov/wp-content/uploads/2022/05/Personal-Preferences-Tool-rev-3-17-21-1.doc");
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/developmental-services/provider-development/ctp-pd/ctp-required-training",
                  );
                }),
            15.ph,
            CustomSimpleText(
              text: "Provider Issue Resolution Workgroup",
              textAlign: TextAlign.center,
              alignment: Alignment.center,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomSimpleText(
              text:
                  "In May of 2018, the Department of Behavioral Health and Developmental Services (DBHDS) convened the Provider Issues Resolution Workgroup (PIRW) to identify and address issues that impact the development, expansion and maintenance of a healthy provider network that is accessible to all Virginians with developmental disabilities (DD).",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomRichText(
                text: "PIPW Recommendations Report 2018",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  // await controller.saveImageAndShowNotification(imageUrl: "https://dbhds.virginia.gov/wp-content/uploads/2022/05/Personal-Preferences-Tool-rev-3-17-21-1.doc");
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/assets/doc/DS/pd/pirw-final-report-2018-8.30.18-final.pdf",
                  );
                }),
            15.ph,
            CustomSimpleText(
              text: "Additional Resources",
              textAlign: TextAlign.center,
              alignment: Alignment.center,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomRichText(
                text: "Online Training for Billing and Reimbursement at DMAS",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  // await controller.saveImageAndShowNotification(imageUrl: "https://dbhds.virginia.gov/wp-content/uploads/2022/05/Personal-Preferences-Tool-rev-3-17-21-1.doc");
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://www.virginiamedicaid.dmas.virginia.gov/wps/portal/ProviderTrainingLibrary",
                  );
                }),
            15.ph,
            CustomSimpleText(
              text: "Contacts",
              textAlign: TextAlign.center,
              alignment: Alignment.center,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomRichText(
                text:
                    "Provider Network Supports CRC Contact Chart effective 7/1/23",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.underline,
                dotNeedOrNot: true,
                onPress: () async {
                  // await controller.saveImageAndShowNotification(imageUrl: "https://dbhds.virginia.gov/wp-content/uploads/2022/05/Personal-Preferences-Tool-rev-3-17-21-1.doc");
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'Provider Resources',
                    url:
                        "https://dbhds.virginia.gov/wp-content/uploads/2023/07/CRC-Contacts-by-Capacity-Area-Effective-7.1.23-final.pdf",
                  );
                }),
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
        'subject': '',
        'body': '',
      },
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(
        emailLaunchUri,
        mode: LaunchMode
            .externalApplication, // Ensures the mail app opens externally
      );
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }
}
