import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:the_citizen_app/src/app.dart';
import 'package:the_citizen_app/src/controllers/config_controller.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
late List<CameraDescription> cameras;
const taskName = 'firstTask';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await Workmanager().initialize(callBackDispather, isInDebugMode: true);
  await Get.put(ConfigController()).initAppConfig();
 
  cameras = await availableCameras();
  runApp(App());
}
