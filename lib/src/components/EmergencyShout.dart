import 'package:flutter/material.dart';

class EmergencyShout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => MyEmergencyShoutList(
          //       title: MY_REPORT_LIST_SCREEN_NAME,
          //     ),
          //   ),
          // );
        },
        child: ImageIcon(
          AssetImage('assets/images/emergency.png'),
          color: Color(0xFFF2BA14),
          size: 24.0,
        ),

        /*child: Image.asset(
                    "assets/images/emergency.png",
                    height: 24,
                  ),*/
      ),
    );
  }
}
