import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/services/validation_service.dart';

class OTPInput extends StatelessWidget with Base, ValidationService {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        key: Key('forgot_password_OTP_input_text_field'),
        onChanged: authC.otp,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          label: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'OTP',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: hexToColor('#72778F'))),
                TextSpan(
                    text: ' *',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: hexToColor('#F2BA14'))),
              ],
            ),
          ),
          hintText: 'Ex: 1234',
          border: OutlineInputBorder(),
          hintStyle: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 14.0,
            color: AppTheme.textColor3,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.borderColor, width: 1.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: hexToColor('#F2BA14'), width: 1.0),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: hexToColor('#FE0101'), width: 1.0),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: hexToColor('#FE0101'), width: 1.0),
          ),
          errorText: validateOtp(authC.otp.value),
        ),
      ),
    );
  }
}
