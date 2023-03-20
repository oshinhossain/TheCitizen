import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/loading.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import 'package:the_citizen_app/src/pages/signup_page.dart';
import 'package:the_citizen_app/src/services/validation_service.dart';

import '../models/biometric.dart';
import 'forgot_password_screen.dart';
import 'forgot_username_screen.dart';

class LoginPage extends StatelessWidget with ValidationService, Base {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/shout_logo.png',
                    height: 100.0,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          authC.isBiometric.value = false;
                          authC.visibleBiometric.value = false;
                          authC.visiblePassword.value = true;

                          print('Password ${authC.isBiometric.value}');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                            color: authC.isBiometric.value == false
                                ? hexToColor('#78909C')
                                : AppTheme.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                            ),
                            border: Border.all(
                              width: 1,
                              color: hexToColor('#78909C'),
                            ),
                          ),
                          child: KText(
                            text: 'Password',
                            color: authC.isBiometric.value == true
                                ? hexToColor('#78909C')
                                : Colors.white,
                            bold: true,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          authC.isBiometric.value = true;
                          authC.visibleBiometric.value = true;
                          authC.visiblePassword.value = false;
                          print('Password ${authC.isBiometric.value}');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                            color: authC.isBiometric.value == true
                                ? hexToColor('#78909C')
                                : AppTheme.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                            ),
                            border: Border.all(
                              width: 1,
                              color: hexToColor('#78909C'),
                            ),
                          ),
                          child: KText(
                            text: 'Biometric',
                            color: authC.isBiometric.value == true
                                ? Colors.white
                                : hexToColor('#78909C'),
                            bold: true,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Column(
                  children: [
                    Visibility(
                      visible: authC.visiblePassword.value,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            onChanged: authC.username,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 14.0,
                                color: AppTheme.textColor3,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme.borderColor, width: 1.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: hexToColor('#F2BA14'), width: 1.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: hexToColor('#FE0101'), width: 1.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: hexToColor('#FE0101'), width: 1.0),
                              ),
                              errorText: validateUsername(authC.username.value),
                              label: KText(
                                text: 'Username',
                                color: AppTheme.textColor,
                                fontSize: 16,
                              ),
                              hintText: 'Enter your username',
                              // prefixIcon: Icon(
                              //   Icons.person_outline,
                              //   color: AppTheme.color3,
                              // ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          TextField(
                            onChanged: authC.password,
                            obscureText: authC.obscure.value,
                            textInputAction: TextInputAction.send,
                            onSubmitted: (value) {
                              authC.isLoginButtonValid()
                                  ? authC.login(context)
                                  : null;
                            },
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 14.0,
                                color: AppTheme.textColor3,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme.borderColor, width: 1.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: hexToColor('#F2BA14'), width: 1.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: hexToColor('#FE0101'), width: 1.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: hexToColor('#FE0101'), width: 1.0),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () => authC.changeObscure(),
                                icon: Icon(
                                  authC.obscure.value
                                      ? EvaIcons.eyeOutline
                                      : EvaIcons.eyeOffOutline,
                                  color: hexToColor('#78909C'),
                                ),
                              ),
                              label: KText(
                                text: 'Password',
                                color: AppTheme.textColor,
                                fontSize: 16,
                              ),
                              errorMaxLines: 2,
                              errorText: validatePassword(authC.password.value),
                              hintText: 'Enter your password',
                              // prefixIcon: Icon(
                              //   Icons.lock_outline,
                              //   color: AppTheme.color3,
                              // ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 3),
                            child: KText(
                              text: 'Login type',
                              color: hexToColor('#80939D'),
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio<String>(
                                visualDensity: VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                fillColor: MaterialStateProperty.all(
                                    hexToColor('#78909C')),
                                value: authC.loginType.value,
                                onChanged: (v) {
                                  authC.loginType.value = 'online';
                                },
                                groupValue: 'online',
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                onTap: () {
                                  authC.loginType.value = 'online';
                                },
                                child: KText(
                                  text: 'Online',
                                  color: AppTheme.black,
                                  fontSize: 16,
                                ),
                              ),
                              Radio<String>(
                                visualDensity: VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity),
                                value: authC.loginType.value,
                                fillColor: MaterialStateProperty.all(
                                    hexToColor('#78909C')),
                                onChanged: (v) {
                                  authC.loginType.value = 'offline';
                                },
                                groupValue: 'offline',
                              ),
                              GestureDetector(
                                onTap: () {
                                  authC.loginType.value = 'offline';
                                },
                                child: KText(
                                  text: 'Offline',
                                  color: AppTheme.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: Get.width,
                            height: .6,
                            color: hexToColor('#78909C'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // InkWell(
                              //   child: Text(
                              //     'Forgot Username?',
                              //     style: TextStyle(
                              //       fontFamily: 'Manrope',
                              //       fontSize: 14.0,
                              //       color: AppTheme.textColor0,
                              //       fontWeight: FontWeight.w700,
                              //       decoration: TextDecoration.underline,
                              //     ),
                              //   ),
                              //   onTap: () async {},
                              // ),
                              // InkWell(
                              //   child: Text(
                              //     'Forgot Password?',
                              //     style: TextStyle(
                              //       fontFamily: 'Manrope',
                              //       fontSize: 14.0,
                              //       color: AppTheme.textColor0,
                              //       fontWeight: FontWeight.w700,
                              //       decoration: TextDecoration.underline,
                              //     ),
                              //   ),
                              //   onTap: () async {},
                              // ),

                              ForgotUsernameScreen(),
                              ForgotPasswordScreen(),
                            ],
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () => authC.isLoginButtonValid()
                                  ? authC.login(context)
                                  : null,
                              child: Container(
                                width: 200,
                                alignment: Alignment.center,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: hexToColor('#78909C').withOpacity(
                                      authC.isLoginButtonValid() ? 1 : .6),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: authC.isLoading.value
                                    ? Loading(
                                        color: Colors.white,
                                      )
                                    : KText(
                                        text: 'Login',
                                        color: Colors.white,
                                        bold: true,
                                        fontSize: 21,
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 38,
                          ),
                          Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account? ',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 16.0,
                                  color: AppTheme.textColor2,
                                  fontWeight: FontWeight.w400,
                                  //letterSpacing: 1.1,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                onTap: () {
                                  push(SignUpPage());
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontFamily: 'Manrope',
                                    fontSize: 16.0,
                                    color: AppTheme.textColor0,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: authC.visibleBiometric.value,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: Biometric.biometricCategoryGridItem.length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (BuildContext context, int index) {
                          final item =
                              Biometric.biometricCategoryGridItem[index];
                          return Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: hexToColor(item.themeColor),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  '${item.bgThemePath}',
                                  //color: Colors.pink,
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset("${item.iconPath}"),
                                        SizedBox(height: 15),
                                        Text(
                                          '${item.titleText}',
                                          style: TextStyle(
                                              fontFamily: 'Manrope',
                                              fontSize: 16.0,
                                              color: hexToColor('#FFFFFF'),
                                              fontWeight: FontWeight.w700,
                                              height: 1.5),
                                        ),
                                        // SizedBox(height: 5),
                                        Text(
                                          '${item.subTitleText}',
                                          style: TextStyle(
                                              fontFamily: 'Manrope',
                                              fontSize: 16.0,
                                              color: hexToColor('#FFFFFF'),
                                              fontWeight: FontWeight.w700,
                                              height: 1.5),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
