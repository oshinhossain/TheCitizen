import 'package:flutter/material.dart';

class OfflineIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        child: ImageIcon(
          AssetImage('assets/images/offline.png'),
          color: Color(0xFF5293A6),
          size: 24.0,
        ),
        onTap: () {
          // Toast.show(
          //   'You are in offline mode.',
          //   context,
          //   gravity: Toast.CENTER,
          //   backgroundColor: Colors.blueGrey,
          //   textColor: Colors.white,
          //   duration: Toast.LENGTH_LONG,
          // );
        },
      ),
    );
  }
}
