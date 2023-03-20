import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_citizen_app/src/config/api_endpoint.dart';
import 'package:the_citizen_app/src/controllers/my_team_locations_controller.dart';
import 'package:the_citizen_app/src/controllers/user_controller.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/models/process_shout.dart';
import 'package:the_citizen_app/src/services/api_service.dart';
import 'package:get/get.dart';

class MyReportListController extends GetxController with ApiService {
  final isLoading = RxBool(false);
  final reportList = RxList<ProcessShout?>([]);
  final files = RxList<Uint8List?>([]);
  final image = Rx<Uint8List?>(null);
  getReports() async {
    try {
      isLoading.value = true;
      // final selectedAgency = Get.put(AgencyController()).selectedAgency;
      final username = Get.put(UserController()).username;
      final body = {
        "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
        "countryCode": "BD",
        "username": username, // username,
        "uiCodes": ["121001"],
        "appCode": "SHOUT",
        "shoutTypes": ["MYSHOUT"]
      };

      final res = await postDynamic(
        path: ApiEndpoint.getShoutIncidentByUsernameUrl(),
        body: body,
      );

      if (res.data['status'] != null && res.data['status'].contains('successful') == true) {
        isLoading.value = false;
        final advanceListData = res.data['data']
            .map((json) => ProcessShout.fromJson(json as Map<String, dynamic>))
            .toList()
            .cast<ProcessShout>() as List<ProcessShout>;

        if (advanceListData.isNotEmpty) {
          reportList.clear();
          reportList.addAll(advanceListData);
        }
      }
      isLoading.value = false;
    } on DioError catch (e) {
      kLog(e.message);
    }
  }

  userModal({ProcessShout? userInfo}) {
    final teamC = Get.put(MyTeamLocationController());
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      insetPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        height: 250,
        color: Colors.black54,
        child: Obx(
          () => Stack(
            children: [
              Container(
                color: Colors.white,
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 5, child: KText(text: 'Assigned Person: ')),
                        Expanded(
                          flex: 6,
                          child: KText(
                            text: userInfo!.officerFullname,
                            bold: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 5,
                          child: KText(text: 'Agency Name: '),
                        ),
                        Expanded(
                          flex: 6,
                          child: KText(
                            text: userInfo.agencyName,
                            maxLines: 2,
                            bold: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 5, child: KText(text: 'Phone: ')),
                        Expanded(
                          flex: 6,
                          child: KText(
                            text: userInfo.officerMobile,
                            bold: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 5, child: KText(text: 'Email: ')),
                        Expanded(
                          flex: 6,
                          child: KText(
                            text: userInfo.officerEmail,
                            maxLines: 2,
                            bold: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 5,
                child: teamC.image.value != null
                    ? CircleAvatar(
                        backgroundColor: hexToColor('#EFF6FF'),
                        radius: 40,
                        child: Image.memory(
                          teamC.image.value!,
                          // GetStorage().read('image'),
                          fit: BoxFit.cover,
                          // width: 55.0 * 2,
                          // height: 55.0 * 2,
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: hexToColor('#EFF6FF'),
                        radius: 40,
                        child: Image.asset(
                          "assets/images/profile_avatar.png",
                          fit: BoxFit.cover,
                          // width: 55.0 * 2,
                          // height: 55.0 * 2,
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  getShoutImageFromApi({
    String? id,
    String? username,
    //  String? fileType,
    String? categoryCode,
    String? subcategoryCode,
    int? fileSequence,
  }) async {
    final token = Get.put(UserController().getToken());
    final body = {
      'apiKey': ApiEndpoint.KYC_API_KEY,
      'ids': [id],
      'fileSequence': fileSequence,

      'appCode': 'SHOUT',
      'fileCategory': 'FILE_CATEGORY_SHOUT',
      'countryCode': 'BD',

      'categoryCode': categoryCode,
      'subcategoryCode': subcategoryCode,
      //'fileType': fileType,
      'username': username,
    };

    kLog(jsonEncode(body));

    final res = await Dio().post(ApiEndpoint.getShoutIncidentFileByIdAndSequenceUrl(),
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
    kLog(res.statusCode);
    if (res.statusCode == 200) {
      image.value = res.data;
      files.add(image.value);
    }

    kLog(files.length);
  }

  mapMyReportListImageFetched({ProcessShout? userInfo}) async {
    for (var i = 1; i <= 3; i++) {
      try {
        await getShoutImageFromApi(
          fileSequence: i,
          categoryCode: userInfo!.categoryCode,
          subcategoryCode: userInfo.subcategoryCode,
          id: userInfo.id,
          username: userInfo.officerUsername,
          // fileType: 'thumbnail'
        );
      } catch (e) {
        kLog(e.toString());
      }
    }
  }
}
