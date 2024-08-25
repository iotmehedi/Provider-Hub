import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/const/utils/core/extensions/extensions.dart';
import 'package:provider_hub/features/screens/homepage/presentation/controller/controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:provider_hub/features/widget/custom_simple_text/custom_simple_text.dart';

class AllServicesScreen extends StatelessWidget {
   AllServicesScreen({super.key});
var controller = Get.find<HomepageContorller>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
      backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppBar(title: "All Services", onBackPressed: (){Navigator.pop(context);},),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(
          height: 130.2, // Adjust as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.gridItems.length,
            itemBuilder: (context, index) {
              final item = controller.gridItems[index];
              return GestureDetector(
                onTap: () {
                  controller.selectedIndex.value = index;
                },
                child: Card(
                  elevation: 0.0,
                  color: AppColors.slightGrey.withOpacity(0.04),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: SizedBox(
                    width: 104.8, // Adjust as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 104.8,  // Explicitly set the width
                          height: 94,    // Set a fixed height
                          child: Image.asset(
                            item['image'],
                            fit: BoxFit.fill,  // Fill the container
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
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: CustomSimpleText(text: "5 Services in DD Services", fontSize: 10, fontWeight: FontWeight.normal, color: AppColors.white,),
      ),
      20.ph,
      Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.gridItems[controller.selectedIndex.value]['subItems'].length,
                itemBuilder: (context, subIndex) {
                  final subItem =
                  controller.gridItems[controller.selectedIndex.value]['subItems'][subIndex];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
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
                                  ),
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
          ],
        )
    ));
  }
}
