import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:laundry_middle_transportation/model/order_model.dart';

import 'package:laundry_middle_transportation/presentation/screens/building.dart';

import 'package:laundry_middle_transportation/presentation/screens/sign_up_page.dart';
import 'package:laundry_middle_transportation/presentation/screens/staff_trip.dart';
import 'package:laundry_middle_transportation/presentation/screens/upload_list_screen.dart';
import 'package:laundry_middle_transportation/repository/firebase_api.dart';
import 'package:laundry_middle_transportation/presentation/screens/item.dart';
import 'package:laundry_middle_transportation/presentation/widgets/custom_navigaton.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:laundry_middle_transportation/presentation/screens/login_page.dart';
import 'package:laundry_middle_transportation/presentation/screens/upload_screen.dart';
import 'package:laundry_middle_transportation/presentation/screens/splash_screen.dart';
import 'package:laundry_middle_transportation/presentation/screens/error_screen.dart';
import 'package:laundry_middle_transportation/dashboard.dart';
import 'package:laundry_middle_transportation/presentation/screens/order.dart';
import 'package:laundry_middle_transportation/presentation/screens/profile/profile_screen.dart';
import 'package:laundry_middle_transportation/presentation/screens/orderOfLaundryStore.dart';
import 'package:laundry_middle_transportation/presentation/screens/laundry_dashboard.dart';

import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotificaiton();
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    MaterialApp(
      title: 'Bottom Navigation Bar',
      // home: OrderByLaundryStore(laundryStoreID: "94660"),
      home: SplashScreen(),

      debugShowCheckedModeBanner: false,
      routes: {
        '/staff': (context) => Dashboard(),
        '/laundrystore': (context) => Home(),
      },
    ),
  );
}
