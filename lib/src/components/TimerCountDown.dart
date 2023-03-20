import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';

class TimerCountDown extends StatefulWidget {
  @override
  State<TimerCountDown> createState() => _TimerCountDownState();
}

class _TimerCountDownState extends State<TimerCountDown> {
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 5);

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void resetTimer() {
    setState(() {
      countdownTimer!.cancel();
      myDuration = Duration(minutes: 5);
    });
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    countdownTimer!.cancel();
    super.dispose();
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Column(
      children: [
        Text(
          'An OTP has been sent on your email. Please check your inbox or spam.',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Manrope',
            color: hexToColor('#5293A6'),
          ),
        ),
        //  Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text(
        //           'Did not receive your OTP? ',
        //           style: TextStyle(
        //             fontFamily: 'Manrope',
        //             color: MyHexColor('#5293A6'),
        //             fontSize: 12,
        //             fontWeight: FontWeight.w500,
        //           ),
        //         ),
        //         GestureDetector(
        //           onTap: () {
        //             context.read<ForgotUsernameBloc>().add(const ForgotUserNameIsTimerRunningChanged(true));
        //             context.read<ForgotUsernameBloc>().add(ForgotUserNameOtpSendAgain());
        //             resetTimer();
        //           },
        //           child: Text(
        //             'Send Again',
        //             style: TextStyle(
        //               fontFamily: 'Manrope',
        //               color: MyHexColor('#121E42'),
        //               fontSize: 12,
        //               fontWeight: FontWeight.bold,
        //               decoration: TextDecoration.underline,
        //             ),
        //           ),
        //         )
        //       ],
        //     ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 20.0,
              width: 20.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: Color(0xFFF2BA14),
              ),
              child: Text(
                '$minutes',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700),
              ),
            ),
            Text(
              ' : ',
              style: TextStyle(
                  color: Color(0xFFF2BA14),
                  fontSize: 16.0,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700),
            ),
            Container(
              height: 20.0,
              width: 20.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: Color(0xFFF2BA14),
              ),
              child: Text(
                '$seconds',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        )
        //  SizedBox(),
      ],
    );
  }
}
