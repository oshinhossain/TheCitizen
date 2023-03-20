import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/components/NewPasswordSubmitButton2.dart';
import 'package:the_citizen_app/src/helpers/global_helper.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/render_svg.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import 'package:the_citizen_app/src/models/process_shout.dart';
import 'package:the_citizen_app/src/pages/login_page.dart';
import '../components/ConfirmPasswordInput.dart';
import '../components/NewPasswordInput.dart';
import '../components/NewPasswordSubmitButton.dart';
import '../components/OTPInput.dart';
import '../components/PasswordInput.dart';
import '../components/SignUpConfirmPasswordInput.dart';
import '../components/SubmitNewPasswordButton.dart';
import '../components/TimerCountDown.dart';
import '../components/UniqueIdentifierSubmitButton.dart';
import '../components/UserUniqueIdentifierInput.dart';
import '../config/app_theme.dart';

enum Status {
  Error,
  Success,
  Warning,
}

class DialogHelper {
  //show error dialog
  static showUniqueIdentifierInputDialog({
    required String title,
    required String inputLabel,
    required Function onChanged,
    required VoidCallback? onPressed,
    // required String inputValue,
  }) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 13, bottom: 13),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: hexToColor('#78909C'),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  border: Border.all(color: hexToColor('#FFFFFF'), width: 1),
                ),
                child: Text(
                  '${title}',
                  style: TextStyle(fontFamily: 'Manrope', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: hexToColor('#FFFFFF'),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Column(
                  children: [
                    UserUniqueIdentifierInput(
                      inputLabel: inputLabel,
                      onChanged: onChanged,
                    ),
                    SizedBox(height: 10),
                    UniqueIdentifierSubmitButton(
                      onPressed: onPressed,
                      // inputValue: inputValue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //show error dialog
  static showOtpAndNewPassInputDialog2({
    required String title,
    // required String inputLabel,
    // required Function onChanged,
    // required VoidCallback? onPressed,
    // required String inputValue,
  }) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 13, bottom: 13),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: hexToColor('#78909C'),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    border: Border.all(color: hexToColor('#FFFFFF'), width: 1)),
                child: Text(
                  '${title}',
                  style: TextStyle(fontFamily: 'Manrope', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: hexToColor('#FFFFFF'),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 15),
                child: Column(
                  children: [
                    TimerCountDown(),
                    OTPInput(),
                    NewPasswordInput(),
                    ConfirmPasswordInput(),
                    SizedBox(height: 10),
                    NewPasswordSubmitButton()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void forgetPassShowErrorDialog({required String msg}) {
    Get.dialog(
      Dialog(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              color: hexToColor('#FFFFFF'),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              border: Border.all(color: hexToColor('#FFFFFF'), width: 1),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 12, bottom: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: hexToColor('#78909C'),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    'Error!',
                    style: TextStyle(fontFamily: 'Manrope', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        '$msg',
                        style: TextStyle(fontFamily: 'Manrope', fontSize: 16.0, color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(hexToColor('#78909C')),
                          visualDensity: VisualDensity(horizontal: 2),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                        onPressed: () => back(),
                        child: Text(
                          'Ok',
                          style: TextStyle(fontFamily: 'Manrope', fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void showOtpAndNewPassInputDialog() {
    Get.dialog(
      Dialog(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 13, bottom: 13),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: hexToColor('#78909C'),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    border: Border.all(color: hexToColor('#FFFFFF'), width: 1)),
                child: Text(
                  'Forgot Username',
                  style: TextStyle(fontFamily: 'Manrope', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: hexToColor('#FFFFFF'),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 15),
                child: Column(
                  children: [
                    TimerCountDown(),
                    OTPInput(),
                    SizedBox(height: 10),
                    NewPasswordSubmitButton2(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showForgotPasswordSuccessDialog({
    required String title,
    required String msg,
  }) {
    Get.dialog(
      Dialog(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              color: hexToColor('#FFFFFF'),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              border: Border.all(color: hexToColor('#FFFFFF'), width: 1),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 12, bottom: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: hexToColor('#78909C'),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    '${title}',
                    style: TextStyle(fontFamily: 'Manrope', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        '$msg',
                        style: TextStyle(
                            fontFamily: 'Manrope', fontSize: 12.0, color: hexToColor('#5293A6'), fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(hexToColor('#78909C')),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          visualDensity: VisualDensity(horizontal: 2),
                        ),
                        onPressed: () => back(),
                        child: Text(
                          'Ok',
                          style: TextStyle(fontFamily: 'Manrope', fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//====================================================

//show success Dialog
  static void successDialog({
    required String title,
    required String msg,
    required Color color,
    String? path,
    required void Function()? onPressed,
  }) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              color: hexToColor('#FFFFFF'),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              border: Border.all(color: hexToColor('#FFFFFF'), width: 1),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 12, bottom: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (path != null) RenderSvg(path: path),
                      if (path != null) SizedBox(width: 10),
                      Text(
                        title,
                        style: TextStyle(fontFamily: 'Manrope', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      KText(
                        text: msg,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size?>(Size(109, 35)),
                          backgroundColor: MaterialStateProperty.all<Color>(color),
                          visualDensity: VisualDensity(horizontal: 2),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              // side: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        onPressed: onPressed,
                        child: Text(
                          'Ok',
                          style: TextStyle(fontFamily: 'Manrope', fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//show error dialog
  static signUpShowErrorsDialog({
    required String title,
    required List<dynamic> errorList,
    // required String inputValue,
  }) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              color: hexToColor('#FFFFFF'),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              border: Border.all(color: hexToColor('#FFFFFF'), width: 1),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 12, bottom: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: hexToColor('#78909C'),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    'Error!',
                    style: TextStyle(fontFamily: 'Manrope', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: errorList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${errorList[index]}',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            );
                          }),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(hexToColor('#78909C')),
                          visualDensity: VisualDensity(horizontal: 2),
                        ),
                        onPressed: () {
                          back();
                        },
                        child: Text(
                          'Ok',
                          style: TextStyle(fontFamily: 'Manrope', fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//show error dialog
  static signUpShowPinSendingDialog({
    required String title,
  }) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              color: hexToColor('#FFFFFF'),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              border: Border.all(color: hexToColor('#FFFFFF'), width: 1),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 13, bottom: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: hexToColor('#78909C'),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    '$title',
                    style: TextStyle(fontFamily: 'Manrope', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(padding: EdgeInsets.symmetric(vertical: 20), child: CircularProgressIndicator()),
              ],
            ),
          ),
        ),
      ),
    );
  }

//show error dialog
  static signUpShowPasswordSetDialog({
    required String title,
  }) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 13, bottom: 13),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: hexToColor('#78909C'),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  border: Border.all(color: hexToColor('#FFFFFF'), width: 1),
                ),
                child: Text(
                  'Set Your Password',
                  style: TextStyle(fontFamily: 'Manrope', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: hexToColor('#FFFFFF'),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 15),
                child: Column(
                  children: [
                    TimerCountDown(),
                    OTPInput(),
                    PasswordInput(),
                    // ConfirmPasswordInput(),
                    SignUpConfirmPasswordInput(),
                    SizedBox(height: 10),
                    SubmitNewPasswordButton()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//show error dialog
  static signUpShowSuccessDialog({
    required String msg,
  }) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              color: hexToColor('#FFFFFF'),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              border: Border.all(color: hexToColor('#FFFFFF'), width: 1),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 12, bottom: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: hexToColor('#78909C'),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Success!',
                    style: TextStyle(fontFamily: 'Manrope', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        '$msg',
                        style:
                            const TextStyle(fontFamily: 'Manrope', fontSize: 16.0, color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(hexToColor('#78909C')),
                          visualDensity: const VisualDensity(horizontal: 2),
                        ),
                        onPressed: () {
                          back();
                          push(LoginPage());
                        },
                        child: const Text(
                          'Ok',
                          style: TextStyle(fontFamily: 'Manrope', fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void showChangePasswordSuccessDialog({
    required String title,
    required String msg,
  }) {
    Get.dialog(
      Dialog(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              color: hexToColor('#FFFFFF'),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              border: Border.all(color: hexToColor('#FFFFFF'), width: 1),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 12, bottom: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: hexToColor('#78909C'),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    '${title}',
                    style: TextStyle(fontFamily: 'Manrope', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        '$msg',
                        style: TextStyle(
                            fontFamily: 'Manrope', fontSize: 12.0, color: hexToColor('#5293A6'), fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(hexToColor('#78909C')),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          visualDensity: VisualDensity(horizontal: 2),
                        ),
                        onPressed: () => back(),
                        child: Text(
                          'Ok',
                          style: TextStyle(fontFamily: 'Manrope', fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//====================================================

  static void showScaffoldMessage({
    required BuildContext context,
    required String message,
    Color color = Colors.black87,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: duration,
    ));
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }

  static shoutDetailsDialog({
    required String title,
    ProcessShout? shoutDetails,
  }) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 13, bottom: 13),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                //color: appBarColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Text(
                "$title",
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 18.0,
                  color: AppTheme.textColor1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              // spacing inside the box
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '${shoutDetails!.categoryName} > ',
                          style: TextStyle(
                              fontFamily: 'Manrope',
                              color: AppTheme.textColor30,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              height: 1.2),
                        ),
                        TextSpan(
                          text: '${shoutDetails.subcategoryName}',
                          style: TextStyle(
                              fontFamily: 'Manrope',
                              color: AppTheme.textColor20,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        //    hasImage ? GetFutureImages(images: images) : Text(''),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reported On',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              color: AppTheme.textColor20,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '${formatDate(
                                date: shoutDetails.reportDate!,
                              )}',
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                color: AppTheme.textColor21,
                                fontSize: 15,
                                height: 1.2,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Urgency',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              color: AppTheme.textColor20,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${shoutDetails.urgencyLevel}',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              color: AppTheme.textColor21,
                              fontSize: 15,
                              height: 1.2,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  shoutDetails.remarks != null
                      ? SizedBox(
                          height: 10,
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  shoutDetails.remarks != null
                      ? Divider(
                          height: 1,
                          thickness: 1,
                          color: AppTheme.textColor22,
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  shoutDetails.remarks != null
                      ? Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "${shoutDetails.remarks}",
                              style: TextStyle(
                                  fontFamily: 'Manrope', color: AppTheme.textColor15, fontSize: 13, fontWeight: FontWeight.w300),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  shoutDetails.remarks != null
                      ? Divider(
                          height: 1,
                          thickness: 1,
                          color: AppTheme.textColor22,
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    child: Row(
                      children: [
                        Text(
                          'Status: ',
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            color: AppTheme.textColor20,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        shoutDetails.fulfillmentStatus!.isEmpty
                            ? Text('')
                            : KText(
                                text: shoutDetails.fulfillmentStatus,
                                color: (shoutDetails.fulfillmentStatus == "REJECTED" || shoutDetails.fulfillmentStatus == "DROPPED")
                                    ? Colors.red
                                    : Colors.black,
                              ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  shoutDetails.agencyName!.isNotEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Responding Party:',
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                color: AppTheme.textColor20,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${shoutDetails.agencyName}',
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                color: AppTheme.textColor21,
                                fontSize: 15,
                                height: 1.2,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: AppTheme.textColor22,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  if (shoutDetails.fulfillmentStatus?.toLowerCase().toString().trim() != 'verified')
                    // TextField(
                    //   // controller: userComment,
                    //   maxLines: 5,
                    //   minLines: 2,
                    //   inputFormatters: [
                    //     FilteringTextInputFormatter.deny(RegExp("['\"]")),
                    //   ],
                    //   onChanged: (comments) => context.read<HomeBloc>().add(CommentChangeToState(comments)),
                    //   keyboardType: TextInputType.multiline,
                    //   decoration: InputDecoration(
                    //     border: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: AppTheme.textColor22, width: 1),
                    //     ),
                    //     labelText: 'Comment',
                    //     labelStyle: TextStyle(
                    //       fontFamily: 'Manrope',
                    //       fontSize: 15.0,
                    //       color: AppTheme.textColor20,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //     hintText: 'Write your comment here',
                    //     hintStyle: TextStyle(
                    //       fontFamily: 'Manrope',
                    //       fontSize: 14.0,
                    //       color:AppTheme. textColor20,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //     focusedBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: AppTheme.textColor10, width: 1),
                    //     ),
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: AppTheme.textColor22),
                    //     ),
                    //     focusedErrorBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(color: AppTheme.textColor1, width: 0.0),
                    //       borderRadius: BorderRadius.circular(0.0),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                  SizedBox(height: 5),
                  // if (shoutDetails.fulfillmentStatus?.toLowerCase().toString().trim() == 'verified')
                  //   BlocBuilder<HomeBloc, HomeState>(
                  //     buildWhen: (p, c) => p.comment != c.comment,
                  //     builder: (BuildContext context, state) {
                  //       return Align(
                  //         alignment: Alignment.bottomCenter,
                  //         child: ElevatedButton(
                  //        //   style: ElevatedButton.styleFrom(primary: AppTheme.buttonColor),
                  //           child: Text(
                  //             'Start',
                  //             style: TextStyle(
                  //               fontFamily: 'Manrope',
                  //               fontSize: 16.0,
                  //               color: AppTheme.textColor1,
                  //               fontWeight: FontWeight.w700,
                  //             ),
                  //           ),
                  //           onPressed: () async {
                  //             // if (shoutDetails.fulfillmentStatus?.toLowerCase().toString().trim() == 'verified') {
                  //             //   await context.read<ValidateShoutBloc>().updateFulfillmentStatus(
                  //             //         shoutDetails.id,
                  //             //         'STARTED',
                  //             //       );
                  //             // }
                  //             // Navigator.of(context).pop();
                  //             // await context.read<HomeBloc>().add(GetAssignShoutForMe());
                  //           },
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // if (shoutIncidentsModel.fulfillmentStatus?.toLowerCase().toString().trim() == 'started')
                  //   BlocBuilder<HomeBloc, HomeState>(
                  //     buildWhen: (p, c) => p.comment != c.comment,
                  //     builder: (BuildContext context, state) {
                  //       return Align(
                  //         alignment: Alignment.bottomCenter,
                  //         child: Row(
                  //           mainAxisSize: MainAxisSize.min,
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             Expanded(
                  //               child: ElevatedButton(
                  //                 style: ButtonStyle(
                  //                   backgroundColor: MaterialStateProperty.all<Color>(
                  //                       Utility.isEmptyString(state.comment) ? Colors.black12 : Colors.red),
                  //                 ),
                  //                 // style: ElevatedButton.styleFrom(primary: AppColors.buttonColor),
                  //                 child: Text(
                  //                   'Drop',
                  //                   style: TextStyle(
                  //                     fontFamily: 'Manrope',
                  //                     fontSize: 16.0,
                  //                     color: AppTheme.textColor1,
                  //                     fontWeight: FontWeight.w700,
                  //                   ),
                  //                 ),
                  //                 onPressed: Utility.isEmptyString(state.comment)
                  //                     ? null
                  //                     : () async {
                  //                         if (shoutDetails.fulfillmentStatus?.toLowerCase().toString().trim() == 'started') {
                  //                           await context
                  //                               .read<ValidateShoutBloc>()
                  //                               .updateFulfillmentStatus(shoutDetails.id, 'DROPPED', comments: state.comment);
                  //                           //Utility.setEmergencyShoutIdInSharedPreferences('',false);
                  //                         }
                  //                         Navigator.of(context).pop();
                  //                         await context.read<HomeBloc>().add(GetAssignShoutForMe());
                  //                       },
                  //               ),
                  //             ),
                  //             SizedBox(width: 10.0),
                  //             if (shoutDetails.fulfillmentStatus?.toLowerCase().toString().trim() == 'started')
                  //               Expanded(
                  //                 child: ElevatedButton(
                  //                   style: ButtonStyle(
                  //                     backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  //                   ),
                  //                   child: Text(
                  //                     'Complete',
                  //                     style: TextStyle(
                  //                       fontFamily: 'Manrope',
                  //                       fontSize: 16.0,
                  //                       color: AppTheme.textColor1,
                  //                       fontWeight: FontWeight.w700,
                  //                     ),
                  //                   ),
                  //                   onPressed: () async {
                  //                     if (shoutDetails.fulfillmentStatus?.toLowerCase().toString().trim() == 'started') {
                  //                       await context
                  //                           .read<ValidateShoutBloc>()
                  //                           .updateFulfillmentStatus(shoutDetails.id, 'COMPLETED', comments: state.comment);
                  //                       //Utility.setEmergencyShoutIdInSharedPreferences('',false);
                  //                     }
                  //                     Navigator.of(context).pop();
                  //                     await context.read<HomeBloc>().add(GetAssignShoutForMe());
                  //                   },
                  //                 ),
                  //               ),
                  //           ],
                  //         ),
                  //       );
                  //     },
                  //   ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

SnackbarController snackbar() {
  return Get.snackbar('Alart!!', 'Still not activated',
      snackPosition: SnackPosition.BOTTOM, backgroundColor: AppTheme.white.withOpacity(0.6));
}
