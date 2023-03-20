import 'package:path/path.dart' show extension;

String getFileName({required String path}) {
  return extension(path);
}
