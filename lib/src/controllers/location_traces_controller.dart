import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:telephony/telephony.dart';
import 'package:the_citizen_app/src/config/api_endpoint.dart';
import 'package:the_citizen_app/src/controllers/agency_controller.dart';
import 'package:the_citizen_app/src/controllers/attendance_controller.dart';
import 'package:the_citizen_app/src/controllers/user_controller.dart';
import 'package:the_citizen_app/src/enums/enums.dart';
import 'package:the_citizen_app/src/helpers/global_helper.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
import 'package:the_citizen_app/src/models/location_traces.dart';
import 'package:the_citizen_app/src/services/api_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:wifi_iot/wifi_iot.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'package:carrier_info/carrier_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_information/device_information.dart';

import '../hive_models/attendance.dart';
import '../models/known_office_location_model.dart';
import '../models/office_location_model.dart';
import 'location_controller.dart';

class LocationTracesController extends GetxController with ApiService {
  MapController mapCtl = MapController();
  final query = RxString('');
  final pointMarker = RxList<Marker>();
  final locationList = RxList<LocationTraces>();
  final polyline = RxList<Polyline>();
  final polylineLatLng = RxList<LatLng>();
  final selectedOfficer = RxString('');
  final isLoading = RxBool(false);
  final isUser = RxBool(true);
  final searchAgency = RxList();
  final searchUsers = RxList();
  final selectedDate = RxString('');
  DateTime? date;
  final agencyC = Get.put(AgencyController());
  final deviceInfoPlugin = DeviceInfoPlugin();
  final iPAddress = RxString('');
  final phoneIPAddress = RxString('');
  final simCountryCode = RxString('');
  final deviceIMEINumber = RxString('');
  final macAddress = RxString('');
  final appName = RxString('');
  final frequency = RxString('');
  final currentSignalStrength = RxString('');
  final manufacturer = RxString('');
  final model = RxString('');
  final versionRelease = RxString('');

  final networkType = RxString('');
  final networkOperatorName = RxString('');
  final networkOperator = RxString('');
  final simOperator = RxString('');
  final simOperatorName = RxString('');
  final isoCountryCode = RxString('');

  final connectionType = RxString('');
  final signalStrengthWifi = RxString('');
  final signalStrengthMobile = RxString('');

  final int = RxInt(0);

  @override
  void onReady() {
    super.onReady(); //kLog('Init Ip Address');
    getIpAddress();
    //kLog('init carrier info');
    initCarrierInfo();
    //kLog('init device info');
    initDeviceInfo();
    //kLog('init package info');
    initPackageInfo();
    //kLog('init Wifi');
    getWiFiInfo();
    //kLog('Telephony Info');
    // getTelephonyInfo();
    //kLog('Device Info');
    initDeviceInformation();
    //kLog('Sim Country Code');
    initSimCountryCode();
    //kLog('Init Connectivity');
    getConnectivityDetails();
    // kLog('On Ready');
    // if (Get.put(UserController()).currentUser.value != null &&
    //     agencyC.selectedAgencyData.value != null) {
    //   Timer.periodic(Duration(minutes: 5), (Timer t) => addUserLocation());
    //   attendanceCheck();
    // }
  }

  Future<void> getIpAddress() async {
    try {
      final res = await Dio().get<String>('https://api.ipify.org');
      iPAddress.value = res.data!;
      //// kLog('IP Address ${iPAddress.value}');
    } catch (e) {
      // kLog(e.toString());
    }
  }

  attendanceCheck() async {
    final locationC = Get.put(LocationController());
    final agencyC = Get.put(AgencyController());
    final attendanceC = Get.put(AttendanceController());
    attendanceC.attendanceBox = Hive.box<Attendance>('attendance');
    attendanceC.officeLocBox = Hive.box<OfficeLocationModel>('office');
    attendanceC.knownofficeLocBox = Hive.box<KnownOfficeLocationModel>('known');
    attendanceC.otherLocationBox = Hive.box<String>('others');
    attendanceC.locationTypeBox = Hive.box('location_type');
    attendanceC.controllerDestino.clear();
    attendanceC.location.value = '';

    Timer.periodic(Duration(seconds: 15), (Timer t) async {
      await addUserLocation();
      await locationC.getCurrentLocation();

      final attData = attendanceC.attendanceBox.get(0);
    

      
      if (attendanceC.locationTypeBox
          .containsKey(agencyC.selectedAgency!.agencyName)) {
        final locationtype =
            attendanceC.locationTypeBox.get(agencyC.selectedAgency!.agencyName);
        switch (locationtype) {
          case 1:
            attendanceC.locationType.value = LocationType.office;
            print('office');
            if (attendanceC.officeLocBox
                .containsKey(agencyC.selectedAgency!.agencyName)) {
              final loc = attendanceC.officeLocBox
                  .get(agencyC.selectedAgency!.agencyName);

              attendanceC.selectedOfficeLocation.value = loc;
              kLog(loc!.officeLatitude.toString() +
                  ' : ' +
                  loc.officeLongitude.toString());
              attendanceC.controllerDestino.text =
                  attendanceC.selectedOfficeLocation.value!.locationName!;
              attendanceC.location.value =
                  attendanceC.selectedOfficeLocation.value!.locationName!;
              attendanceC.selectedKnownLocation.value = null;

              if (attData!.history.isNotEmpty) {
                if (attendanceC.getDistance(
                        p1: LatLng(
                      double.parse(attendanceC
                          .selectedOfficeLocation.value!.officeLatitude!
                          .toString()),
                      double.parse(attendanceC
                          .selectedOfficeLocation.value!.officeLongitude!
                          .toString()),
                    )) >
                    attendanceC.standartDistance.value) {
                  if (attData.history.last.eventType.toString().toLowerCase() ==
                      'in') {
                    attendanceC.remarks.value = 'Out of Range';
                    await attendanceC.attendanceOut();
                    kLog(attData.history.last.eventType);
                  }
                }
                if (attendanceC.getDistance(
                        p1: LatLng(
                      double.parse(attendanceC
                          .selectedOfficeLocation.value!.officeLatitude!
                          .toString()),
                      double.parse(attendanceC
                          .selectedOfficeLocation.value!.officeLongitude!
                          .toString()),
                    )) <=
                    attendanceC.standartDistance.value) {
                  if (attData.history.last.eventType.toString().toLowerCase() ==
                      'out') {
                    attendanceC.remarks.value = 'Automatic In';
                    await attendanceC.attendanceIN();
                    kLog(attData.history.last.eventType);
                  }
                }
              }
            }
       
            break;
          case 2:
            attendanceC.locationType.value = LocationType.known;
            attendanceC.selectedOfficeLocation.value = null;
            attendanceC.location.value = '';
            if (attendanceC.knownofficeLocBox
                .containsKey(agencyC.selectedAgency!.agencyName)) {
              final loc = attendanceC.knownofficeLocBox
                  .get(agencyC.selectedAgency!.agencyName);
              attendanceC.selectedKnownLocation.value = loc;
              attendanceC.controllerDestino.text =
                  attendanceC.selectedKnownLocation.value!.locationName!;
              attendanceC.location.value =
                  attendanceC.selectedKnownLocation.value!.locationName!;

              if (attData!.history.isNotEmpty) {
                if (attendanceC.getDistance(
                        p1: LatLng(
                      double.parse(attendanceC
                          .selectedKnownLocation.value!.latitude!
                          .toString()),
                      double.parse(attendanceC
                          .selectedKnownLocation.value!.longitude!
                          .toString()),
                    )) >
                    attendanceC.standartDistance.value) {
                  if (attData.history.last.eventType.toString().toLowerCase() ==
                      'in') {
                    attendanceC.remarks.value = 'Out of Range';
                    await attendanceC.attendanceOut();
                    kLog(attData.history.last.eventType);
                  }
                }
                if (attendanceC.getDistance(
                        p1: LatLng(
                      double.parse(attendanceC
                          .selectedKnownLocation.value!.latitude!
                          .toString()),
                      double.parse(attendanceC
                          .selectedKnownLocation.value!.longitude!
                          .toString()),
                    )) <
                    attendanceC.standartDistance.value) {
                  if (attData.history.last.eventType.toString().toLowerCase() ==
                      'out') {
                    attendanceC.remarks.value = 'Automatic In';
                    await attendanceC.attendanceIN();
                    kLog(attData.history.last.eventType);
                  }
                }
              }
            }
            // attendanceC.selectedKnownLocation.value = null;
            // attendanceC.selectedOfficeLocation.value = null;
            attendanceC.othersLocation.value = '';
            break;
          case 3:
            attendanceC.locationType.value = LocationType.others;
            attendanceC.controllerDestino.clear();
            if (attendanceC.otherLocationBox
                .containsKey(agencyC.selectedAgency!.agencyName)) {
              final loc = attendanceC.otherLocationBox
                  .get(agencyC.selectedAgency!.agencyName);

              attendanceC.controllerDestino.text = loc!;
              attendanceC.location.value = loc;
              attendanceC.othersLocation.value = loc;
            }
            attendanceC.selectedKnownLocation.value = null;
            attendanceC.selectedOfficeLocation.value = null;

            break;
          default:
        }
      }
    });
  }

  Future<void> getConnectivityDetails() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.mobile) {
        connectionType.value = 'mobile';
        // if (info.rssi != null)
        // info.signalStrengthMobile = info.rssi?.toDouble();
        signalStrengthMobile.value = currentSignalStrength.value;
        signalStrengthWifi.value = '0.0';
      } else if (connectivityResult == ConnectivityResult.wifi) {
        connectionType.value = 'wifi';
        // if (info.rssi != null) info.signalStrengthWifi = info.rssi?.toDouble();
        signalStrengthMobile.value = '0.0';
        signalStrengthWifi.value = currentSignalStrength.value;
      } else {
        signalStrengthMobile.value = '0.0';
        signalStrengthWifi.value = '0.0';
      }
    } catch (e) {
      // kLog('Cannot access ConnectivityDetails: $e');
    }
  }

  Future<void> getWiFiInfo() async {
    try {
      WiFiForIoTPlugin.isEnabled().then(
        (val) async {
          final ip = await WiFiForIoTPlugin.getIP();
          final mac = await WiFiForIoTPlugin.getBSSID();
          final frequencyData = await WiFiForIoTPlugin.getFrequency();
          final strength = await WiFiForIoTPlugin.getCurrentSignalStrength();
          phoneIPAddress.value = ip!;
          macAddress.value = mac!;
          frequency.value = frequencyData.toString();
          currentSignalStrength.value = strength.toString();
          //// kLog(jsonEncode(wiFiInfo.value));
        },
      );
    } catch (e) {
      // kLog('Cannot access getIpAddress: $e');
    }
  }

  Future<void> getTelephonyInfo() async {
    try {
      final Telephony telephonyInfo = Telephony.instance;
      final bool? result = await telephonyInfo.requestPhoneAndSmsPermissions;
      if (result != null && result) {
        /// NetworkType Represents types of networks for a device.
        final networkTypeData = await telephonyInfo.dataNetworkType;

        final networkOperatorNameData = await telephonyInfo.networkOperatorName;
        final networkOperatorData = await telephonyInfo.networkOperator;
        final simOperatorData = await telephonyInfo.simOperator;
        final simOperatorNameData = await telephonyInfo.simOperatorName;

        networkType.value = networkTypeData.index.toString();
        networkOperatorName.value = networkOperatorNameData!;
        networkOperator.value = networkOperatorData!;
        simOperator.value = simOperatorData!;
        simOperatorName.value = simOperatorNameData!;
      }
    } on PlatformException catch (e) {
      kLog('Cannot access Telephony: $e');
    }
  }

  Future<void> getOperatingSystem() async => Platform.operatingSystem;
  Future<void> getScreenResolution() async =>
      '${window.physicalSize.width} X ${window.physicalSize.height}';

  // init carrier info
  Future<void> initCarrierInfo() async {
    await [
      Permission.locationWhenInUse,
      Permission.phone,
    ].request();

    try {
      final data = await CarrierInfo.getAndroidInfo();
      isoCountryCode.value = data!.telephonyInfo[0].isoCountryCode.toString();
    } catch (e) {
      // kLog(e.toString());
    }
  }

  Future<void> initSimCountryCode() async {
    try {
      final data = await FlutterSimCountryCode.simCountryCode;
      simCountryCode.value = data!;
      //// kLog(simCountryCode.value);
    } on PlatformException catch (e) {
      kLog(e);
    }
  }

  Future<void> initDeviceInformation() async {
    try {
      final data = await DeviceInformation.deviceIMEINumber;
      deviceIMEINumber.value = data;
    } on PlatformException catch (e) {
      kLog(e);
    }
  }

  // init device info
  Future<void> initDeviceInfo() async {
    try {
      final data = await deviceInfoPlugin.androidInfo;
      if (Platform.isAndroid) {
        manufacturer.value = data.manufacturer;
        model.value = data.model;
        versionRelease.value = data.version.release;
      }
    } on PlatformException catch (e) {
      kLog(e);
    }
  }

  // init package info
  Future<void> initPackageInfo() async {
    final packageInfoData = await PackageInfo.fromPlatform();
    appName.value = packageInfoData.appName;
  }

  addUserLocation() async {
    try {
      final selectedAgency = Get.put(AgencyController()).selectedAgency;
      final userC = Get.put(UserController());
      final locationC = Get.put(LocationController());
      //// kLog(locationC.currentLatLng!.latitude);
      //// kLog(locationC.currentLatLng!.longitude);

      final body = {
        'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
        'appCode': 'SURVEY',
        'countryCode': 'BD',
        'username': userC.currentUser.value!.username,
        'uiCodes': ['236541'],
        'modelList': [
          {
            'appCode': 'WFC',
            'appName': appName.value,
            'empCode': 'null',
            'empName': 'null',
            'latitude': locationC.currentLatLng != null
                ? locationC.currentLatLng!.latitude.toString()
                : 'N/A',
            'longitude': locationC.currentLatLng != null
                ? locationC.currentLatLng!.longitude.toString()
                : 'N/A',
            'platform': Platform.operatingSystem,
            'username': userC.currentUser.value!.username,
            'personName': userC.currentUser.value!.personName,
            'visitDate': getCurrrentDateForWF().toString(),
            'visitTime':
                formatDateTime(format: 'yyyy-MM-dd hh:mm:ss').toString(),
            'wsIp': phoneIPAddress.value,
            'wsName':
                '${manufacturer.value} ${model.value} ${versionRelease.value}',
            'status': 'null',
            'ip': iPAddress.value.isNotEmpty ? iPAddress.value : 'N/A',
            'mac': macAddress.value,
            'imei': deviceIMEINumber.value,
            'frequency': frequency.value,
            'signalStrengthWifi': signalStrengthWifi.value,
            'signalStrengthMobile': signalStrengthMobile.value,
            'networkCountryIso': isoCountryCode.value,
            'networkOperator': networkOperator.value,
            'networkType': networkType.value.toString(),
            'networkOperatorName': networkOperatorName.value,
            'simCountryIso': simCountryCode.value,
            'simOperatorName': simOperatorName.value,
            'simOperator': simOperator.value,
            'agencyCode': selectedAgency!.agencyCode,
            'agencyId': selectedAgency.agencyId,
            'projectCode': 'null',
            'assignId': '',
            'areaLevelFullCode': 'null',
            'areaType': 'null',
            'areaLevel': 'null',
            'refNumber': '2b5432a8-7d3b-46d2-b871-c5aba3f51323',
            'broadcastEnabled': 'false'
          }
        ]
      };
      //// kLog(jsonEncode(body));

      // ignore: unused_local_variable
      final res = await postDynamic(
        path: '${dotenv.env['BASE_URL_LOG']}/add_user_location_traces',
        body: body,
      );
      //// kLog(res);
    } on DioError catch (e) {
      kLog(e.message);
    }
  }

//date picker
  void selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2030));

    if (pickedDate != null) {
      date = pickedDate;
      selectedDate.value = formatDate(date: pickedDate.toString());
    } else {}
  }

  void searchData(bool isUser) async {
    isLoading.value = true;

    final username = Get.put(UserController()).username;
    final body = {
      'apiKey': ApiEndpoint.KYC_API_KEY,
      'appCode': ApiEndpoint.WFC_APP_CODE,
      'username': username,
      'searchText': query.value,
    };

    switch (isUser) {
      case false:
        final res =
            await postDynamic(path: ApiEndpoint.getAgencyUrl(), body: body);
        //  // kLog(res.data['data']);

        final data = res.data['data'].map((x) => x).toList() as List;

        if (data.isNotEmpty) {
          searchAgency.clear();
          searchAgency.addAll(List.from(data));
        }
        break;
      case true:
        final res =
            await postDynamic(path: ApiEndpoint.srcUserUrl(), body: body);
        kLog(res.data['data']);

        final data = res.data['data'] as List;

        if (data.isNotEmpty) {
          searchUsers.clear();
          searchUsers.addAll(List.from(data));
        }
        break;
      default:
    }

    isLoading.value = false;
  }

  getLocation() async {
    final selectedAgency = Get.put(AgencyController()).selectedAgency;
    final body = {
      'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
      'appCode': 'SURVEY',
      'uiCodes': ['236541'],
      'username': selectedOfficer.value,
      'date': DateFormat('yyyy-MM-dd').format(date!),
      'agencyId': selectedAgency!.agencyId,
    };
    //     {
    //   "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
    //   "appCode": "SURVEY",
    //   "uiCodes": ["236541"],
    //   "username": "kanon",
    //   "date": "2022-05-23",
    //   "agencyId": "8d369ad3-b8d4-413e-9952-230cf3d471ea"
    // };
    kLog(body);
    final res =
        await postDynamic(path: ApiEndpoint.getLocationTracesUrl(), body: body);
    kLog(res.data);
    final locationData = res.data['data']
        .map((json) => LocationTraces.fromJson(json as Map<String, dynamic>))
        .toList()
        .cast<LocationTraces>() as List<LocationTraces>;
    kLog(locationData);
    if (locationData.isNotEmpty) {
      pointMarker.clear();
      polylineLatLng.clear();
      polyline.clear();
      locationList.addAll(locationData);
      locationList.forEach((x) async {
        pointMarker.add(
          Marker(
              point: LatLng(x.latitude!, x.longitude!),
              builder: (_) {
                return GestureDetector(
                  onTap: () async {
                    kLog('value');
                    //  await locationDetailsMoadal(x);
                    Get.dialog(Dialog(
                      child: Container(
                        height: 500,
                        color: Colors.amber,
                      ),
                    ));
                  },
                  child: Icon(
                    Icons.circle,
                    color: Colors.green,
                  ),
                );
              }),
        );
        polylineLatLng.add(LatLng(x.latitude!, x.longitude!));
        polyline.add(Polyline(points: polylineLatLng, color: Colors.green));
      });
    }
  }

  locationDetailsMoadal(LocationTraces location) async {
    // await getUserImageFromAPI();
    await Get.dialog(Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          width: Get.width,
          // Bottom rectangular box
          margin: EdgeInsets.only(top: 60),
          // to push the box half way below circle
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.only(top: 60, left: 20, right: 20),
          // spacing inside the box
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 10),
              Align(
                child: Row(
                  children: [
                    Icon(
                      Icons.person_sharp,
                      color: hexToColor('#72778F'),
                    ),
                    SizedBox(width: 10),
                    Text(
                      location.username ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 14.0,
                        color: hexToColor('#72778F'),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: 10),
              Align(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        location.latitude.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 14.0,
                          color: hexToColor('#72778F'),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        location.longitude.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 14.0,
                          color: hexToColor('#72778F'),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
