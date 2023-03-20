import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:the_citizen_app/main.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import '../../config/app_color.dart';
import '../../helpers/image_compress.dart';

// late List<CameraDescription> cameras;

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with Base {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(); // Create instance.
  late CameraController _cameraController;
  Future<void>? cameraValue;
  bool isRecoring = false;
  bool flash = false;
  bool iscamerafront = true;
  double transform = 0;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() async {
    super.dispose();
    _cameraController.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (!_cameraController.value.isInitialized) {
    //   return Container();
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text('Take photo'),
        backgroundColor: AppColors.buttonColor,
      ),
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: AspectRatio(
                    aspectRatio: _cameraController.value.aspectRatio,
                    child: CameraPreview(_cameraController),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
            },
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: AppColors.buttonColor,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          flash ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                          size: 25,
                        ),
                        highlightColor: Colors.grey.withOpacity(.5),
                        onPressed: () {
                          setState(() {
                            flash = !flash;
                          });
                          flash ? _cameraController.setFlashMode(FlashMode.torch) : _cameraController.setFlashMode(FlashMode.off);
                        },
                      ),
                      FloatingActionButton(
                        child: Icon(Icons.camera_alt),
                        backgroundColor: Colors.blueGrey,
                        onPressed: () {
                          _onCapturePressed(context);
                        },
                      ),
                      IconButton(
                        icon: Transform.rotate(
                          angle: transform,
                          child: Icon(
                            Icons.flip_camera_ios_rounded,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        highlightColor: Colors.blueAccent,
                        onPressed: () async {
                          setState(() {
                            iscamerafront = !iscamerafront;
                            transform = transform + pi;
                          });
                          int cameraPos = iscamerafront ? 0 : 1;
                          _cameraController = CameraController(
                            cameras[cameraPos],
                            ResolutionPreset.high,
                          );
                          cameraValue = _cameraController.initialize();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // void takePhoto(BuildContext context) async {
  //   XFile file = await _cameraController.takePicture();
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(
  //   //     builder: (builder) => CameraViewPage(
  //   //       path: file.path,
  //   //     ),
  //   //   ),
  //   // );
  // }

  void _onCapturePressed(context) async {
    final targetPath = (await getTemporaryDirectory()).path + '${DateTime.now()}.jpg';

    try {
      // var image = File(path);
      XFile picture = await _cameraController.takePicture();
      picture.saveTo(targetPath);
      File? image = await compressCameraImageAndGetFile(picture, targetPath);

      shoutC.imagefiles.add(image!);
      back();
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  // IconData _getCameraLensIcon(CameraLensDirection direction) {
  //   switch (direction) {
  //     case CameraLensDirection.back:
  //       return Icons.flip_camera_ios_sharp;
  //     case CameraLensDirection.front:
  //       return Icons.flip_camera_ios_sharp;
  //     case CameraLensDirection.external:
  //       return Icons.camera_alt;
  //     default:
  //       return Icons.flip_camera_ios_sharp;
  //   }
  // }
}
