import 'dart:convert';
import 'dart:typed_data';

import 'package:intl/intl.dart';

class Utility {
  static DateTime convertStringSQLToDate(String dateString) {
    DateTime? date;
    try {
      date = new DateFormat("yyyy-MM-dd").parse(dateString);
    } catch (e) {
      print('$e : Date Parse Exception');
    }
    return date!;
  }

  static String convertSQLToString(String dateString) {
    final fdate = new DateFormat('dd-MMM-yyyy');
    try {
      DateTime? dateTime = convertStringSQLToDate(dateString);
      return fdate.format(dateTime);
    } catch (e) {
      print('$e : Date Parse Exception');
      return '1900-01-01'; // it is demo date
    }
  }

  static Uint8List uint8ListFromBase64String(String data) {
    return base64Decode(data);
  }
}
