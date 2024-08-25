import 'package:get/get.dart';
import 'package:provider_hub/const/utils/consts/app_assets.dart';

class HomepageContorller extends GetxController{
  var selectedIndex = 0.obs;
  final List<Map<String, dynamic>> gridItems = [
    {
      'title': 'DD Services',
      'image': AppAssets.dd_services,
      'subItems': [
        {'title': 'In-Home Supportive Services', 'image': AppAssets.inHome},
        {'title': 'Group Home Services', 'image': AppAssets.groupHome},
        {'title': 'Sponsored Residential Services', 'image': AppAssets.sponsored},
        {'title': 'Community Engagement Services', 'image': AppAssets.community2},
        {'title': 'Day Support Services', 'image': AppAssets.daySupport},
      ],
    },
    {
      'title': 'Mental Health Services',
      'image': AppAssets.mental_health,
      'subItems': [
        {'title': 'In-Home Supportive Services', 'image': AppAssets.inHome},
        {'title': 'Group Home Services', 'image': AppAssets.groupHome},
        {'title': 'Sponsored Residential Services', 'image': AppAssets.sponsored},
        {'title': 'Community Engagement Services', 'image': AppAssets.community2},
        {'title': 'Day Support Services', 'image': AppAssets.daySupport},
      ],
    },
    {
      'title': 'Trainings',
      'image': AppAssets.trainings,
      'subItems': [
        {'title': 'In-Home Supportive Services', 'image': AppAssets.inHome},
        {'title': 'Group Home Services', 'image': AppAssets.groupHome},
        {'title': 'Sponsored Residential Services', 'image': AppAssets.sponsored},
        {'title': 'Community Engagement Services', 'image': AppAssets.community2},
        {'title': 'Day Support Services', 'image': AppAssets.daySupport},
      ],
    },
    {
      'title': 'Community Service Board',
      'image': AppAssets.community,
      'subItems': [
        {'title': 'In-Home Supportive Services', 'image': AppAssets.inHome},
        {'title': 'Group Home Services', 'image': AppAssets.groupHome},
        {'title': 'Sponsored Residential Services', 'image': AppAssets.sponsored},
        {'title': 'Community Engagement Services', 'image': AppAssets.community2},
        {'title': 'Day Support Services', 'image': AppAssets.daySupport},
      ],
    },
    {
      'title': 'Policy Consultants',
      'image': AppAssets.policy,
      'subItems': [
        {'title': 'In-Home Supportive Services', 'image': AppAssets.inHome},
        {'title': 'Group Home Services', 'image': AppAssets.groupHome},
        {'title': 'Sponsored Residential Services', 'image': AppAssets.sponsored},
        {'title': 'Community Engagement Services', 'image': AppAssets.community2},
        {'title': 'Day Support Services', 'image': AppAssets.daySupport},
      ],
    },
    {
      'title': 'DBHDS',
      'image': AppAssets.dbhds,
      'subItems': [
        {'title': 'In-Home Supportive Services', 'image': AppAssets.inHome},
        {'title': 'Group Home Services', 'image': AppAssets.groupHome},
        {'title': 'Sponsored Residential Services', 'image': AppAssets.sponsored},
        {'title': 'Community Engagement Services', 'image': AppAssets.community2},
        {'title': 'Day Support Services', 'image': AppAssets.daySupport},
      ],
    },
    {
      'title': 'Updates',
      'image': AppAssets.updates,
      'subItems': [
        {'title': 'In-Home Supportive Services', 'image': AppAssets.inHome},
        {'title': 'Group Home Services', 'image': AppAssets.groupHome},
        {'title': 'Sponsored Residential Services', 'image': AppAssets.sponsored},
        {'title': 'Community Engagement Services', 'image': AppAssets.community2},
        {'title': 'Day Support Services', 'image': AppAssets.daySupport},
      ],
    },
    {
      'title': 'Provider Resources',
      'image': AppAssets.provider,
      'subItems': [
        {'title': 'In-Home Supportive Services', 'image': AppAssets.inHome},
        {'title': 'Group Home Services', 'image': AppAssets.groupHome},
        {'title': 'Sponsored Residential Services', 'image': AppAssets.sponsored},
        {'title': 'Community Engagement Services', 'image': AppAssets.community2},
        {'title': 'Day Support Services', 'image': AppAssets.daySupport},
      ],
    },
    // Add more grid items as needed
  ];
}