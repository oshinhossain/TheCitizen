import 'package:flutter/material.dart';

class EmergencyShoutHelper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => StartTask(
          //       title: START_TASK_SCREEN_TITLE,
          //     ),
          //   ),
          // );
        },
        /*child: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.grey,
                    child: ImageIcon(
                      AssetImage('assets/images/helping.png'),
                      //color: Colors.red,
                      size: 20.0,
                    ),
                  ),*/
        child: ImageIcon(
          AssetImage('assets/images/helping.png'),
          color: Color(0xFFF2BA14),
          size: 24.0,
        ),
      ),
    );
  }
}
