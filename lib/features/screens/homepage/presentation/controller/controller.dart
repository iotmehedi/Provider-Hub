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
        {'title': 'Outpatient Psychotherapy', 'image': AppAssets.groupHome},
      ],
    },
    {
      'title': 'Trainings',
      'image': AppAssets.trainings,
      'subItems': [
        {'title': 'CPR/First Aid', 'image': AppAssets.inHome},
        {'title': 'TOVA', 'image': AppAssets.groupHome},
        {'title': 'Medication Aid', 'image': AppAssets.sponsored},
        {'title': 'DSP', 'image': AppAssets.community2},
        {'title': 'Documentation', 'image': AppAssets.daySupport},
      ],
    },
    {
      'title': 'Community Service Board',
      'image': AppAssets.community,
      'subItems': [
        {'title': 'Alexandria', 'image': AppAssets.alexandria},
        {'title': 'Alleghany', 'image': AppAssets.alleghany},
        {'title': 'Arlington', 'image': AppAssets.arlington},
        {'title': 'Blue Ridge', 'image': AppAssets.blue_ridge},
        {'title': 'Cheseapeake', 'image': AppAssets.chesapeake},
        {'title': 'Chesterfield', 'image': AppAssets.chesterfield},
        {'title': 'Colonial', 'image': AppAssets.colonial},
        {'title': 'Crossroads', 'image': AppAssets.crossroads},
        {'title': 'Cumberland Mountain', 'image': AppAssets.cumberland},
        {'title': 'Danville-Pittsylvania', 'image': AppAssets.danville},
        {'title': 'Dickenson', 'image': AppAssets.dickenson},
        {'title': 'District 19', 'image': AppAssets.district},
        {'title': 'Eastern Shore', 'image': AppAssets.easternShore},
        {'title': 'Fairfax-Falls Church', 'image': AppAssets.fairefaxFall},
        {'title': 'Goochland-Powhatan', 'image': AppAssets.goochland},
        {'title': 'Hanover', 'image': AppAssets.hanover},
        {'title': 'Harrisonburg Rockingham', 'image': AppAssets.harrisonburg},
        {'title': 'Henrico Area', 'image': AppAssets.henrico_area},
        {'title': 'Highlands', 'image': AppAssets.hignlands},
        {'title': 'Horizon', 'image': AppAssets.horizon},
        {'title': 'Loudoun', 'image': AppAssets.loudoun},
        {'title': 'Middle Peninsula-Northern Neck', 'image': AppAssets.middle_peninsula},
        {'title': 'Mount Rogers', 'image': AppAssets.mount},
        {'title': 'New River Valley', 'image': AppAssets.new_river},
        {'title': 'Norfolk', 'image': AppAssets.norfolk},
        {'title': 'Northwestern', 'image': AppAssets.northwestern},
        {'title': 'Piedmont', 'image': AppAssets.piedmont},
        {'title': 'Planning District One', 'image': AppAssets.panning_district},
        {'title': 'Portsmouth', 'image': AppAssets.portsmouth},
        {'title': 'Prince William', 'image': AppAssets.princeWilliam},
        {'title': 'Rappahannock', 'image': AppAssets.rappanannock},
        {'title': 'Rappananock-Rapidan', 'image': AppAssets.rappanannock},
        {'title': 'Region Ten', 'image': AppAssets.region},
        {'title': 'Richmond', 'image': AppAssets.richmond},
        {'title': 'Rockbridge', 'image': AppAssets.rockbridge},
        {'title': 'Southside', 'image': AppAssets.southside},
        {'title': 'Valley', 'image': AppAssets.valley},
        {'title': 'Virginia', 'image': AppAssets.virginia},
        {'title': 'Virginia Beach', 'image': AppAssets.virginia_beach},
        {'title': 'Weastern Tidewater', 'image': AppAssets.western},
      ],
    },
    {
      'title': 'Policy Consultants',
      'image': AppAssets.policy,
      'subItems': [
        {'title': 'Consultant Information', 'image': AppAssets.inHome},
      ],
    },
    {
      'title': 'DBHDS',
      'image': AppAssets.dbhds,
      'subItems': [
        {'title': 'Regions', 'image': AppAssets.inHome},
        {'title': 'Kucebse Specialist', 'image': AppAssets.groupHome},
        {'title': 'Human Rights', 'image': AppAssets.sponsored},
        {'title': 'CRC', 'image': AppAssets.community2},
      ],
    },
    {
      'title': 'Updates',
      'image': AppAssets.updates,
      'subItems': [
        {'title': 'Licensing', 'image': AppAssets.inHome},
        {'title': 'Human Rights Trainings', 'image': AppAssets.groupHome},
        {'title': 'BIU', 'image': AppAssets.sponsored},
        {'title': 'DMAS', 'image': AppAssets.community2},
      ],
    },
    {
      'title': 'Provider Resources',
      'image': AppAssets.provider,
      'subItems': [
        {'title': 'Jump Start Fundings', 'image': AppAssets.inHome},
      ],
    },
    // Add more grid items as needed
  ];
}