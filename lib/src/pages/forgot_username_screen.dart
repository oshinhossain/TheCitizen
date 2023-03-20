import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';

import '../helpers/dialogHelper.dart';
import '../helpers/hex_color.dart';

class ForgotUsernameScreen extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        'Forgot Username?',
        style: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 14.0,
          color: AppTheme.textColor0,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.underline,
        ),
      ),
      onTap: () async {
        DialogHelper.showUniqueIdentifierInputDialog(
          title: 'Forgot Username',
          inputLabel: 'Email',
          onChanged: authC.forgotUsername,
          onPressed: () {
            print(authC.forgotUsername);
            authC.forgetUsernameByEmail();
          },
        );
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) => Dialog(
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.all(Radius.circular(10))),
        //     child: showUniqueIdentifierInputDialog(),
        //   ),
        //   barrierDismissible: false,
        // );
      },
    );
  }

  Widget manageForgotPasswordDialog(BuildContext context) {
    final Dialog dialogWithImage = Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: showUniqueIdentifierInputDialog(),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) => dialogWithImage,
      barrierDismissible: false,
    );
    return forgetPassShowErrorDialog(context, 'Empty');
  }

  Widget showUniqueIdentifierInputDialog() {
    return SingleChildScrollView(
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
              'Forgot Username',
              style: TextStyle(
                  fontFamily: 'Manrope',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
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
                _UserUniqueIdentifierInput(),
                SizedBox(height: 10),
                _UniqueIdentifierSubmitButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget forgetPassShowErrorDialog(BuildContext context, dynamic msg) {
    return SingleChildScrollView(
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
                style: TextStyle(
                    fontFamily: 'Manrope',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    '$msg',
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 16.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          hexToColor('#78909C')),
                      visualDensity: VisualDensity(horizontal: 2),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Ok',
                      style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 16.0,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _UserUniqueIdentifierInput extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: userC.forgotUsername,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        label: Text(
          'Email',
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: hexToColor('#72778F')),
        ),

        hintText: 'Ex: abc',
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
        //labelText: 'Username',
        // errorText:'Invalid Email/Username',
      ),
    );
  }
}

class _UniqueIdentifierSubmitButton extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(hexToColor('#F2BA14')),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
              onPressed: () {
                userC.forgotUsername.value = '';
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                    fontFamily: 'Manrope', fontSize: 16.0, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          Expanded(
            child: ElevatedButton(
              key: Key('unique_identifier_submit_button'),
              style: ButtonStyle(
                backgroundColor: userC.forgotUsername.value.isNotEmpty
                    ? MaterialStateProperty.all<Color>(hexToColor('#78909C'))
                    : MaterialStateProperty.all<Color>(
                        Colors.blueGrey.withOpacity(0.3)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
              onPressed: userC.forgotUsername.value.isNotEmpty
                  ? () {
                      userC.forgetUsernameByEmail();
                    }
                  : null,
              child: Text(
                'Next',
                style: TextStyle(
                    fontFamily: 'Manrope', fontSize: 16.0, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
