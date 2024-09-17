import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_hub/const/utils/consts/app_assets.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/features/screens/authentication/signin/controller/controller.dart';
import 'package:provider_hub/features/screens/homepage/presentation/controller/controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';
import 'package:provider_hub/features/widget/custom_svg/custom_svg_widget.dart';

import '../../../../../const/routes/route_name.dart';
import '../../../../../const/routes/router.dart';
import '../../../inbox_page/presentation/controller/controller.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  

var controller = Get.put(HomepageContorller());
var signInController = Get.put(SigninController());
  @override
  Widget build(BuildContext context) {
    var size1 = MediaQuery.of(context).size;
    final double itemHeight = (size1.height - kToolbarHeight - 10) / 5;
    final double itemWidth = size1.width / 2;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        iconTheme: IconThemeData(color: AppColors.white),
        title: Row(
          children: [
            CustomSimpleText(
              text: "SERVICES",
              color: AppColors.white,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  signInController.fetchProviders();
                  signInController.getToken();
                  signInController.saveFCMToken();
                  // Navigate to the desired page when the TextField is tapped
                  RouteGenerator.pushNamed(context,Routes.nearestProvider);
                },
                child: AbsorbPointer(
                  child: Container(
                    margin: const EdgeInsets.only(left: 9),
                    height: 28, // Adjust the height as needed
                    child: InkWell(
                      onTap: (){

                        RouteGenerator.pushNamed(context,Routes.nearestProvider);
                      },
                      child: TextField(
                        readOnly: true,
                        cursorHeight: 18, // Adjust cursor height
                        cursorWidth: 2, // Adjust cursor width
                        cursorColor: AppColors.white,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          // letterSpacing: 0.2,
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),

                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 0),
                          hintText: 'Search',
                          hintStyle: GoogleFonts.roboto(
                            // letterSpacing: 0.2,
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: SizedBox(
                              height: 24,
                              width: 24,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      height: 24,
                                      width: 18,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: AppColors.white),
                                      child: const Icon(
                                        Icons.search,
                                        size: 14,
                                        color: Colors.black,
                                      ),
                                    )),
                              )),
                          suffixIcon: const SizedBox(
                              height: 24,
                              width: 24,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: CustomSvgWidget(
                                    image: AppAssets.menu, height: 24, width: 24),
                              )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                color: AppColors.white), // Default border color
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                color:
                                AppColors.white), // Border color when focused
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                color:
                                AppColors.white), // Border color when enabled
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                color:
                                AppColors.white), // Border color when disabled
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        itemCount: controller.gridItems.length,
        itemBuilder: (context, gridIndex) {
          final gridItem = controller.gridItems[gridIndex];
          return InkWell(
            onTap: (){
              controller.selectedIndex.value = gridIndex;

              RouteGenerator.pushNamed(context,Routes.allService);
            },
            child: Card(
              elevation: 0.0,
              color: AppColors.slightGrey.withOpacity(0.04),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    child: Image.asset(
                      gridItem['image'],
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      height: 94,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        gridItem['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.white
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
