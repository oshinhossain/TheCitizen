import 'dart:convert';

import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/api_endpoint.dart';
import 'package:the_citizen_app/src/controllers/agency_controller.dart';
import 'package:the_citizen_app/src/controllers/user_controller.dart';
import 'package:the_citizen_app/src/helpers/custom_dialog_helper.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import 'package:the_citizen_app/src/models/process_shout.dart';
import 'package:the_citizen_app/src/services/api_service.dart';

class RateShoutClosureController extends GetxController with ApiService {
  final rateShoutList = RxList<ProcessShout>([]);
  final ratting = RxInt(3);
  final comment = RxString('');
  final isSubmit = RxBool(false);
  getrateShout() async {
    final selectedAgency = Get.put(AgencyController()).selectedAgency;
    final username = Get.put(UserController()).username;
    final body = {
      'username': username,
      'appCode': 'SHOUT',
      'uiCodes': ['122022'],
      'shoutTypes': ['RATE_MYSHOUT'],
      'agencyIds': [selectedAgency!.agencyId],
      'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
    };
    kLog(jsonEncode(body));
    final res = await postDynamic(path: ApiEndpoint.getShoutIncidentByUsernameUrl(), body: body, authentication: true);
    final rateShoutData = res.data['data']
        .map((json) => ProcessShout.fromJson(json as Map<String, dynamic>))
        .toList()
        .cast<ProcessShout>() as List<ProcessShout>;
    kLog(res.data);
    rateShoutList.clear();
    rateShoutList.addAll(rateShoutData);
  }

  rattingShout({String? id, double? lat, double? lang}) async {
    isSubmit.value = true;
    final username = Get.put(UserController()).username;
    final body = {
      'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
      'appCode': 'SHOUT',
      'uiCodes': ['122022'],
      'username': username,
      'ids': [id],
      'latitude': lat,
      'longitude': lang,
      'rating': ratting.value,
      'comments': [comment.value]
    };
    kLog(body);
    final res = await postDynamic(path: ApiEndpoint.rateShoutIncidentUrl(), body: body);
    kLog(res.data);
    if (res.data['status'] != null && res.data['status'].contains('successful') == true) {
      isSubmit.value = false;
      CustomDialogHelper.successDialog(
        title: 'Success!',
        msg: res.data['message'].toString(),
        color: hexToColor('#00B485'),
        path: 'success-circular',
        onPressed: () {
          comment.value = '';
          ratting.value = 0;

          back();
          // disposeData();
        },
      );
    } else {
      isSubmit.value = false;
      CustomDialogHelper.successDialog(
        title: 'Unsuccessful!',
        msg: res.data['message'][0].toString(),
        color: hexToColor('#FF3C3C'),
        path: 'cancel_circle',
        onPressed: () {
          back();
        },
      );
    }
  }
}
