import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';

class NewPasswordSubmitButton2 extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: authC.isForgotLoading.value
            ? [
                CircularProgressIndicator(strokeWidth: 3),
              ]
            : [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          hexToColor('#F2BA14')),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      authC.otp.value = '';
                      authC.forgotUsername.value = '';
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 16.0,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      // backgroundColor: MaterialStateProperty.all<Color>(
                      //     Colors.blueGrey.withOpacity(0.3)),
                      backgroundColor: authC.otp.value.isNotEmpty
                          ? MaterialStateProperty.all<Color>(
                              hexToColor('#78909C'))
                          : MaterialStateProperty.all<Color>(
                              Colors.blueGrey.withOpacity(0.3)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      // backgroundColor: state.otpCode.valid

                      //     ? MaterialStateProperty.all<Color>(hexToColor('#78909C'))
                      //     : MaterialStateProperty.all<Color>(
                      //         Colors.blueGrey.withOpacity(0.3)),
                    ),
                    onPressed: () => authC.otp.value.isNotEmpty
                        ? authC.sendOtpByEmail()
                        : null,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 16.0,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}
