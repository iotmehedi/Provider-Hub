import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/homepage/presentation/controller/controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

import '../../../../../const/routes/route_name.dart';
import '../../../../../const/routes/router.dart';

class AllServicesScreen extends StatelessWidget {
  AllServicesScreen({super.key});
  var controller = Get.find<HomepageContorller>();
  final ScrollController _horizontalScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedItem(controller.selectedIndex.value);
    });
    return Obx(() => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppBar(
          title: "All Services",
          textColor: AppColors.white,
          needTitleCenter: false,
          onBackPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 130.2, // Adjust as needed
              child: ListView.builder(
                controller: _horizontalScrollController,
                scrollDirection: Axis.horizontal,
                itemCount: controller.gridItems.length,
                itemBuilder: (context, index) {
                  final item = controller.gridItems[index];
                  return GestureDetector(
                    onTap: () {
                      _scrollToSelectedItem(index);
                      controller.selectedIndex.value = index;
                      controller.selectedIndexName.value = item['title'];
                    },
                    child: Card(
                      elevation: 0.0,
                      color: controller.selectedIndex.value == index
                          ? AppColors.slightGrey.withOpacity(0.4)
                          : AppColors.slightGrey.withOpacity(0.04),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: SizedBox(
                        width: 104.8, // Adjust as needed
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 104.8, // Explicitly set the width
                              height: 94, // Set a fixed height
                              child: Image.asset(
                                item['image'],
                                fit: BoxFit.fill, // Fill the container
                              ),
                            ),
                            Center(
                              child: Text(
                                item['title'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                  fontSize: 9.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            40.ph,
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller
                    .gridItems[controller.selectedIndex.value]['subItems']
                    .length,
                itemBuilder: (context, subIndex) {
                  final subItem =
                      controller.gridItems[controller.selectedIndex.value]
                          ['subItems'][subIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (subIndex == 0)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: CustomSimpleText(
                                text:
                                    "${controller.gridItems[controller.selectedIndex.value]['subItems'].length.toString()} Services in ${controller.selectedIndexName.value}",
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: AppColors.white,
                              ),
                            ),
                            20.ph,
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: InkWell(
                          onTap: () {
                            if (controller.gridItems[controller.selectedIndex.value]['title'] == "DD Services" ||
                                controller.gridItems[controller.selectedIndex.value]['title'] ==
                                    "Mental Health Services") {
                              RouteGenerator.pushNamedSms(
                                  context, Routes.serviceWiseProviderList,
                                  arguments: [subItem['title']]);
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "DBHDS" &&
                                subItem['title'] == "Regions") {
                              RouteGenerator.pushNamed(
                                  context, Routes.dbhdsScreen);
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "DBHDS" &&
                                subItem['title'] == "License Specialist") {
                              RouteGenerator.pushNamed(
                                  context, Routes.licenseSpecialistScreen);
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "DBHDS" &&
                                subItem['title'] == "Human Rights") {
                              RouteGenerator.pushNamed(
                                  context, Routes.humanRightScreen);
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "DBHDS" &&
                                subItem['title'] == "CRC") {
                              RouteGenerator.pushNamed(
                                  context, Routes.crcScreen);
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Updates" &&
                                subItem['title'] == "Licensing") {
                              RouteGenerator.pushNamed(
                                  context, Routes.licensingPage);
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Updates" &&
                                subItem['title'] == "Human Rights Trainings") {
                              RouteGenerator.pushNamed(
                                  context, Routes.humanRightsTrainingsScreen);
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Updates" &&
                                subItem['title'] == "BIU") {
                              RouteGenerator.pushNamed(
                                  context, Routes.biuScreen);
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Updates" &&
                                subItem['title'] == "DMAS") {
                              RouteGenerator.pushNamed(
                                  context, Routes.dmasScreen);
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Provider Resources" &&
                                subItem['title'] == "Jump Start Fundings") {
                              RouteGenerator.pushNamed(
                                  context, Routes.providerResourcesScreen);
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" &&
                                subItem['title'] == "Alexandria") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Alexandria',
                                url: "https://www.alexandriava.gov/DCHS",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" &&
                                subItem['title'] == "Alexandria") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Alexandria',
                                url: "https://www.alexandriava.gov/DCHS",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Alleghany") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Alleghany',
                                url: "https://ahcsb.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Arlington") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Arlington',
                                url:
                                    "https://www.arlingtonva.us/Government/Commissions-and-Advisory-Groups/Community-Services-Board",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Blue Ridge") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Blue Ridge',
                                url: "https://www.brbh.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Cheseapeake") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Cheseapeake',
                                url:
                                    "https://www.cityofchesapeake.net/1284/Chesapeake-Integrated-Behavioral-Healthc",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Chesterfield") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Chesterfield',
                                url:
                                    "https://www.chesterfield.gov/878/Mental-Health-Support-Services",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Colonial") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Colonial',
                                url: "https://www.colonialbh.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Crossroads") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Crossroads',
                                url: "https://crossroadscsb.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Cumberland Mountain") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Cumberland Mountain',
                                url: "http://www.cmcsb.com/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Danville-Pittsylvania") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Danville-Pittsylvania',
                                url: "https://www.dpcs.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Dickenson") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Dickenson',
                                url: "https://dcbhs.com/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "District 19") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'District 19',
                                url: "https://d19csb.com/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Eastern Shore") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Eastern Shore',
                                url: "https://escsb.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Fairfax-Falls Church") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Fairfax-Falls Church',
                                url:
                                    "https://www.fairfaxcounty.gov/community-services-board/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Goochland-Powhatan") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Goochland-Powhatan',
                                url: "https://gpcsb.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Hanover") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Hanover',
                                url:
                                    "https://www.hanovercounty.gov/358/Community-Services-Board",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Hampton-Newport") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Hampton-Newport',
                                url: "https://www.hnncsb.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Harrisonburg Rockingham") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Harrisonburg Rockingham',
                                url: "https://www.hrcsb.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Henrico Area") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Henrico Area',
                                url: "https://henrico.us/mhds/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Highlands") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Highlands',
                                url: "https://highlandscsb.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Horizon") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Horizon',
                                url: "https://www.horizonbh.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Loudoun") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Loudoun',
                                url:
                                    "https://www.loudoun.gov/121/Mental-Health-Substance-Abuse-Develop-Se",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Middle Peninsula-Northern Neck") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Middle Peninsula-Northern Neck',
                                url: "https://www.mpnncsb.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Mount Rogers") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Mount Rogers',
                                url: "http://www.mtrogerscsb.com/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "New River Valley") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'New River Valley',
                                url: "https://www.nrvcs.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Norfolk") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Norfolk',
                                url:
                                    "https://www.norfolk.gov/996/Norfolk-Community-Services-Board",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Northwestern") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Northwestern',
                                url: "https://www.nwcsb.com/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Piedmont") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Piedmont',
                                url:
                                    "https://piedmontcsb.wixsite.com/piedmontcommunitysvc",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Planning District One") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Planning District One',
                                url: "https://www.pd1bhs.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Portsmouth") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Portsmouth',
                                url:
                                    "https://www.portsmouthva.gov/149/Behavioral-Healthcare",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Prince William") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Prince William',
                                url: "https://www.pwcva.gov/csb",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Rappahannock") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Rappahannock',
                                url: "https://rappahannockareacsb.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Rappananock-Rapidan") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Rappananock-Rapidan',
                                url:
                                    "https://www.encompasscommunitysupports.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Region Ten") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Region Ten',
                                url: "https://regionten.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Richmond") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Richmond',
                                url: "https://www.rbha.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Rockbridge") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Rockbridge',
                                url: "https://www.racsb.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Southside") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Southside',
                                url: "https://www.sscsb.org/lander",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Valley") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Valley',
                                url: "https://www.myvalleycsb.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Virginia") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Virginia',
                                url: "https://vacsb.org/",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Virginia Beach") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Virginia Beach',
                                url:
                                    "https://hs.virginiabeach.gov/about/community-services-board",
                              );
                            } else if (controller.gridItems[controller.selectedIndex.value]['title'] == "Community Service Board" && subItem['title'] == "Weastern Tidewater") {
                              RouteGenerator.gotoWebPage(
                                context: context,
                                pageTitle: 'Weastern Tidewater',
                                url: "https://www.wtcsb.org/",
                              );
                            } else {
                              if (validation(subItem['title']) == true) {
                                print("this is item");
                              }
                            }
                          },
                          child: SizedBox(
                            height: 68,
                            child: Card(
                              elevation: 0.0,
                              color: AppColors.slightGrey.withOpacity(0.04),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              // width: 100, // Adjust as needed
                              margin: EdgeInsets.symmetric(horizontal: 14.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    subItem['image'],
                                    fit: BoxFit.cover,
                                    height: 52,
                                    width: 52,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        subItem['title'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.white,
                                          fontSize: AppSizes.size13,
                                          decoration:
                                              validation(subItem['title']) ==
                                                      true
                                                  ? TextDecoration.underline
                                                  : TextDecoration.none,
                                          // Explicitly setting underline color to match the text color
                                          decorationColor: AppColors.white,
                                          decorationThickness:
                                              1.5, // Adjust thickness as needed
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        )));
  }

  void _scrollToSelectedItem(int index) {
    final double itemWidth =
        104.8; // Adjust according to the width of each item
    final double scrollPosition =
        index * itemWidth; // Calculate scroll position

    _horizontalScrollController.animateTo(
      scrollPosition,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  bool validation(subItem) {
    if (subItem == "Alexandria") {
      print("this is true");
      return true;
    } else if (subItem == "Alleghany") {
      return true;
    } else if (subItem == "Arlington") {
      return true;
    } else if (subItem == "Blue Ridge") {
      return true;
    } else if (subItem == "Cheseapeake") {
      return true;
    } else if (subItem == "Chesterfield") {
      return true;
    } else if (subItem == "Colonial") {
      return true;
    } else if (subItem == "Crossroads") {
      return true;
    } else if (subItem == "Cumberland Mountain") {
      return true;
    } else if (subItem == "Danville-Pittsylvania") {
      return true;
    } else if (subItem == "Dickenson") {
      return true;
    } else if (subItem == "District 19") {
      return true;
    } else if (subItem == "Eastern Shore") {
      return true;
    } else if (subItem == "Fairfax-Falls Church") {
      return true;
    } else if (subItem == "Goochland-Powhatan") {
      return true;
    } else if (subItem == "Hanover") {
      return true;
    } else if (subItem == "Harrisonburg Rockingham") {
      return true;
    } else if (subItem == "Henrico Area") {
      return true;
    } else if (subItem == "Highlands") {
      return true;
    } else if (subItem == "Horizon") {
      return true;
    } else if (subItem == "Loudoun") {
      return true;
    } else if (subItem == "Middle Peninsula-Northern Neck") {
      return true;
    } else if (subItem == "Mount Rogers") {
      return true;
    } else if (subItem == "New River Valley") {
      return true;
    } else if (subItem == "Norfolk") {
      return true;
    } else if (subItem == "Northwestern") {
      return true;
    } else if (subItem == "Piedmont") {
      return true;
    } else if (subItem == "Planning District One") {
      return true;
    } else if (subItem == "Portsmouth") {
      return true;
    } else if (subItem == "Prince William") {
      return true;
    } else if (subItem == "Rappahannock") {
      return true;
    } else if (subItem == "Rappananock-Rapidan") {
      return true;
    } else if (subItem == "Hampton-Newport") {
      return true;
    } else if (subItem == "Region Ten") {
      return true;
    } else if (subItem == "Richmond") {
      return true;
    } else if (subItem == "Rockbridge") {
      return true;
    } else if (subItem == "Southside") {
      return true;
    } else if (subItem == "Valley") {
      return true;
    } else if (subItem == "Virginia") {
      return true;
    } else if (subItem == "Virginia Beach") {
      return true;
    } else if (subItem == "Weastern Tidewater") {
      return true;
    } else {
      return false;
    }
  }
}
