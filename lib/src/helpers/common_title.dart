import 'package:flutter/material.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';

class CommonTitle extends StatelessWidget {
  String? title;
  CommonTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
          child: Divider(
        color: hexToColor('#CFDEE3'),
        thickness: 1,
      )),
      SizedBox(
        width: 5,
      ),
      KText(
        text: title,
        fontSize: 16,
        color: AppTheme.appBarTextColor,
        bold: true,
      ),
      // Text("Responding Party"),
      SizedBox(
        width: 5,
      ),
      Expanded(
          child: Divider(
        color: hexToColor('#CFDEE3'),
        thickness: 1,
      )),
    ]);
  }
}
