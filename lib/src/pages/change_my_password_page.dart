import 'package:flutter/material.dart';
import 'package:giff_dialog/giff_dialog.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import '../config/app_theme.dart';
import '../helpers/dialogHelper.dart';

class ChangeMyPasswordPage extends StatefulWidget {
  @override
  _ChangeMyPasswordPageState createState() => _ChangeMyPasswordPageState();
}

class _ChangeMyPasswordPageState extends State<ChangeMyPasswordPage> with Base {
  String hintText = '********';
  bool _isObscure = true;
  bool _isConframPasswordShow = true;
  bool _isNewPasswordShow = true;

  TextEditingController oldPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController confrPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppTheme.backgroundColor,
        iconTheme: IconThemeData(
          color: AppTheme.textColor6,
        ),
        title: Text(
          'Change My Password',
          //   "${widget.title}",
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 18.0,
            color: AppTheme.appBarTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              TextField(
                obscureText: _isObscure,
                keyboardType: TextInputType.text,
                controller: oldPass,
                onChanged: authC.oldPassword,
                decoration: InputDecoration(
                  label: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Old Password',
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
                  hintText: hintText,
                  filled: false,
                  hintStyle: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 14.0,
                    color: AppTheme.textColor3,
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppTheme.borderColor, width: 1.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: hexToColor('#F2BA14'), width: 1.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: hexToColor('#FE0101'), width: 1.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: hexToColor('#FE0101'), width: 1.0),
                  ),
                  suffixIcon: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: AppTheme.borderColor,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _isObscure = !_isObscure;
                        },
                      );
                    },
                  ),
                  // errorText: 'Old Password can\'t be empty.',
                ),
              ),
              TextField(
                obscureText: _isNewPasswordShow,
                keyboardType: TextInputType.text,
                controller: newPass,
                onChanged: authC.newPassword,
                decoration: InputDecoration(
                  label: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'New Password',
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
                  hintText: hintText,
                  filled: false,
                  hintStyle: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 14.0,
                    color: AppTheme.textColor3,
                    fontWeight: FontWeight.w400,
                  ),
                  errorMaxLines: 6,
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppTheme.borderColor, width: 1.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: hexToColor('#F2BA14'), width: 1.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: hexToColor('#FE0101'), width: 1.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: hexToColor('#FE0101'), width: 1.0),
                  ),
                  suffixIcon: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    icon: Icon(
                      _isNewPasswordShow
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppTheme.borderColor,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _isNewPasswordShow = !_isNewPasswordShow;
                        },
                      );
                    },
                  ),
                  // errorText:
                  //     'New Password must be at least 10 characters in length. '
                  //     'It must contain a minimum of 1 lower case letter [a-z] and a minimum of 1 upper case letter [A-Z] '
                  //     'and a minimum of 1 numeric character [0-9]. Please don\'t use any special characters.',
                ),
              ),
              TextField(
                obscureText: _isConframPasswordShow,
                keyboardType: TextInputType.text,
                onChanged: authC.conframPassword,
                controller: confrPass,
                decoration: InputDecoration(
                  label: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Confirm Password',
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
                  hintText: hintText,
                  filled: false,
                  hintStyle: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 14.0,
                    color: AppTheme.textColor3,
                    fontWeight: FontWeight.w400,
                  ),
                  errorMaxLines: 4,
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppTheme.borderColor, width: 1.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: hexToColor('#F2BA14'), width: 1.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: hexToColor('#FE0101'), width: 1.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: hexToColor('#FE0101'), width: 1.0),
                  ),
                  suffixIcon: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    icon: Icon(
                      _isConframPasswordShow
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppTheme.borderColor,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _isConframPasswordShow = !_isConframPasswordShow;
                        },
                      );
                    },
                  ),
                  // errorText:
                  //     'New Password and confirm password does not match.',
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                height: 50,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          hexToColor('#78909C'))
                      // : MaterialStateProperty.all<Color>(Colors.blueGrey.withOpacity(0.3)),
                      ),
                  // onPressed: authC.isChangePasswordButtonValid()
                  //     ? () {
                  //         authC.oldPassword.value == authC.newPassword.value
                  //             ? DialogHelper.showForgotPasswordSuccessDialog(
                  //                 msg: 'Old password and new password is same',
                  //                 title: 'Please change your new password',
                  //               )
                  //             : authC.changePassword(context);
                  //       }
                  //     : () {
                  //         DialogHelper.showForgotPasswordSuccessDialog(
                  //           msg: 'Password not match',
                  //           title: 'Please chack your new password',
                  //         );
                  //       },

                  onPressed: () {
                    authC.isChangePasswordButtonValid()
                        ? oldPass.text == newPass.text
                            ? DialogHelper.showForgotPasswordSuccessDialog(
                                msg: 'Old password and new password is same',
                                title: 'Please change your new password',
                              )
                            : authC.changePassword(context)
                        : () {
                            DialogHelper.showForgotPasswordSuccessDialog(
                              msg: 'Password not match',
                              title: 'Please chack your new password',
                            );
                          };
                  },

                  icon: ImageIcon(
                    AssetImage("assets/images/submit-icon.png"),
                    color: Colors.white,
                    size: 22,
                  ),
                  label: Text(
                    'Submit',
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Show Success Dialog

Future showSuccessDialog({
  required BuildContext context,
  String? title,
  String? description,
}) {
  return showDialog(
    context: context,
    builder: (_) => NetworkGiffDialog(
      image: Image.asset('assets/gif/success_gif.gif', fit: BoxFit.cover),
      title: Text(
        title ?? 'SignUp Successful',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
      ),
      entryAnimation: EntryAnimation.bottomRight,
      description: Text(
        description ??
            'This operation is completed successfully. Press "Ok", button to dismiss this dialog.',
        textAlign: TextAlign.center,
      ),
      onlyOkButton: true,
      onOkButtonPressed: () {
        Navigator.pop(context, 'Ok');
      },
    ),
  );
}

//Show Error Dialog
Future showErrorDialog({
  required BuildContext context,
  String? title,
  String? description,
}) {
  return showDialog(
    context: context,
    builder: (_) => NetworkGiffDialog(
      image: Image.asset('assets/gif/error_gif.gif', fit: BoxFit.contain),
      title: Text(
        title ?? 'Error!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
      ),
      entryAnimation: EntryAnimation.bottomRight,
      description: Text(
        description ??
            'This operation cannot completed successfully. Press "Ok", button to dismiss this dialog.',
        textAlign: TextAlign.center,
      ),
      onlyOkButton: true,
      buttonOkColor: Colors.red,
      onOkButtonPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
