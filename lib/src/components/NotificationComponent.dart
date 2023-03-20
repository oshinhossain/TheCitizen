import 'package:flutter/material.dart';
import 'package:the_citizen_app/src/helpers/route.dart';

import 'MyPushNotification.dart';

class NotificationComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        push(MyPushNotification());
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: ImageIcon(
              AssetImage('assets/images/notifications_icon.png'),
              color: Color(0xFF5293A6),
              size: 24.0,
            ),
          ),
          true
              ? Positioned(
                  right: 1,
                  top: 1,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
