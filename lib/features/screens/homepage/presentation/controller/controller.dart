import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider_hub/const/utils/consts/app_assets.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

import '../../model/license_specialist_model.dart';
class HomepageContorller extends GetxController{
  var selectedIndex = 0.obs;
  var selectIndexForItem = 0.obs;
  var licenseSpecialists = RxList<LicenseSpecialist>();
  var qualityInformation = RxList<LicenseSpecialist>();
  var siuModel = RxList<LicenseSpecialist>();
  var imuModel = RxList<LicenseSpecialist>();
  var regionOne = RxList<LicenseSpecialist>();
  var regionTwo = RxList<LicenseSpecialist>();
  var regionThree = RxList<LicenseSpecialist>();
  var regionFour = RxList<LicenseSpecialist>();
  var regionFourPointFive = RxList<LicenseSpecialist>();
  var regionFive = RxList<LicenseSpecialist>();
  var useProvider = RxList<LicenseSpecialist>();
  var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin().obs;
  var imageFromImage = "".obs;
  var progress = 0.obs;
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
        {'title': 'License Specialist', 'image': AppAssets.groupHome},
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


  @override
  void onInit() {
    super.onInit();
    flutterLocalNotificationsPlugin.value = FlutterLocalNotificationsPlugin();
    initializeNotifications();
    fetchLicenseSpecialist();
    fetchQualityInfromation();
    fetchIMU();
    fetchSIU();
    fetchRegionOne();
    fetchRegionTwo();
    fetchRegionThree();
    fetchRegionFour();
    fetchRegionFourPointFive();
    fetchRegionFive();
    fetchUseProvider();
  }



  Future<void> fetchLicenseSpecialist() async {
    final firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore.collection('licenceSpecialist').get();

    // Convert the documents into LicenseSpecialist objects
    var specialists = querySnapshot.docs.map((doc) {
      return LicenseSpecialist.fromMap(doc.data());
    }).toList();

    // Update the RxList
    licenseSpecialists.value = specialists;
  }
  Future<void> fetchQualityInfromation() async {
    final firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore.collection('qualityInformation').get();

    // Convert the documents into LicenseSpecialist objects
    var specialists = querySnapshot.docs.map((doc) {
      return LicenseSpecialist.fromMap(doc.data());
    }).toList();

    // Update the RxList
    qualityInformation.value = specialists;
  }
  Future<void> fetchSIU() async {
    final firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore.collection('siu').get();

    // Convert the documents into LicenseSpecialist objects
    var specialists = querySnapshot.docs.map((doc) {
      return LicenseSpecialist.fromMap(doc.data());
    }).toList();

    // Update the RxList
    siuModel.value = specialists;
  }
  Future<void> fetchIMU() async {
    final firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore.collection('imu').get();

    // Convert the documents into LicenseSpecialist objects
    var specialists = querySnapshot.docs.map((doc) {
      return LicenseSpecialist.fromMap(doc.data());
    }).toList();

    // Update the RxList
    imuModel.value = specialists;
  }
  Future<void> fetchRegionOne() async {
    final firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore.collection('regionOne').get();

    // Convert the documents into LicenseSpecialist objects
    var specialists = querySnapshot.docs.map((doc) {
      return LicenseSpecialist.fromMap(doc.data());
    }).toList();

    // Update the RxList
    regionOne.value = specialists;
  }
  Future<void> fetchRegionTwo() async {
    final firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore.collection('regionTwo').get();

    // Convert the documents into LicenseSpecialist objects
    var specialists = querySnapshot.docs.map((doc) {
      return LicenseSpecialist.fromMap(doc.data());
    }).toList();

    // Update the RxList
    regionTwo.value = specialists;
  }
  Future<void> fetchRegionThree() async {
    final firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore.collection('regionThree').get();

    // Convert the documents into LicenseSpecialist objects
    var specialists = querySnapshot.docs.map((doc) {
      return LicenseSpecialist.fromMap(doc.data());
    }).toList();

    // Update the RxList
    regionThree.value = specialists;
  }
  Future<void> fetchRegionFour() async {
    final firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore.collection('regionFour').get();

    // Convert the documents into LicenseSpecialist objects
    var specialists = querySnapshot.docs.map((doc) {
      return LicenseSpecialist.fromMap(doc.data());
    }).toList();

    // Update the RxList
    regionFour.value = specialists;
  }
  Future<void> fetchRegionFourPointFive() async {
    final firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore.collection('regionFourPointFive').get();

    // Convert the documents into LicenseSpecialist objects
    var specialists = querySnapshot.docs.map((doc) {
      return LicenseSpecialist.fromMap(doc.data());
    }).toList();

    // Update the RxList
    regionFourPointFive.value = specialists;
  }
  Future<void> fetchRegionFive() async {
    final firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore.collection('regionFive').get();

    // Convert the documents into LicenseSpecialist objects
    var specialists = querySnapshot.docs.map((doc) {
      return LicenseSpecialist.fromMap(doc.data());
    }).toList();

    // Update the RxList
    regionFive.value = specialists;
  }
  Future<void> fetchUseProvider() async {
    final firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore.collection('useProvider').get();

    // Convert the documents into LicenseSpecialist objects
    var specialists = querySnapshot.docs.map((doc) {
      return LicenseSpecialist.fromMap(doc.data());
    }).toList();

    // Update the RxList
    useProvider.value = specialists;
  }
  // Initialize the notification plugin
  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.value.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onNotificationSelect,
    );
  }

  // Handle notification click
  void onNotificationSelect(NotificationResponse response) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/${imageFromImage.replaceAll("assets/", "")}';

    OpenFilex.open(filePath);
  }

  // Method to save image with download progress and trigger notification
  Future<void> saveImageAndShowNotification({required String imageUrl}) async {
    print("imageUrl ${imageUrl.replaceAll("assets/", "")}");
    // Request permission to access storage
    if (await Permission.storage.request().isGranted) {
      ByteData data = await rootBundle.load(imageUrl);
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/${imageUrl.replaceAll("assets/", "")}');

      int totalBytes = data.lengthInBytes;
      int bytesWritten = 0;

      // Start downloading in chunks to simulate progress
      var sink = file.openWrite();

      // Chunk size for progress simulation
      final int chunkSize = totalBytes ~/ 100;

      // Show the initial progress notification
      await showProgressNotification(progress.value, imageUrl);

      // Simulate writing in chunks
      for (int i = 0; i < totalBytes; i += chunkSize) {
        final int end = (i + chunkSize < totalBytes) ? i + chunkSize : totalBytes;
        sink.add(data.buffer.asUint8List(i, end - i));

        bytesWritten += chunkSize;
        progress.value = ((bytesWritten / totalBytes) * 100).toInt();

        // Update the notification with the progress
        await showProgressNotification(progress.value,imageUrl);
        await Future.delayed(Duration(milliseconds: 100));  // Simulate delay for progress
      }

      await sink.flush();
      await sink.close();

      // When download is complete, show the final notification
      await showCompleteNotification(imageUrl);
    } else {
      print("Storage permission not granted.");
    }
  }

  // Show a progress notification
  Future<void> showProgressNotification(int progress, String imageUrl) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'download_channel',
      'Download Notification',
      channelDescription: 'Notification while downloading the image',
      importance: Importance.max,
      priority: Priority.high,
      showProgress:  progress == 100 ? false : true,
      maxProgress: 100,
      progress: progress,
      indeterminate: false,
    );
    NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.value.show(
      0,
      progress == 100 ? "Downloaded Image" :'Downloading Image',
      progress == 100 ? "Completed" : '$progress% completed',
      platformChannelSpecifics,
      payload: imageUrl.replaceAll("assets/", ""),

    );
  }

  // Show a completion notification when the download is done
  Future<void> showCompleteNotification(String imageUrl) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'download_channel',
        'Download Complete',
        channelDescription: 'Notification when image download is complete',
        importance: Importance.max,
        priority: Priority.high,
        showProgress: true,
        colorized: true
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.value.show(
      0,
      'Image Downloaded',
      'Tap to open the image',
      platformChannelSpecifics,
      payload: imageUrl.replaceAll("assets/", ""),

    );
  }
}