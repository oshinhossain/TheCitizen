import 'package:flutter/material.dart';

import '../config/app_theme.dart';

class CenteredMessage extends StatelessWidget {
  final String message;
  final IconData icon;

  CenteredMessage({
    Key? key,
    required this.message,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              size: 40,
            ),
            Text(
              message,
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 15.0,
                color: AppTheme.textColor4,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
