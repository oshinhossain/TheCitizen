import 'dart:io';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:the_citizen_app/src/hive_models/agency_list.dart';
import 'package:the_citizen_app/src/hive_models/attendance.dart';
import 'package:the_citizen_app/src/hive_models/selected_agency.dart';

import '../hive_models/agency_model.dart';
import '../hive_models/attendance_history.dart';
import '../hive_models/local_agency_role_model.dart';
import '../hive_models/user_image.dart';
import '../models/known_office_location_model.dart';
import '../models/office_location_model.dart';
import '../models/user.dart';

class HiveService extends GetxService {
  Future<void> onInitForApp() async {
    Directory appDocumentDir = await getApplicationDocumentsDirectory();

    Hive.init(appDocumentDir.path);

    registerAdapters();

    await openBoxes();

    print('Hive initialized for app');
  }

  //Hive initialized for background service
  Future<void> onInitForBackground() async {
    if (Platform.isAndroid) PathProviderAndroid.registerWith();

    Directory appDocumentDir = await getApplicationDocumentsDirectory();

    Hive.init(appDocumentDir.path);

    registerAdapters();

    await openBoxes();

    print('Hive initialized for background service');

    await Hive.close();
  }

  Future<void> openBoxes() async {
    await Hive.openBox<User>('user');
    await Hive.openBox<AgencyList>('local_agency');
    await Hive.openBox<SelectedAgency>('selected_agency');
    await Hive.openBox<AgencyModel>('agencies');

    await Hive.openBox<UserImage>('user_image');
    //attendance

    await Hive.openBox<Attendance>('attendance');
    await Hive.openBox<AttendanceHistory>('attendance_history');
   // await Hive.openBox<List<AttendanceHistory>>('attendance_history1');
    await Hive.openBox<OfficeLocationModel>('office');
    await Hive.openBox<KnownOfficeLocationModel>('known');
    await Hive.openBox<String>('others');
    await Hive.openBox<int>('location_type');
  }

  void registerAdapters() {
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(AgencyListAdapter());
    Hive.registerAdapter(AttendanceAdapter(), override: true);
    Hive.registerAdapter(AttendanceHistoryAdapter(), override: true);
    Hive.registerAdapter(AgencyModelAdapter(), override: true);
    //----------------------------------
    Hive.registerAdapter(LocalAgencyRoleModelAdapter());
    Hive.registerAdapter(SelectedAgencyAdapter());
    Hive.registerAdapter(UserImageAdapter(), override: true);
    Hive.registerAdapter(OfficeLocationModelAdapter(), override: true);
    Hive.registerAdapter(KnownOfficeLocationModelAdapter(), override: true);
  }
}
