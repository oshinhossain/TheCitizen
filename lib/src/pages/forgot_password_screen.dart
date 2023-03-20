import 'package:flutter/material.dart';
import 'package:the_citizen_app/src/config/base.dart';
import '../config/app_theme.dart';
import '../helpers/dialogHelper.dart';

class ForgotPasswordScreen extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 14.0,
          color: AppTheme.textColor0,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.underline,
        ),
      ),
      onTap: () {
        DialogHelper.showUniqueIdentifierInputDialog(
          title: 'Reset Password',
          inputLabel: 'Email/Username',
          onChanged: authC.forgotPasswordInputField,
          onPressed: () {
            print('object');
            authC.passwordResetByEmail();
          },
        );

        // DialogHelper.showOtpAndNewPassInputDialog2(title: 'Reset Password');
      },
    );
  }

  // Widget manageForgotPasswordDialog() {
  //   final Dialog dialogWithImage = Dialog(
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(10))),
  //     child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
  //       buildWhen: (previous, current) =>
  //           previous.forgotPasswordStatus != current.forgotPasswordStatus,
  //       builder: (BuildContext context, state) {
  //         switch (state.forgotPasswordStatus) {
  //           case ForgotPasswordStatus.FORGOT_PASSWORD_INITIAL_STATE:
  //             return showUniqueIdentifierInputDialog(context);
  //           case ForgotPasswordStatus.OTP_SEND_SUCCESS_STATE:
  //             return showOtpAndNewPassInputDialog(context);
  //           case ForgotPasswordStatus.PASSWORD_UPDATE_SUCCESS_STATE:
  //             return showForgotPasswordSuccessDialog(
  //                 context, 'Your password has been updated successfully.');
  //           case ForgotPasswordStatus.PASSWORD_UPDATE_FAILURE_STATE:
  //             return forgetPassShowErrorDialog(context, 'Invalid OTP number.');
  //           case ForgotPasswordStatus.OTP_SEND_FAILURE_STATE:
  //             return forgetPassShowErrorDialog(
  //                 context, "Your Email/Username doesn't exist.");
  //           default:
  //             return forgetPassShowErrorDialog(context,
  //                 'Something went wrong. Please contact with support team.');
  //         }
  //       },
  //     ),
  //   );
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) => Dialog(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.all(Radius.circular(10))),
  //             child: showUniqueIdentifierInputDialog(context),
  //           ),
  //       barrierDismissible: false);
  //   return forgetPassShowErrorDialog(context, 'Empty');
  // }

  // Widget showUniqueIdentifierInputDialog(BuildContext context) {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.vertical,
  //     child: Column(
  //       children: [
  //         Container(
  //           padding: EdgeInsets.only(top: 13, bottom: 13),
  //           alignment: Alignment.center,
  //           decoration: BoxDecoration(
  //             color: hexToColor('#78909C'),
  //             borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(5),
  //               topRight: Radius.circular(5),
  //             ),
  //             border: Border.all(color: hexToColor('#FFFFFF'), width: 1),
  //           ),
  //           child: Text(
  //             'Reset Password',
  //             style: TextStyle(
  //                 fontFamily: 'Manrope',
  //                 color: Colors.white,
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //         Container(
  //           decoration: BoxDecoration(
  //             color: hexToColor('#FFFFFF'),
  //             borderRadius: BorderRadius.only(
  //               bottomLeft: Radius.circular(5),
  //               bottomRight: Radius.circular(5),
  //             ),
  //           ),
  //           padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
  //           child: Column(
  //             children: [
  //               _UserUniqueIdentifierInput(),
  //               SizedBox(height: 10),
  //               _UniqueIdentifierSubmitButton(),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget showOtpAndNewPassInputDialog(BuildContext context) {
  //   return SingleChildScrollView(
  //     physics: BouncingScrollPhysics(),
  //     child: Column(
  //       children: [
  //         Container(
  //           padding: EdgeInsets.only(top: 13, bottom: 13),
  //           alignment: Alignment.center,
  //           decoration: BoxDecoration(
  //               color: hexToColor('#78909C'),
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(5),
  //                 topRight: Radius.circular(5),
  //               ),
  //               border: Border.all(color: hexToColor('#FFFFFF'), width: 1)),
  //           child: Text(
  //             'Reset Password',
  //             style: TextStyle(
  //                 fontFamily: 'Manrope',
  //                 color: Colors.white,
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //         Container(
  //           decoration: BoxDecoration(
  //             color: hexToColor('#FFFFFF'),
  //             borderRadius: BorderRadius.only(
  //               bottomLeft: Radius.circular(5),
  //               bottomRight: Radius.circular(5),
  //             ),
  //           ),
  //           padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 15),
  //           child: Column(
  //             children: [
  //               TimerCountDown(),
  //               _OTPInput(),
  //               _NewPasswordInput(),
  //               _ConfirmPasswordInput(),
  //               SizedBox(height: 10),
  //               _NewPasswordSubmitButton()
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget showForgotPasswordSuccessDialog(BuildContext context, String msg) {
  //   return SingleChildScrollView(
  //     physics: BouncingScrollPhysics(),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: hexToColor('#FFFFFF'),
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(5),
  //           topRight: Radius.circular(5),
  //           bottomLeft: Radius.circular(5),
  //           bottomRight: Radius.circular(5),
  //         ),
  //         border: Border.all(color: hexToColor('#FFFFFF'), width: 1),
  //       ),
  //       child: Column(
  //         children: [
  //           Container(
  //             padding: EdgeInsets.only(top: 12, bottom: 13),
  //             alignment: Alignment.center,
  //             decoration: BoxDecoration(
  //               color: hexToColor('#78909C'),
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(5),
  //                 topRight: Radius.circular(5),
  //               ),
  //             ),
  //             child: Text(
  //               'Success!',
  //               style: TextStyle(
  //                   fontFamily: 'Manrope',
  //                   color: Colors.white,
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //           Container(
  //             padding: EdgeInsets.all(15),
  //             child: Column(
  //               children: [
  //                 Text(
  //                   '$msg',
  //                   style: TextStyle(
  //                       fontFamily: 'Manrope',
  //                       fontSize: 16.0,
  //                       color: Colors.green,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //                 SizedBox(height: 10),
  //                 ElevatedButton(
  //                   style: ButtonStyle(
  //                     backgroundColor: MaterialStateProperty.all<Color>(
  //                         hexToColor('#78909C')),
  //                     visualDensity: VisualDensity(horizontal: 2),
  //                   ),
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: Text(
  //                     'Ok',
  //                     style: TextStyle(
  //                         fontFamily: 'Manrope',
  //                         fontSize: 18.0,
  //                         color: Colors.white),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget forgetPassShowErrorDialog(BuildContext context, dynamic msg) {
  //   return SingleChildScrollView(
  //     physics: BouncingScrollPhysics(),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: hexToColor('#FFFFFF'),
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(5),
  //           topRight: Radius.circular(5),
  //           bottomLeft: Radius.circular(5),
  //           bottomRight: Radius.circular(5),
  //         ),
  //         border: Border.all(color: hexToColor('#FFFFFF'), width: 1),
  //       ),
  //       child: Column(
  //         children: [
  //           Container(
  //             padding: EdgeInsets.only(top: 12, bottom: 13),
  //             alignment: Alignment.center,
  //             decoration: BoxDecoration(
  //               color: hexToColor('#78909C'),
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(5),
  //                 topRight: Radius.circular(5),
  //               ),
  //             ),
  //             child: Text(
  //               'Error!',
  //               style: TextStyle(
  //                   fontFamily: 'Manrope',
  //                   color: Colors.white,
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //           Container(
  //             padding: EdgeInsets.all(15),
  //             child: Column(
  //               children: [
  //                 Text(
  //                   '$msg',
  //                   style: TextStyle(
  //                       fontFamily: 'Manrope',
  //                       fontSize: 16.0,
  //                       color: Colors.red,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //                 SizedBox(height: 10),
  //                 ElevatedButton(
  //                   style: ButtonStyle(
  //                     backgroundColor: MaterialStateProperty.all<Color>(
  //                         hexToColor('#78909C')),
  //                     visualDensity: VisualDensity(horizontal: 2),
  //                   ),
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: Text(
  //                     'Ok',
  //                     style: TextStyle(
  //                         fontFamily: 'Manrope',
  //                         fontSize: 16.0,
  //                         color: Colors.white),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

}
