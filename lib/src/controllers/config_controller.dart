import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_citizen_app/src/controllers/agency_controller.dart';
import 'package:the_citizen_app/src/controllers/shout_controller.dart';

import 'package:the_citizen_app/src/helpers/route.dart';
import 'package:the_citizen_app/src/hive_models/agency_list.dart';
import 'package:the_citizen_app/src/models/user.dart';
import 'package:the_citizen_app/src/models/usermodel.dart';
import 'package:the_citizen_app/src/pages/login_page.dart';
import 'package:the_citizen_app/src/pages/main_page.dart';
import 'dart:async';

import '../config/app_theme.dart';
import '../config/base.dart';

import '../services/hive_service.dart';
import 'notice_controller.dart';

class ConfigController extends GetxController with Base {
  Future<void> initAppConfig() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize global environment variables
    await dotenv.load();
    // ---------------------------------------------------
    // Initialize Hive DB
    await Get.put(HiveService()).onInitForApp();
    // ---------------------------------------------------

    //---------To get Location Permission-----------------
    // To get location permition.
    await locationC.getLocationPermission();

    // To listen current latlng after per second.
    await locationC.locationListener();
    //--------------------- End -------------------------

    // Setup App system theme [AppBar & System Navigation]
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppTheme.appbarColor,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.grey[50],
      systemNavigationBarColor: Colors.grey[50],
    ));
    // ---------------------------------------------------

    // Set Orientation [default : portrait]
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // ---------------------------------------------------
  }

// Initialize page after default configuration
  void init() async {
    await Future.delayed(Duration(seconds: 2));

    final agencyBox = Hive.box<AgencyList>('local_agency');
    final agency = agencyBox.get('agency_list');
    //------------------------------------------------
    final userBox = Hive.box<User>('user');
    final localUser = userBox.get('current_user');

    if (userBox.containsKey('current_user') && localUser!.token != null) {
      userC.currentUser.value = localUser;

      authC.userDetail.value =
          ProfileUserModel(username: localUser.username, homeAddress: localUser.homeAddress, role: localUser.role);
      await Get.put(AgencyController()).getAgenciesFromLocalDB();
      //----------------------------------------------

      // Get.put(AgencyController()).getAgenciesByUsername();
     // Get.put(ShoutController()).getShoutCategory();
     // Get.put(ShoutController()).getShoutSubCategory();
      Get.put(ShoutController()).getShoutCategory();
      // Get.put(ShoutController()).getShoutSubCategory();
      Get.put(NoticeController()).getNoticeByUsername();
      offAll(MainPage());

      // offAll(ValidateMyIdentityPage());
    } else {
      offAll(LoginPage());
    }
  }
// ---------------------------------------------------
}
