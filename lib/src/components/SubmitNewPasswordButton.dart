import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';

class SubmitNewPasswordButton extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: authC.isRegLoading.value
            ? [
                CircularProgressIndicator(strokeWidth: 3),
              ]
            : [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          hexToColor('#F2BA14')),
                    ),
                    onPressed: () {
                      authC.otp.value = '';
                      authC.regPassword.value = '';
                      authC.regConfirmPassword.value = '';
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
                SizedBox(width: 30),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: authC.otp.value.isNotEmpty &&
                              authC.regPassword.value ==
                                  authC.regConfirmPassword.value
                          ? MaterialStateProperty.all<Color>(
                              hexToColor('#78909C'))
                          : MaterialStateProperty.all<Color>(
                              Colors.blueGrey.withOpacity(0.3)),
                    ),
                    key: Key('new_password_raised_button'),
                    onPressed: () async {
                      if (authC.otp.value.isNotEmpty &&
                          authC.regPassword.value ==
                              authC.regConfirmPassword.value) {
                        kLog(
                            'otp: ${authC.otp.value} password: ${authC.regPassword.value} confirm password: ${authC.regConfirmPassword.value} email: ${authC.email.value} Mobile Number: ${authC.mobileNumer.value} Dob: ${authC.dateOfBirth.value} gender: ${authC.gender.value} address: ${authC.address.value} ');

                        await authC.confirmSignUp();
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}
