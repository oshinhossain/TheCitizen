import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_citizen_app/src/helpers/dialogHelper.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
import '../helpers/route.dart';
import '../models/user.dart';
import '../pages/login_page.dart';
import '../services/api_service.dart';

class UserController extends GetxController with ApiService {
  final _dio = Dio();
  // final user = Rx<User?>(null);
  final currentUser = Rx<User?>(null);

  final isLoading = RxBool(false);
  // For Forgot Username
  final forgotUsername = RxString('');
  final otp = RxString('');
  // ------------------------------------------------------------

  // For Forgot Password
  final forgotPassword = RxString('');
  // ------------------------------------------------------------

  String? get username =>
      currentUser.value != null ? currentUser.value!.username : null;

  // Forget User Name
  forgetUsernameByEmail() async {
    try {
      final res = await _dio.get(
        '${dotenv.env['BASE_URL']}/request_for_forget_username?apiKey=ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5&email=${forgotUsername.value}',
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
          headers: {
            'Content-Type': 'application/json',
            'latLng': '23.90560,93.094535'
            // 'Authorization': 'Bearer ${getToken()}'
          },
        ),
      );

      print(res.data);
      if (res.data['message'] != null &&
          res.data['message'].contains('Invalid email.') == true) {
        back();
        DialogHelper.forgetPassShowErrorDialog(
            msg: 'Your Email doesn\'t exist.');
      } else if (res.data['responseCode'] != null &&
          res.data['responseCode'] == '200') {
        back();
        DialogHelper.showOtpAndNewPassInputDialog();
      } else {
        print('<<<<<<<<Email Send>>>>>>>>');

        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  sendOtpByEmail() async {
    try {
      final res = await _dio.get(
        '${dotenv.env['BASE_URL']}/get_forget_username_by_otp?apiKey=ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5&email=${forgotUsername.value}&otp=${otp.value}',
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
          headers: {
            'Content-Type': 'application/json',
            'latLng': '23.90560,93.094535'
            // 'Authorization': 'Bearer ${getToken()}'
          },
        ),
      );
      back();
      print(res.data);
      if (res.data['message'] != null &&
          res.data['message'].contains('otp does not match') == true) {
        back();
        DialogHelper.forgetPassShowErrorDialog(msg: 'Invalid OTP number.');
        isLoading.value = false;
      } else if (res.data['responseCode'] != null &&
          res.data['responseCode'] == '200') {
        DialogHelper.showForgotPasswordSuccessDialog(
          msg:
              'A mail has been sent to your email informing your username. Please check your inbox or spam.',
          title: 'Forgot Username',
        );
        isLoading.value = false;
      } else {
        print('dddddddd');

        isLoading.value = false;
        forgotUsername.value = '';
        otp.value = '';
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

//-------------------------------------------------------------
  String? getToken() {
    final tokenBox = Hive.box<User>('user');
    // kLog(tokenBox.get('current_user')!.token);
    return tokenBox.get('current_user')!.token;
  }

  void logOut() async {
    final userBox = Hive.box<User>('user');
    await userBox.delete('current_user');

    currentUser.value = null;
    back();

    offAll(LoginPage());
  }
}
