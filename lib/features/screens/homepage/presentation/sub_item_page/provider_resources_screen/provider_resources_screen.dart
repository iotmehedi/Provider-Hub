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
  const ProviderResourcesScreen({super.key});

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
              text: "The Office of Provider Network Supports focuses on developing and sustaining a qualified community of providers in Virginia so that people who have developmental disabilities and their families have choice and access to options that meet their needs. Here you will find resources from Provider Development including information on becoming a provider, information about Virginia’s Person-Centered ISP, who to contact for technical assistance, and various training resources.",
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
                      text: "Join the Provider Network Listserv at Constant Contact.",
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
                      text: "Provider Network Supports CRC Contact Chart effective 7/1/23.",
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
                      text: "Addressing Risk in the WaMS ISP v.3.3 Webinar Recording.",
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
                          "https://vimeo.com/705507408/ccd093ad4d",
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
              text: "HCBS Waivers Quality Assurance Program: End of Year Report",
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
              text: "Provider Innovation Collaborative Presentations – Click Here",
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
              text: "On November 9th, 2017, the Office of Provider Network Supports in the Division of Developmental Services (DDS) at the Department of Behavioral Health and Developmental Services (DBHDS) hosted the first Provider Data Summary webinar as a way to engage and inform Virginia’s developmental disabilities (DD) providers about the state of DD services across the Commonwealth. Provider Data Summary webinars are planned to continue on a semi-annual basis to provide a forum for sharing the results of ongoing analysis of gaps in DD services across all regions. Information from these webinars will be available here following each scheduled event in May and November.",
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
                          url:
                          "https://vimeo.com/733330887/90acd349f1",
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
                          url:
                          "https://vimeo.com/583100421/386304b8d6",
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
              text: "Jump-Start is a funding initiative designed for individuals seeking certain integrated community service options with new and expanding DD providers. This one-time funding is to develop infrastructure and capacity in community-based service organizations to support specific individuals while preparing to meet future community needs especially in geographically underserved areas.",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomSimpleText(
              text: "Jump-Start Materials: (complete these fillable forms, and send as attachments)",
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
        'subject': 'Your Subject Here',
        'body': 'Your email body here.',
      },
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(
        emailLaunchUri,
        mode: LaunchMode.externalApplication, // Ensures the mail app opens externally
      );
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }
}
