import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_citizen_app/src/controllers/user_controller.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
import 'package:the_citizen_app/src/pages/login_page.dart';
import 'package:the_citizen_app/src/pages/signup_page.dart';
import '../helpers/dialogHelper.dart';
import '../helpers/get_file_name.dart';
import '../helpers/route.dart';
import '../models/user.dart';
import '../models/usermodel.dart';
import '../pages/animation_screen.dart';
import '../services/api_service.dart';
import '../services/validation_service.dart';
import 'agency_controller.dart';

enum Phase {
  signUp,
  otp,
  confirmed,
}

class AuthController extends GetxController with ApiService, ValidationService {
  final userC = Get.put(UserController());
  final _dio = Dio();
  final ImagePicker _picker = ImagePicker();
  // final otpTimer = Rx

  // Sign Up Phase
  final phase = Rx<Phase>(Phase.signUp);

  final pickedImage = Rx<XFile?>(null);
  final fileImage = Rx<File?>(null);
  final pickedImageMemory = Rx<Uint8List?>(null);

  final isLoading = RxBool(false);
  final isRegLoading = RxBool(false);

  final isRegNewObscure = RxBool(true);
  final isRegConfirmObscure = RxBool(true);

  // Login type
  final loginType = RxString('online');
  // --------------------------------  ----------------------------

  // For login
  final username = RxString('');
  final password = RxString('');
  final isBiometric = RxBool(false);
  final visibleBiometric = RxBool(false);
  final visiblePassword = RxBool(true);
  final isSelected = RxList([true, false]);
  final isObscure = RxBool(true);
  // ------------------------------------------------------------

  // For Forgot Username
  final isForgotLoading = RxBool(false);
  final forgotUsername = RxString('');
  // ------------------------------------------------------------

  // For Forgot Password
  final forgotPasswordInputField = RxString('');
  final forgotNewPassword = RxString('');
  final forgotConfirmPassword = RxString('');
  final isForgotNewObscure = RxBool(true);
  final isForgotConfirmObscure = RxBool(true);
  // ------------------------------------------------------------

  // For Change Password
  final oldPassword = RxString('');
  final newPassword = RxString('');
  final conframPassword = RxString('');

  // ------------------------------------------------------------

  // For SignUp
  final fullName = RxString('');

  final userDetail = Rx<ProfileUserModel?>(null);
  final regUsername = RxString('');
  final mobileNumer = RxString('');
  final email = RxString('');
  final gender = RxString('male');
  final dateOfBirth = RxString('');
  final address = RxString('');
  final isTermsAgree = RxBool(false);

  final regPassword = RxString('');
  final regConfirmPassword = RxString('');
  final otp = RxString('');

  final image = Rx<Uint8List?>(null);

  // ------------------------------------------------------------

  bool isSubmitButtonValid() {
    if (pickedImage.value != null &&
        fullName.value.isNotEmpty &&
        regUsername.value.isNotEmpty &&
        mobileNumer.value.length > 10 &&
        email.value.contains('@') &&
        gender.value.isNotEmpty &&
        dateOfBirth.value.isNotEmpty &&
        address.value.isNotEmpty &&
        isTermsAgree.value) {
      return true;
    } else {
      return false;
    }
  }

  bool isOtpButtonValid() {
    if (otp.value.length == 4 &&
        regPassword.value.isNotEmpty &&
        regConfirmPassword.value.isNotEmpty &&
        regPassword.value == regConfirmPassword.value) {
      return true;
    } else {
      return false;
    }
  }

  bool isLoginButtonValid() {
    if (username.value.isNotEmpty && isPasswordValid(password.value)) {
      return true;
    } else {
      return false;
    }
  }

  bool isPasswordResetButtonValid() {
    if (otp.value.isNotEmpty &&
        isPasswordValid(forgotNewPassword.value) &&
        forgotConfirmPassword.value.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  final obscure = RxBool(true);

  void changeObscure() {
    obscure.toggle();
  }

  ///Change my password

  bool isChangePasswordButtonValid() {
    if (oldPassword.value.isNotEmpty &&
        (newPassword.value == conframPassword.value)) {
      return true;
    } else {
      return false;
    }
  }

  void login(context) async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);

      isLoading.value = true;
      // cEtvZGVhYmMxMjM0NTZBQQ==
      final res = await post(
        path: '/user_authentication',
        body: {
          'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
          'username': username.value,
          'password': stringToBase64.encode('pKode${password.value}'),
          'appCode': 'SHOUT',
          'version': 1
        },
      );

      if (res.data['message'] != null &&
          res.data['message'].contains('INVALID_CREDENTIALS') == true) {
        DialogHelper.showScaffoldMessage(
          message:
              'Wrong username/password. Try again or click forgot password to reset it.',
          context: context,
          color: Colors.red,
        );
        isLoading.value = false;
      } else {
        offAll(AnimationScreen());

        final userData = User.fromJson(res.data['data']['user']);
        userData.token = res.data['token'] as String;

        Get.put(UserController()).currentUser.value = userData;
        userDetail.value = ProfileUserModel(
            username: userData.username,
            homeAddress: userData.homeAddress,
            role: userData.role);
        //Add user data
        final userBox = Hive.box<User>('user');

        await userBox.put('current_user', userData);

        await Get.put(AgencyController()).getAgencies('${userData.username}');
        username.value = '';
        password.value = '';
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  void signUp() async {
    try {
      isRegLoading.value = true;
      // phase.value = Phase.signUp;

      final res = await post(
        path: '/request_for_otp',
        body: {
          'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
          'username': regUsername.value,
          'email': email.value,
          'mobile': mobileNumer.value,
        },
      );

      print(res.data);
      if (res.data['responseCode'] != null &&
          res.data['responseCode'] == '412') {
        print(res.data['message']);
        isRegLoading.value = false;
        DialogHelper.signUpShowErrorsDialog(
            title: 'ss', errorList: res.data['message']);
      } else if (res.data['responseCode'] != null &&
          res.data['responseCode'] == '200') {
        print(res.data['responseCode']);
        DialogHelper.signUpShowPinSendingDialog(title: 'Sending OTP...');
        await 2.delay();
        back();
        DialogHelper.signUpShowPasswordSetDialog(title: 'Set Your Password');
        isRegLoading.value = false;
      } else {
        print('<<<<<<<<Email Send>>>>>>>>');

        isRegLoading.value = false;
      }
    } catch (e) {
      isRegLoading.value = false;
      // print(e);
    }
  }

  confirmSignUp() async {
    try {
      isRegLoading.value = true;
      Codec<String, String> stringToBase64 = utf8.fuse(base64);

      // isLoading.value = true;
      final data = FormData.fromMap({
        'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
        'appCode': 'SHOUT',
        'personName': fullName.value,
        'version': 1,
        'username': regUsername.value,
        'password': stringToBase64.encode('pKode${regPassword.value}'),
        'mobile': mobileNumer.value,
        'email': email.value,
        'gender': gender.value,
        'homeAddress': address.value,
        // 'birthDate': '1996-12-22',
        'dob': dateOfBirth.value,
        'otp': otp.value,
        'uiCodes': ['555'],
        'files': await MultipartFile.fromFile(fileImage.value!.path,
            filename: 'photo${getFileName(path: fileImage.value!.path)}'),
      });

      kLog('submit data');
      kLog(data);
      kLog('photo${getFileName(path: pickedImage.value!.path)}');

      final res = await post(
        path: '/add_user_form',
        body: data,
      );

      kLog(res.data['responseCode']);
      isRegLoading.value = false;

      if (res.data['responseCode'] != null &&
          res.data['responseCode'] == '200') {
        back();
        DialogHelper.signUpShowSuccessDialog(
            msg: 'Your account has been created successfully.');
        await 2.delay();
        offAll(SignUpPage());
      } else if (res.data['responseCode'] != null &&
              res.data['responseCode'] == '401' ||
          res.data['responseCode'] == '412') {
        back();
        DialogHelper.signUpShowErrorsDialog(
            errorList: res.data['message'], title: '');
      } else if (res.data['responseCode'] != null &&
          res.data['responseCode'] == '400') {
        DialogHelper.signUpShowErrorsDialog(
          errorList: ['Failed to create account, Please try again.'],
          title: 'Failed to create account, Please try again.',
        );
      } else if (res.data['responseCode'] != null &&
          res.data['responseCode'] == '500') {
        DialogHelper.signUpShowErrorsDialog(
          errorList: ['Failed to create account, Please try again.'],
          title: 'OTP not Valid',
        );
      }
      isRegLoading.value = false;
    } catch (e) {
      isRegLoading.value = false;
      print(e);
    }
  }

  //===========================================================
  //  Forgot User Name
  //===========================================================

  void forgetUsernameByEmail() async {
    try {
      isForgotLoading.value = true;
      final res = await _dio.post(
        '${dotenv.env['BASE_URL_KYC']}/request_for_forget_username',
        data: {
          "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
          "email": forgotUsername.value
        },
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
        isForgotLoading.value = false;
      } else if (res.data['responseCode'] != null &&
          res.data['responseCode'] == '200') {
        back();
        isForgotLoading.value = false;
        DialogHelper.showOtpAndNewPassInputDialog();
      } else {
        print('<<<<<<<<Email Send>>>>>>>>');

        isForgotLoading.value = false;
      }
      isForgotLoading.value = false;
      // forgotUsername.value = '';
    } catch (e) {
      isForgotLoading.value = false;
      print(e);
    }
  }

//---------------------------------------
  sendOtpByEmail() async {
    try {
      isForgotLoading.value = true;
      final res = await _dio.post(
        '${dotenv.env['BASE_URL_KYC']}/get_forget_username_by_otp',
        data: {
          "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
          "email": forgotUsername.value,
          "otp": otp.value
        },
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
          res.data['message'].contains('otp does not match') == true) {
        back();
        isForgotLoading.value = false;
        DialogHelper.forgetPassShowErrorDialog(msg: 'Invalid OTP number.');
        isForgotLoading.value = false;
      } else if (res.data['responseCode'] != null &&
          res.data['responseCode'] == '200') {
        isForgotLoading.value = false;
        back();
        DialogHelper.showForgotPasswordSuccessDialog(
          msg:
              'A mail has been sent to your email informing your username. Please check your inbox or spam.',
          title: 'Forgot Username',
        );
      } else {
        print('dddddddd');

        isForgotLoading.value = false;
        forgotUsername.value = '';
        otp.value = '';
      }
    } catch (e) {
      isForgotLoading.value = false;
      print(e);
    }
  }

//-------------------------------------------------------------
  //===========================================================
  //  Forgot Password
  //===========================================================

  passwordResetByEmail() async {
    try {
      isForgotLoading.value = true;
      print(forgotPasswordInputField.value);

      final res = await _dio.post(
        '${dotenv.env['BASE_URL_KYC']}/reset_user_password',
        data: {
          "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
          "inputField": "${forgotPasswordInputField.value}"
        },
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
          res.data['message'].contains('Invalid username or email.') == true) {
        back();
        isForgotLoading.value = false;
        DialogHelper.forgetPassShowErrorDialog(
            msg: 'Your Email doesn\'t exist.');
      } else if (res.data['responseCode'] != null &&
          res.data['responseCode'] == '200') {
        back();
        isForgotLoading.value = false;
        DialogHelper.showOtpAndNewPassInputDialog2(title: 'Reset Password');
      } else {
        print('<<<<<<<<Email Send>>>>>>>>');

        isForgotLoading.value = false;
      }
      isForgotLoading.value = false;
      //forgotPasswordInputField.value = '';
    } catch (e) {
      isForgotLoading.value = false;
      print(e);
    }
  }

  //------------------------------------------------------------------
  sendPasswordResetOTPByEmail() async {
    try {
      print('<<<<<<Reset Pass Otp>>>>>>');
      print(forgotPasswordInputField.value);

      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      isForgotLoading.value = true;
      final res = await _dio.post(
        '${dotenv.env['BASE_URL_KYC']}/update_user_password',
        data: {
          "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
          "inputField": "${forgotPasswordInputField.value}",
          "password":
              stringToBase64.encode('pKode${forgotConfirmPassword.value}'),
          "otp": "${otp.value}"
        },
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
          res.data['message'].contains('INVALID_CREDENTIALS') == true) {
        back();
        DialogHelper.forgetPassShowErrorDialog(msg: 'Invalid OTP number.');
        isForgotLoading.value = false;
      } else if (res.data['responseCode'] != null &&
          res.data['responseCode'] == '200') {
        back();
        DialogHelper.showForgotPasswordSuccessDialog(
          msg: 'Your password has been updated successfully.',
          title: 'Success!',
        );
        isForgotLoading.value = false;
      } else {
        print('dddddddd');

        isForgotLoading.value = false;
        forgotUsername.value = '';
        otp.value = '';
      }
      disposeForgotData();
    } catch (e) {
      isForgotLoading.value = false;
      print(e);
    }
  }

//.............................................

  void changePassword(context) async {
    try {
      final username = Get.put(UserController()).username;
      Codec<String, String> stringToBase64 = utf8.fuse(base64);

      isLoading.value = true;
      // cEtvZGVhYmMxMjM0NTZBQQ==
      kLog(stringToBase64.encode('pKode${password.value}'));
      final body = {
        "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
        "username": username,
        "appCode": "SHOUT",
        "password": stringToBase64.encode('pKode${oldPassword.value}'),
        "newPassword": stringToBase64.encode('pKode${newPassword.value}'),
      };
      // kLog(body);

      final res = await post(
        path: '/change_user_password',
        body: body,
        authentication: true,
      );

      log("${res.data}");

// print(res.data);
//       if (res.data['message'] != null &&
//           res.data['message'].contains('otp does not match') == true) {
//         back();
//         isForgotLoading.value = false;
//         DialogHelper.forgetPassShowErrorDialog(msg: 'Invalid OTP number.');
//         isForgotLoading.value = false;
//       } else if (res.data['responseCode'] != null &&
//           res.data['responseCode'] == '200') {
//         isForgotLoading.value = false;
//         back();
//         DialogHelper.showForgotPasswordSuccessDialog(
//           msg:
//               'A mail has been sent to your email informing your username. Please check your inbox or spam.',
//           title: 'Forgot Username',
//         );
//       } else {
//         print('dddddddd');

//         isForgotLoading.value = false;
//         forgotUsername.value = '';
//         otp.value = '';
//       }
//     } catch (e) {
//       isForgotLoading.value = false;
//       print(e);
//     }

      if (res.data['message'] != null &&
          res.data['status'].contains('failure') == true) {
        DialogHelper.showScaffoldMessage(
          message: res.data['message'][0],
          context: context,
          color: Colors.red,
        );
        isLoading.value = false;
      } else if (res.data['responseCode'] != null &&
          res.data['responseCode'] == '200') {
        isForgotLoading.value = false;
        // back();
        //offAll(LoginPage());
        newPassword.value = '';
        conframPassword.value = '';
        password.value = '';
        DialogHelper.showForgotPasswordSuccessDialog(
          msg: '',
          title: 'Change Password Successful',
        );

        await 2.delay();
        offAll(LoginPage());
      } else {
        // offAll(AnimationScreen());
//
        // final res2 = await _dio.post(
        //   '${dotenv.env['BASE_URL']}/get_user_attachment_by_file_category',
        //   data: {
        //     'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
        //     'username': username.value,
        //     'appCode': 'KYC',
        //     'fileCategory': 'photo',
        //     'imgType': 'icon',
        //     'countryCode': 'BD'
        //   },
        //   options: Options(jingle bells
        //     followRedirects: false,
        //     // will not throw errors
        //     validateStatus: (status) => true,
        //     headers: {
        //       'Content-Type': 'application/json',
        //       'latLng': '23.90560,93.094535',
        //       'Authorization': 'Bearer ${res.data['token']}'
        //     },
        //   ),
        // );

        // log('${res2.data}');

        final userData = User.fromJson(res.data['data']['user']);
        Get.put(UserController()).currentUser.value = userData;

        //Add user data
        final userBox = Hive.box<User>('user');
        await userBox.put('current_user', userData);

        // Get.put(UserController()).user.value = user; ${userC.getToken()}'
        // offAll(MainPage());

        await Get.put(AgencyController()).getAgencies('${userData.username}');
        // username.value = '';
        oldPassword.value = '';
        newPassword.value = '';
        isLoading.value = false;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  //====================================================================

  // Select user avatar image
   selectAvatar() async {
    final image = await _picker.pickImage(source: ImageSource.camera);

    if (image!.path.isNotEmpty) {
      pickedImage.value = image;
      fileImage.value = File(image.path);
      pickedImageMemory.value = await image.readAsBytes();
    }
  }

  // ----------------------------------------------

  disposeData() {
    // phase.value = Phase.signUp;

    fullName.value = '';

    regUsername.value = '';
    mobileNumer.value = '';
    email.value = '';
    gender.value = 'male';
    dateOfBirth.value = '';
    address.value = '';
    isTermsAgree.value = false;

    regPassword.value = '';
    regConfirmPassword.value = '';
    otp.value = '';
    // isLoading.value = false;
    isRegLoading.value = false;
  }

  void disposeForgotData() {
    forgotPasswordInputField.value = '';
    forgotNewPassword.value = '';
    forgotConfirmPassword.value = '';
    isForgotNewObscure.value = false;
    isForgotConfirmObscure.value = false;
  }
}
