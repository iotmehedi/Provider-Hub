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

class DmasScreen extends StatelessWidget {
  const DmasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: "DMAS",
        needTitleCenter: false,
        textColor: AppColors.white,
        fontSize: AppSizes.size24,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            Image.asset(
              AppAssets.forProvider,
              height: AppSizes.newSize(25.5),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            15.ph,
            CustomSimpleText(
              text:
                  "The Department of Medical Assistance Services (DMAS) thanks you for your part in providing access to health services for 2 million Virginians. Whether you are a new or existing Virginia Medicaid provider, DMAS is here to assist you in finding information, training and resources about the Virginia Medicaid program with ease.",
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomRichText(
                text:
                    "Find popular resources, answers to Frequently Asked Questions and a brief overview of each of the different Provider topic hubs available on our website below. ",
                date: 'Subscribe',
                text1:
                    " to receive email updates on the latest Virginia Medicaid news.",
                textDecoration1: TextDecoration.none,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.none,
                dotNeedOrNot: false,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'DMAS',
                    url:
                        "https://public.govdelivery.com/accounts/VADMAS/signup/31312",
                  );
                }),
            20.ph,
            CustomSimpleText(
              text: "Resources",
              textAlign: TextAlign.center,
              alignment: Alignment.center,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.normal,
            ),
            15.ph,
            CustomRichText(
                text: "Durable Medical Equipment",
                date: ' (DME): ',
                text1:
                    " View and download Appendix B files and access DME training.",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.none,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'DMAS',
                    url:
                        "https://www.dmas.virginia.gov/for-providers/long-term-care/services/durable-medical-equipment/",
                  );
                }),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "• ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppSizes.size12,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    TextSpan(
                      text: "General Information:",
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
                            pageTitle: 'DMAS',
                            url:
                                "https://www.dmas.virginia.gov/for-providers/general-information/",
                          );
                        },
                    ),
                    TextSpan(
                      text:
                          " Find financial, billing, claims and outreach materials, including ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppSizes.size12,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    TextSpan(
                      text: "Hospital Presumptive Eligibility Information",
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
                            pageTitle: 'DMAS',
                            url:
                                "https://www.dmas.virginia.gov/for-providers/general-information/hospital-presumptive-eligibility-information/",
                          );
                        },
                    ),
                    TextSpan(
                      text: " and the ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppSizes.size12,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    TextSpan(
                      text: "Medicaid Provider Manual Drafts.",
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
                            pageTitle: 'DMAS',
                            url:
                                "https://www.dmas.virginia.gov/for-providers/#",
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "• ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppSizes.size12,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    TextSpan(
                      text: "Medical Assistance Eligibility Manual:",
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
                            pageTitle: 'DMAS',
                            url:
                                "https://www.dmas.virginia.gov/for-applicants/eligibility-guidance/eligibility-manual/",
                          );
                        },
                    ),
                    TextSpan(
                      text:
                          " View and download chapters of the Eligibility Manual, which is used to determine a person's eligibility for Medicaid, Family Access to Medical Insurance Security Plan (FAMIS), children’s Medicaid and FAMIS Prenatal coverage. ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppSizes.size12,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    TextSpan(
                      text: "Search the contents of the Eligibility Manual.",
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
                            pageTitle: 'DMAS',
                            url:
                                "https://www.dmas.virginia.gov/for-applicants/eligibility-guidance/eligibility-manual-full-search/",
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
            CustomRichText(
                text: "MES Provider Manuals Library",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.none,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'DMAS',
                    url:
                        "https://vamedicaid.dmas.virginia.gov/manuals/provider-manuals-library",
                  );
                }),
            CustomRichText(
                text: "MES Memo/Bulletin Library",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.none,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'DMAS',
                    url:
                        "https://vamedicaid.dmas.virginia.gov/provider/library",
                  );
                }),
            CustomRichText(
                text: "MES Provider Resources",
                date: '',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.none,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'DMAS',
                    url: "https://vamedicaid.dmas.virginia.gov/provider",
                  );
                }),
            CustomRichText(
                text: "Procedure Fee Files & CPT Codes:",
                date:
                    ' Search CPT codes by service date, flag code or multiple CPT codes, and access other procedure fee files.',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.none,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'DMAS',
                    url:
                        "https://www.dmas.virginia.gov/for-providers/rates-and-rate-setting/procedure-fee-files-cpt-codes/",
                  );
                }),
            CustomRichText(
                text: "Rate Setting:",
                date:
                    ' Find rate setting information for Medicaid reimbursement.',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.none,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'DMAS',
                    url:
                        "https://www.dmas.virginia.gov/for-providers/rates-and-rate-setting/",
                  );
                }),
            CustomRichText(
                text: "Virginia Medicaid Portal FAQ:",
                date:
                    ' Find questions and answers for Providers leading up to the MES and PRSS portal launches on April 4, 2022.',
                text1: "",
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.none,
                textDecoration3: TextDecoration.none,
                dotNeedOrNot: true,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: 'DMAS',
                    url: "https://vamedicaid.dmas.virginia.gov/provider/faq",
                  );
                }),
            15.ph,
            CustomSimpleText(
              text: "Frequently Asked Questions",
              textAlign: TextAlign.center,
              alignment: Alignment.center,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.normal,
            ),
            20.ph,
            CustomContainer(
                context: context,
                text: "Where can I find provider reimbursement information?"),
            2.ph,
            CustomContainer(
                context: context,
                text:
                    "Where can I find Medicaid member eligibility information?"),
            2.ph,
            CustomContainer(
                context: context,
                text: "Who can I contact for further assistance?"),
            15.ph,
            CustomSimpleText(
              text: "For Providers - Navigate",
              textAlign: TextAlign.center,
              alignment: Alignment.center,
              color: AppColors.white,
              fontSize: AppSizes.size24,
              fontWeight: FontWeight.normal,
            ),
            30.ph,
            CustomContainerImageDes(
              context: context,
              image: AppAssets.addiction,
              heading1: "Addiction and Recovery Treatment Services",
              heading2:
                  "The Addiction and Recovery. Treatment Services (ARTS) benefit provides treatment for those with substance use disorders across the state.",
              link1:
                  "https://www.dmas.virginia.gov/for-providers/addiction-and-recovery-treatment-services/",
              link2:
                  "https://www.dmas.virginia.gov/for-providers/addiction-and-recovery-treatment-services/",
            ),
            5.ph,
            CustomContainerImageDes(
              context: context,
              image: AppAssets.brain,
              heading1: "Behavioral Health",
              heading2:
                  "Providing an array of behavioral health and addiction and recovery treatment services through Managed Care Organizations, CCC Plus and Medallion 4.0, and through the Behavioral Health Services Administrator.",
              link1:
                  "https://www.dmas.virginia.gov/for-providers/behavioral-health/",
              link2:
                  "https://www.dmas.virginia.gov/for-providers/behavioral-health/",
            ),
            5.ph,
            CustomContainerImageDes(
              context: context,
              image: AppAssets.arrow,
              heading1: "Cardinal Care Transition",
              heading2:
                  "Providing an array of behavioral health and addiction and recovery treatment services through Managed Care Organizations, CCC Plus and Medallion 4.0, and through the Behavioral Health Services Administrator.",
              link1:
                  "https://www.dmas.virginia.gov/for-providers/cardinal-care-transition/",
              link2:
                  "https://www.dmas.virginia.gov/for-providers/cardinal-care-transition/",
            ),
            5.ph,
            CustomContainerImageDes(
              context: context,
              image: AppAssets.dental,
              heading1: "Dental",
              heading2:
                  "Virginia's Medicaid Smiles For Children program offers comprehensive dental services to children, adults, and pregnant members.",
              link1:
                  "https://www.dmas.virginia.gov/for-providers/dental/",
              link2:
                  "https://www.dmas.virginia.gov/for-providers/dental/",
            ),
            5.ph,
            CustomContainerImageDes(
              context: context,
              image: AppAssets.hand,
              heading1: "Foster Care",
              heading2:
                  "Foster Care Overview, Presentations, Recorded Webinars and Coverage Information.",
              link1:
                  "https://www.dmas.virginia.gov/for-providers/foster-care/",
              link2:
                  "https://www.dmas.virginia.gov/for-providers/foster-care/",
            ),
            5.ph,
            CustomContainerImageDes(
              context: context,
              image: AppAssets.info,
              heading1: "General Information",
              heading2:
                  "Information for Financials, Billing and Outreach Materials.",
              link1:
                  "https://www.dmas.virginia.gov/for-providers/general-information/",
              link2:
                  "https://www.dmas.virginia.gov/for-providers/general-information/",
            ),
            5.ph,
            CustomContainerImageDes(
              context: context,
              image: AppAssets.care,
              heading1: "Long Term Care",
              heading2:
                  "Nursing Facilities, Specialized Care Nursing Facilities, Long-Stay Hospitals, Home Health and more.",
              link1:
                  "https://www.dmas.virginia.gov/for-providers/long-term-care/",
              link2:
                  "https://www.dmas.virginia.gov/for-providers/long-term-care/",
            ),
            5.ph,
            CustomContainerImageDes(
              context: context,
              image: AppAssets.menu1,
              heading1: "Managed Care",
              heading2:
                  "Information for Commonwealth Coordinated Care Plus (CCC Plus) and Medallion 4.0 Managed Care Programs.",
              link1:
                  "https://www.dmas.virginia.gov/for-providers/managed-care/",
              link2:
                  "https://www.dmas.virginia.gov/for-providers/managed-care/",
            ),
            5.ph,
            CustomContainerImageDes(
              context: context,
              image: AppAssets.child,
              heading1: "Maternal and Child Health",
              heading2:
                  "Virginia’s Maternal and Child Health Insurance Programs, which include Family Access to Medical Insurance Security (FAMIS) and children's Medicaid.",
              link1:
                  "https://www.dmas.virginia.gov/for-providers/maternal-and-child-health/",
              link2:
                  "https://www.dmas.virginia.gov/for-providers/maternal-and-child-health/",
            ),
            5.ph,
            CustomContainerImageDes(
              context: context,
              image: AppAssets.doctor,
              heading1: "Medicaid Enterprise System",
              heading2:
                  "Information about Virginia Medicaid's technology platform that launched in April 2022 as part of the Medicaid Enterprise System (MES) project, including the Provider Services Solution (PRSS) module.",
              link1:
                  "https://www.dmas.virginia.gov/for-providers/medicaid-enterprise-system/",
              link2:
                  "https://www.dmas.virginia.gov/for-providers/medicaid-enterprise-system/",
            ),
            5.ph,
            CustomContainerImageDes(
              context: context,
              image: AppAssets.medicine,
              heading1: "Pharmacy and Drug Formularies",
              heading2:
                  "Reference site for the Preferred Drug List and Prior Authorization Programs,  as well as for information on upcoming changes.",
              link1:
                  "https://www.dmas.virginia.gov/for-providers/pharmacy-and-drug-formularies/",
              link2:
                  "https://www.dmas.virginia.gov/for-providers/pharmacy-and-drug-formularies/",
            ),
            5.ph,
            CustomContainerImageDes(
              context: context,
              image: AppAssets.plan,
              heading1: "Plan First",
              heading2:
                  "A program for eligible men and women that covers birth control and services to help prevent unplanned pregnancies.",
              link1:
                  "https://www.dmas.virginia.gov/for-providers/plan-first/",
              link2:
                  "https://www.dmas.virginia.gov/for-providers/plan-first/",
            ),
            5.ph,
            CustomContainerImageDes(
              context: context,
              image: AppAssets.rate,
              heading1: "Rates and Rate Setting",
              heading2:
                  "Department of Medical Assistance Services (DMAS) Rates and Rate Setting Information for Medicaid Reimbursement.",
              link1:
                  "https://www.dmas.virginia.gov/for-providers/rates-and-rate-setting/",
              link2:
                  "https://www.dmas.virginia.gov/for-providers/rates-and-rate-setting/",
            ),
            5.ph,

            CustomContainerImageDes(
              context: context,
              image: AppAssets.school,
              heading1: "School Based Services",
              heading2:
                  "In some instances, schools can be reimbursed some of the costs associated with providing these services to children enrolled in Medicaid or FAMIS.",
              link1:
                  "https://www.dmas.virginia.gov/for-providers/school-based-services/",
              link2:
                  "https://www.dmas.virginia.gov/for-providers/school-based-services/",
            ),
            5.ph,

            CustomContainerImageDes(
              context: context,
              image: AppAssets.health,
              heading1: "Telehealth Services",
              heading2:
                  "Information on telehealth services, trainings, policies and more.",
              link1:
                  "https://www.dmas.virginia.gov/for-providers/telehealth-services/",
              link2:
                  "https://www.dmas.virginia.gov/for-providers/telehealth-services/",
            ),
            5.ph,

            CustomContainerImageDes(
              context: context,
              image: AppAssets.transport,
              heading1: "Transportation",
              heading2:
                  "Fee For Service (FFS) Emergency Ambulance and Non-Emergency Medicaid Transportation (NEMT) services.",
              link1:
                  "https://www.dmas.virginia.gov/for-providers/transportation/",
              link2:
                  "https://www.dmas.virginia.gov/for-providers/transportation/",
            ),
            10.ph,
          ],
        ),
      ),
    );
  }

  Widget CustomContainer(
      {required BuildContext context, required String text}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3))),
      child: Row(
        children: [
          Expanded(
            child: CustomSimpleText(
              text: text,
              textAlign: TextAlign.start,
              alignment: Alignment.centerLeft,
              color: AppColors.white,
              fontSize: AppSizes.size12,
              fontWeight: FontWeight.normal,
            ),
          ),
          Icon(
            Icons.add,
            size: 14,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }

  Widget CustomContainerImageDes(
      {required BuildContext context,
      required String image,
      required String heading1,
      required String heading2,
      required String link1,
      required String link2}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.withOpacity(0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: AppSizes.newSize(8.05),
            width: AppSizes.newSize(10.4),
          ),
          15.ph,
          CustomRichText(
              text: heading1,
              date: '',
              text1: "",
              textAlign: TextAlign.center,
              textDecoration1: TextDecoration.underline,
              textDecoration2: TextDecoration.underline,
              textDecoration3: TextDecoration.underline,
              textSize1: AppSizes.size22,
              alignment: Alignment.center,
              dotNeedOrNot: false,
              onPress: () async {
                RouteGenerator.gotoWebPage(
                  context: context,
                  pageTitle: '',
                  url: link1,
                );
              }),
          20.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomRichText(
                text: heading2,
                date: '',
                text1: "",
                textAlign: TextAlign.center,
                textDecoration1: TextDecoration.underline,
                textDecoration2: TextDecoration.underline,
                textDecoration3: TextDecoration.underline,
                textSize1: AppSizes.size17,
                alignment: Alignment.center,
                dotNeedOrNot: false,
                onPress: () async {
                  RouteGenerator.gotoWebPage(
                    context: context,
                    pageTitle: '',
                    url: link2,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
