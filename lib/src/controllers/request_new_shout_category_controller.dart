import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_citizen_app/src/config/api_endpoint.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/controllers/agency_controller.dart';
import 'package:the_citizen_app/src/controllers/user_controller.dart';
import 'package:the_citizen_app/src/helpers/custom_dialog_helper.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';

import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import 'package:the_citizen_app/src/models/request_new_shout_category.dart';
import 'package:the_citizen_app/src/services/api_service.dart';
import 'package:get/get.dart';

class RequestNewShoutCategoryController extends GetxController with ApiService {
  final description = RxString('');
  final categoryName = RxString('');
  final isLoading = RxBool(false);
  final isSubmit = RxBool(false);
  final myRequestList = RxList<RequestNewShoutCategory?>([]);

  myShoutRequestGet() async {
    isLoading.value = true;
    final selectedAgency = Get.put(AgencyController()).selectedAgency;
    final username = Get.put(UserController()).username;
    final params = {
      'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
      'appCode': 'SHOUT',
      'agencyIds': [selectedAgency!.agencyId],
      'username': username
    };
    kLog('params');
    kLog(params);
    final res = await getDynamic(path: ApiEndpoint.getShoutCategoryRequestUrl(), queryParameters: params);
    final myReqData = res.data['data']
        .map((json) => RequestNewShoutCategory.fromJson(json as Map<String, dynamic>))
        .toList()
        .cast<RequestNewShoutCategory>() as List<RequestNewShoutCategory>;

    myRequestList.clear();
    myRequestList.addAll(myReqData);
    isLoading.value = false;
    kLog(myRequestList);
  }

  addNewShout() async {
    isSubmit.value = true;
    final selectedAgency = Get.put(AgencyController()).selectedAgency;
    final username = Get.put(UserController()).username;
    final body = {
      'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
      'appCode': 'SHOUT',
      'agencyIds': [selectedAgency!.agencyId],
      'username': username,
      'modelList': [
        {
          'categoryName': categoryName.value,
          'categoriesDescription': description.value,
          'requestDate': DateFormat('yyyy-MM-dd').format(DateTime.now())
        }
      ]
    };
    kLog('body');
    kLog(body);
    final res = await postDynamic(path: ApiEndpoint.addShoutCategoryUrl(), body: body);
    kLog(res.data);
    if (res.data['status'] != null && res.data['status'].contains('successful') == true) {
      isSubmit.value = false;
      CustomDialogHelper.successDialog(
        title: 'Success!',
        msg: res.data['message'].toString(),
        color: hexToColor('#00B485'),
        path: 'success-circular',
        onPressed: () {
          categoryName.value = '';
          description.value = '';
          kLog(categoryName);
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
