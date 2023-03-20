import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import 'package:the_citizen_app/src/config/api_endpoint.dart';
import 'package:the_citizen_app/src/controllers/agency_controller.dart';
import 'package:the_citizen_app/src/controllers/location_controller.dart';
import 'package:the_citizen_app/src/controllers/user_controller.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
import 'package:the_citizen_app/src/models/my_team.dart';
import 'package:the_citizen_app/src/services/api_service.dart';

class MyTeamLocationController extends GetxController with ApiService {
  MapController mapCtl = MapController();

  final myTeam = RxList();
  final myTeamMembers = RxList();
  final myTeamMember = RxList<MyTeam>([]);
  final teamMemberMarker = RxList<Marker>();
  final showTeam = RxBool(false);
  final image = Rx<Uint8List?>(null);

  getMyAgencyTeamMember() async {
    // myTeamMember.clear();
    void mapServerDataToTreeData(Map data) {
      List.from(data['myTeam'].map((x) => mapServerDataToTreeData(x)));

      myTeamMembers.add(data);
    }

    final selectedAgency = Get.put(AgencyController()).selectedAgency;
    final username = Get.put(UserController()).username;
    final locationC = Get.put(LocationController());
    final body = {
      'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
      'uiCodes': [0000],
      'appCode': 'SHOUT',
      'uiSections': ['AGENCY_TEAM'],
      'username': username,
      'agencyIds': [selectedAgency!.agencyId],
      'latitude': locationC.latLng.value.latitude,
      'longitude': locationC.latLng.value.longitude
    };
    kLog(body);
    final res = await postDynamic(path: ApiEndpoint.getMyAgencyTeamAllUrl(), body: body, authentication: true);
    //  kLog(jsonEncode(res.data));

    if (res.statusCode == 200) {
      kLog('my team');
      kLog(myTeam.length);

      myTeam.clear();
      myTeam.value = res.data['data']['myTeam'];

      List.generate(
        myTeam.length,
        (index) => mapServerDataToTreeData(myTeam[index]),
      ).toList();

      myTeamMember.value = (myTeamMembers).map((e) => MyTeam.fromJson(e)).toList();

      kLog('my team member 1');
      kLog(myTeamMember.length);
      // myTeamMember.clear();
      // myTeamMember.value = teamMemberList;
      kLog('my team member2');
      kLog(myTeamMember.length);
      if (myTeamMember.isNotEmpty) {
        myTeamMember.forEach((teamMember) {
          teamMemberMarker.add(Marker(
              point: LatLng(teamMember.latitude!, teamMember.longitude!),
              builder: (ctx) {
                return GestureDetector(
                  onTap: () async {
                    await getUserImageFromAPI(teamMember.username!);
                    teamMemberDetailsMoadal(teamMember);
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      //  color: MyHexColor('#EFF6FF'),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          spreadRadius: 1,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: hexToColor('#EFF6FF'),
                      radius: 27.0 - 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/profile_avatar.png",
                          fit: BoxFit.cover,
                          width: 27.0 * 2,
                          height: 27.0 * 2,
                        ),
                      ),
                    ),
                  ),
                );
              }));
        });
      }
    }
  }

  getUserImageFromAPI(String username) async {
    // final username = Get.put(UserController()).username;
    final token = Get.put(UserController().getToken());

    final body = {
      'apiKey': ApiEndpoint.KYC_API_KEY,
      'username': username,
      'imgType': 'icon',
      'appCode': 'KYC',
      'fileCategory': 'photo',
      //  'fileCategory': 'FILE_CATEGORY_PHOTO',
      'countryCode': 'BD'
    };
    kLog(jsonEncode(body));

    final res = await Dio().post(ApiEndpoint.getUserAttachmentByFileCategoryUrl(),
        options: Options(
          followRedirects: false,
          responseType: ResponseType.bytes,
          validateStatus: (status) => true,
          headers: {
            'Content-Type': 'application/json',
            'latLng': '${locationC.latLng.value.latitude},${locationC.latLng.value.longitude}',
            'Authorization': 'Bearer ${token}'
          },
        ),
        data: body);
    if (res.statusCode == 200) {
      image.value = res.data;
    }

    kLog(res.data);
  }

  teamMemberDetailsMoadal(MyTeam team) async {
    // await getUserImageFromAPI();
    Get.dialog(Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
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
                  Align(
                    child: Padding(
                      padding: EdgeInsets.only(left: 3),
                      child: Text(
                        team.fullname ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 16.0,
                            color: hexToColor('#141C44'),
                            fontWeight: FontWeight.w500,
                            height: 1),
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
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
                          team.roleModel?.roleName ?? '',
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
                    child: GestureDetector(
                      onTap: () {
                        // if (!Utility.isEmptyString(agencyTeam.email)) {
                        //   launch('mailto:${agencyTeam.email}');
                        // }
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: hexToColor('#72778F'),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              team.email ?? '',
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
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 10),
                  Align(
                    child: GestureDetector(
                      onTap: () {
                        // if (!Utility.isEmptyString(agencyTeam.mobile)) {
                        //   Utility.makePhoneCall(context: context, phoneNumber: agencyTeam.mobile);
                        // }
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.call,
                            color: hexToColor('#72778F'),
                          ),
                          SizedBox(width: 10),
                          Text(
                            team.mobile ?? '',
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
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 10),
                  Align(
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: hexToColor('#72778F'),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '${team.latitude}, ${team.longitude}',
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
                  SizedBox(height: 10),
                  Align(
                    child: Row(
                      children: [
                        Icon(
                          Icons.watch_later,
                          color: hexToColor('#72778F'),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '${team.currentLocationUpdatedOn} at ${team.currentLocationUpdatedAt}',
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
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            image.value != null
                ? Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: CircleAvatar(
                      backgroundColor: hexToColor('#EFF6FF'),
                      radius: 55.0 - 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.memory(
                          image.value!,
                          // GetStorage().read('image'),
                          fit: BoxFit.cover,
                          width: 55.0 * 2,
                          height: 55.0 * 2,
                        ),
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: CircleAvatar(
                      backgroundColor: hexToColor('#EFF6FF'),
                      radius: 55.0 - 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/profile_avatar.png",
                          fit: BoxFit.cover,
                          width: 55.0 * 2,
                          height: 55.0 * 2,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    ));
  }
}
