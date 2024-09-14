import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import 'const/routes/route_name.dart';
import 'const/routes/router.dart';
import 'features/screens/provider_registration_screen/payment_screens/presentation/services/consts.dart';
import 'firebase_options.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  await _setup();
  runApp(const MyApp());
}


Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDftVxWouArtbhMRLGSIoA0VQPql4_AD7c",
      // authDomain: "530107834672-g083fsp8992h222m88fhenadh1cidsn5.apps.googleusercontent.com",
      projectId: "prov-3cee0",
      // storageBucket: "your-app-id.appspot.com",
      messagingSenderId: "530107834672",
      appId: "1:530107834672:android:d1d9eda426c596c38ba8f5",
    ),
  );
  Stripe.publishableKey = stripePublishableKey;
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    initializeNotifications();
  }

  // Initialize the notification plugin
  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iOSInitializationSettings = DarwinInitializationSettings();

     InitializationSettings initializationSettings = const InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: iOSInitializationSettings,
    );
    await flutterLocalNotificationsPlugin?.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onNotificationSelect,
    );

    await flutterLocalNotificationsPlugin
        ?.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }
  // Future<void> initializeNotifications() async {
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //   AndroidInitializationSettings('@mipmap/ic_launcher');
  //   const InitializationSettings initializationSettings =
  //   InitializationSettings(android: initializationSettingsAndroid);
  //
  //   await flutterLocalNotificationsPlugin?.initialize(
  //     initializationSettings,
  //     onDidReceiveNotificationResponse: onNotificationSelect,
  //   );
  // }

  // Handle notification click
  void onNotificationSelect(NotificationResponse response) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/sample.pdf';
print(filePath);
    final file = File(filePath);
    if (await file.exists()) {
      // Open the file using OpenFilex
      final result = await OpenFilex.open(filePath);

      // Optionally handle the result (you can print/log the result or check for errors)
      if (result.type == ResultType.done) {
        print('File opened successfully.');
      } else {
        print('Error opening file: ${result.message}');
      }
    } else {
      print("File does not exist.");
    }
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      initialRoute: Routes.splashScreenRouteName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: RouteGenerator.onRouteGenerate,

      // home: const SplashScreen(),
    );
  }
}

