import 'dart:io';

import 'package:camera/camera.dart';

import 'k_log.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

void compressWithImageCompress(
    {required String path, required double quality}) async {
  final response = await FlutterImageCompress.compressWithFile(
    path,
    minWidth: 320,
    minHeight: 240,
    quality: quality.truncate(),
  );

  kLog(response);
}

/* ---------------------------------------------------------------------------- */
// ***************** Compress image from camera **********************
/* ---------------------------------------------------------------------------- */

Future<File> compressFile({required File? file}) async {
  final filePath = file!.path;

  // Create output file path
  // eg:- "Volume/VM/abcd_out.jpeg"
  final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
  final splitted = filePath.substring(0, (lastIndex));
  final outPath = '${splitted}_out${filePath.substring(lastIndex)}';
  var result = await FlutterImageCompress.compressAndGetFile(
    file.path,
    outPath,
    quality: 80,
  );

  // print(file.lengthSync());
  // print(result!.lengthSync());

  return result!;
}

Future<File?> compressCameraImageAndGetFile(
    XFile file, String targetPath) async {
  final result = await FlutterImageCompress.compressAndGetFile(
    file.path, // file path
    targetPath, // target path
    quality: 60,
    minWidth: 1024,
  );
  return result;
}
/* ---------------------------------------------------------------------------- */