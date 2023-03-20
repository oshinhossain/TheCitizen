import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:the_citizen_app/src/config/api_endpoint.dart';
import 'package:the_citizen_app/src/controllers/agency_controller.dart';
import 'package:the_citizen_app/src/controllers/user_controller.dart';
import 'package:the_citizen_app/src/helpers/dialogHelper.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
import 'package:the_citizen_app/src/models/process_shout.dart';

import 'package:the_citizen_app/src/services/api_service.dart';

class HomePageMapController extends GetxController with ApiService {
  MapController mapCtl = MapController();
  final isLoading = RxBool(false);
  LatLng? latLong;
  final markers = RxList<Marker>();
  getShouts() async {
    try {
      isLoading.value = true;
      final selectedAgency = Get.put(AgencyController()).selectedAgency;
      final username = Get.put(UserController()).username;
      final body = {
        'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
        'countryCode': 'BD',
        'username': username, // username,
        'uiCodes': [121061],
        'appCode': 'SHOUT',
        'shoutTypes': ['PENDING'],
        'agencyId': selectedAgency!.agencyId,
        'agencyIds': [selectedAgency.agencyId],
        'currentPage': 0,
        'offset': 50
      };
      kLog(jsonEncode(body));

      final res = await postDynamic(
        path: ApiEndpoint.getShoutIncidentByUsernameUrl(),
        body: body,
      );
      kLog(res.data);
      if (res.data['status'] != null && res.data['status'].contains('successful') == true) {
        isLoading.value = false;
        final shouttData = res.data['data']
            .map((json) => ProcessShout.fromJson(json as Map<String, dynamic>))
            .toList()
            .cast<ProcessShout>() as List<ProcessShout>;

        if (shouttData.isNotEmpty) {
          latLong = LatLng(shouttData.first.latitude!, shouttData.first.longitude!);
          shouttData.forEach((shoutIncidentsModel) {
            LatLng _latLng = new LatLng(shoutIncidentsModel.latitude!, shoutIncidentsModel.longitude!);
            markers.add(
              Marker(
                  width: 90,
                  height: 90,
                  point: _latLng,
                  builder: (ctx) {
                    return GestureDetector(
                      onTap: () async {
                        DialogHelper.shoutDetailsDialog(title: 'Shout Details', shoutDetails: shoutIncidentsModel);
                      },
                      child: Column(
                        children: [
                          (shoutIncidentsModel.fulfillmentStatus?.toLowerCase().toString().trim() == 'verified')
                              ? Image.asset(
                                  "assets/icons/icon_marker_completed.png",
                                  width: 44,
                                  height: 70,
                                  fit: BoxFit.cover,
                                )
                              : ((shoutIncidentsModel.fulfillmentStatus?.toLowerCase().toString().trim() == 'started')
                                  ? Image.asset(
                                      "assets/icons/icon_marker_started.png",
                                      width: 44,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    )
                                  : Icon(
                                      Icons.location_on,
                                      size: 57.0,
                                      color: Colors.black87,
                                    )),
                          // Icon(
                          //   Icons.location_on,
                          //   size: 55.0,
                          //   color: (shoutIncidentsModel.fulfillmentStatus?.toLowerCase().toString().trim() == 'verified')
                          //       ? Colors.green
                          //       : ((shoutIncidentsModel.fulfillmentStatus?.toLowerCase().toString().trim() == 'started')
                          //           ? Colors.yellow
                          //           : Colors.black87),
                          // ),
                          SizedBox(height: 20),
                        ],
                      ),
                    );
                  }),
            );
          });

          // reportList.clear();
          // reportList.addAll(shouttData);
        }
      }
      //   isLoading.value = false;
    } on DioError catch (e) {
      kLog(e.message);
    }
  }
}
