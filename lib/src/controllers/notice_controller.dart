import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:the_citizen_app/src/controllers/user_controller.dart';
import '../models/notice.dart';
import '../services/api_service.dart';

class NoticeController extends GetxController with ApiService {
  final userC = Get.put(UserController());
  final _dio = Dio();

  final notice = RxList<Notice>([]);
  final isLoading = RxBool(false);

  void getNoticeByUsername() async {
    try {
      isLoading.value = true;
      final username = Get.put(UserController()).username;
      final res = await _dio.post(
        '${dotenv.env['BASE_URL_KYC']}/get_notices_by_agency',
        data: {
          "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
          "appCode": "SHOUT",
          "uiCodes": ["0000"],
          "username": username,
          "latitude": "23.7746479",
          "longitude": "90.4031033"
        },
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
          headers: {
            'Content-Type': 'application/json',
            'latLng': '23.90560,93.094535',
            'Authorization': 'Bearer ${userC.getToken()}'
          },
        ),
      );

      if (res.data['status'] != null &&
          res.data['status'].contains('successful') == true) {
        final noticeData = res.data['data']
            .map((json) => Notice.fromJson(json))
            .toList()
            .cast<Notice>() as List<Notice>;

        if (noticeData.isNotEmpty) {
          isLoading.value = false;
          notice.clear();
          notice.addAll(noticeData);
        }
      }
      isLoading.value = false;
    } on DioError catch (e) {
      log(e.message);
    }
  }
  //---------------------------------------------------------------------------

  //---------------------------------------------------------------------------

}
