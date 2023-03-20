import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';

import '../services/validation_service.dart';

class NewPasswordInput extends StatelessWidget with Base, ValidationService {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        onChanged: authC.forgotNewPassword,
        obscureText: authC.isForgotNewObscure.value,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          label: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'New Password',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: hexToColor('#72778F'),
                  ),
                ),
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: hexToColor('#F2BA14'),
                  ),
                ),
              ],
            ),
          ),
          errorMaxLines: 6,
          filled: false,
          hintText: '********',
          border: OutlineInputBorder(),
          hintStyle: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 14.0,
            color: AppTheme.textColor3,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: IconButton(
            padding: const EdgeInsets.all(0.0),
            icon: Icon(
              authC.isForgotNewObscure.value
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: AppTheme.borderColor,
            ),
            onPressed: () {
              authC.isForgotNewObscure.toggle();
            },
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
          errorText: validateResetNewPassword(authC.forgotNewPassword.value),
          // errorText:
          //     'Password must be at least 10 characters in length. It must contain a minimum of 1 lower case letter [a-z] and a minimum of 1 upper case letter [A-Z] and a minimum of 1 numeric character [0-9]. Please don\'t use any special characters.',
        ),
      ),
    );
  }
}
