import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/controllers/agency_controller.dart';
import 'package:the_citizen_app/src/controllers/user_controller.dart';

import '../helpers/k_log.dart';
import '../models/validate_identity_status_model.dart';
import '../services/api_service.dart';

class ValidateIdentityController extends GetxController with ApiService {
  final _dio = Dio();
  // final user = Rx<User?>(null);
  final validateIdentityStatus = Rx<ValidateIdentityStatus?>(null);

  final isLoading = RxBool(false);

  Future<void> getValidateIdentityStatusGet() async {
    try {
      isLoading.value = true;
      //final selectedAgency = Get.put(AgencyController()).selectedAgency;

      final username = Get.put(UserController()).username;
      final body = {
        'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
        'appCode': 'SHOUT',
        'username': username,
      };
      // kLog(body);
      final res = await getDynamic(
          path: '${dotenv.env['BASE_URL_KYC']}/v1/validate-identity-status/get',
          queryParameters: body,
          authentication: true);

      kLog('-------------------------------------------------');
      kLog(res);
      if (res.data['status'] != null) {
        validateIdentityStatus.value =
            ValidateIdentityStatus.fromJson(res.data['data']);
        // kLog('jjjjjjjjjjjjjjjjjjjj');
        // kLog(validateIdentityStatus);

      }
    } on DioError catch (e) {
      kLog(e);
    }
  }
}
