import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/config/scroll_behavior_modified.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/pages/splash_page.dart';

import 'config/app_theme.dart';

class App extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(color: hexToColor('#78909C'),
      builder: (context, widget) => ScrollConfiguration(
        behavior: ScrollBehaviorModified(),
        child: widget!,
      ),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: SplashPage(),
    );
  }
}
