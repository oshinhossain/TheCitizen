import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/models/my_attendance_dashboard_model.dart';

import '../enums/enums.dart';
import '../helpers/k_log.dart';
import '../models/agency_attendance_summary_model.dart';
import '../models/get_employees_by_attendance_model.dart';
import '../services/api_service.dart';
import 'package:get/get.dart';

import 'agency_controller.dart';
import 'user_controller.dart';

class AgencyAttendanceDashboardController extends GetxController
    with ApiService {
  final selectedDate =
      RxString(DateFormat('yyyy-MM-dd').format(DateTime.now()));
  final selectedShowDate = Rx<DateTime?>(DateTime.now());
  final veryLateList = RxList<GetEmployeesByAttendanceModel>([]);
  final presenNowtList = RxList<GetEmployeesByAttendanceModel>([]);
  final ontimeList = RxList<GetEmployeesByAttendanceModel>([]);
  final presentTodayList = RxList<GetEmployeesByAttendanceModel>([]);
  final allEmployeeList = RxList<GetEmployeesByAttendanceModel>([]);
  final leaveList = RxList<GetEmployeesByAttendanceModel>([]);
  final absentList = RxList<GetEmployeesByAttendanceModel>([]);
  final lateList = RxList<GetEmployeesByAttendanceModel>([]);
  final agencyattendanceSummary = Rx<AgencyattendanceSummaryModel?>(null);

  pickDate() async {
    final date = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));

    if (date != null) {
      selectedDate.value = DateFormat('yyyy-MM-dd').format(date);
      selectedShowDate.value = date;
      await getAgencyattendanceSummary(isfirst: false);
      await getattendancehistorydetails(attStatus: 'present');
    }
  }

  showDate(DateTime date) {
    return DateFormat.yMMMd()
            .format(date)
            .toString()
            .split(',')[0]
            .split(' ')[1] +
        ' ' +
        DateFormat.yMMMd().format(date).toString().split(',')[0].split(' ')[0] +
        ' ' +
        DateFormat.yMMMd().format(date).toString().split(',')[1];
  }

  getAgencyattendanceSummary({required bool isfirst}) async {
    try {
      //isLoading.value = true;
      final selectedAgency = Get.put(AgencyController()).selectedAgency;
      final username = Get.put(UserController()).username;

      final data = {
        'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
        'username': username,
        'agencyIds': [selectedAgency!.agencyId!],
        'appCode': 'SHOUT',
        'countryCode': 'BD',
        'attDate': isfirst
            ? DateFormat('yyyy-MM-dd').format(DateTime.now())
            : selectedDate.value
      };
      kLog('summary model');
      kLog(jsonEncode(data));
      final res = await postDynamic(
        authentication: true,
        path: '${dotenv.env['BASE_URL_WFC']}/get_daily_attendance_status',
        body: data,
      );
      kLog(res.data);
      if (res.data['responseCode'] == "200") {
        final a = AgencyattendanceSummaryModel.fromJson(
            res.data['data'] as Map<String, dynamic>);
        agencyattendanceSummary.value = a;
      }

      //  offAll(ProjectDashboardv1());

    } on dio.DioError catch (e) {
      print(e.message);
    }
  }

  double calculateEffectiveTime({required String time}) {
    int alltime = 9 * 3600;
    List<String> a = time.split(':');
    int hour = int.parse(a[0]);
    int minute = int.parse(a[1]);
    int second = int.parse(a[2]);
    int totalEffTime = (hour * 3600) + (minute * 60) + second;

    double percentage = (100 / alltime) * totalEffTime;
    return (percentage / 100);
  }

  formatTime({required String time}) {
    List<String> a = time.split(':');
    int hour = int.parse(a[0]);
    int minute = int.parse(a[1]);
    int second = int.parse(a[2]);
    String? intime;
    String m;
    String h;
    String s;
    if (hour > 12) {
      if (hour - 12 > 9) {
        h = (hour - 12).toString();
      } else {
        h = '0' + (hour - 12).toString();
      }
      if (second > 9) {
        s = second.toString();
      } else {
        s = '0' + second.toString();
      }
      if (minute > 9) {
        m = minute.toString();
      } else {
        m = '0' + minute.toString();
      }
      intime = h.toString() + ':' + m + ':' + s + ' pm';
    } else if (hour == 12) {
      if (second > 9) {
        s = second.toString();
      } else {
        s = '0' + second.toString();
      }
      if (minute > 9) {
        m = minute.toString();
      } else {
        m = '0' + minute.toString();
      }
      intime = hour.toString() + ':' + m + ':' + s + ' pm';
    } else {
      if (hour > 9) {
        h = (hour).toString();
      } else {
        h = '0' + (hour).toString();
      }
      if (second > 9) {
        s = second.toString();
      } else {
        s = '0' + second.toString();
      }
      if (minute > 9) {
        m = minute.toString();
      } else {
        m = '0' + minute.toString();
      }
      intime = h.toString() + ':' + m + ':' + s + ' am';
    }
    return intime;
  }

  Color colorFix({required double effTime}) {
    if (effTime >= 1) {
      return Colors.green;
    } else if (effTime >= 0.9) {
      return Colors.amber;
    } else if (effTime >= 0.7) {
      return hexToColor('#FFA133');
    } else if (effTime >= 0.5) {
      return Colors.cyan;
    } else {
      return Colors.red;
    }
  }

  getattendancehistorydetails({required String attStatus}) async {
    try {
      final username = Get.put(UserController()).username;

      final selectedAgency = Get.put(AgencyController()).selectedAgency;
      final params = {
        'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
        'countryCode': 'BD',
        'appCode': 'WFC',
        'username': username,
        'agencyIds': [selectedAgency!.agencyId!],
        'attDate':
            DateFormat('yyyy-MM-dd').format(selectedShowDate.value!).toString(),
        'attStatus': attStatus
      };
      kLog('body');
      kLog(jsonEncode(params));
      final res = await postDynamic(
        authentication: true,
        path:
            '${dotenv.env['BASE_URL_WFC']}/get_employees_by_attendance_status',
        body: params,
      );
      kLog('response && body');
      kLog(res.data);
      kLog(attStatus);
      if (res.data['responseCode'] != null &&
          res.data['responseCode'].contains('200') == true) {
        final attendanceHistoryData = res.data['data']
                .map((json) => GetEmployeesByAttendanceModel.fromJson(
                    json as Map<String, dynamic>))
                .toList()
                .cast<GetEmployeesByAttendanceModel>()
            as List<GetEmployeesByAttendanceModel>;
        kLog(res.data);
        if (attendanceHistoryData.isNotEmpty) {
          presentTodayList.clear();
          presentTodayList.addAll(attendanceHistoryData);
          kLog('present list');

          if (attStatus == 'present') {
            kLog(presenNowtList.length);
          } else if (attStatus == 'absent') {
            absentList.clear();
            absentList.addAll(attendanceHistoryData);
          } else if (attStatus == 'late') {
            lateList.clear();
            lateList.addAll(attendanceHistoryData);
          } else if (attStatus == 'verylate') {
            veryLateList.clear();
            veryLateList.addAll(attendanceHistoryData);
          } else if (attStatus == 'presentnow') {
            presenNowtList.clear();
            presenNowtList.addAll(attendanceHistoryData);
          } else if (attStatus == 'ontime') {
            ontimeList.clear();
            ontimeList.addAll(attendanceHistoryData);
          } else if (attStatus == 'leave') {
            leaveList.clear();
            leaveList.addAll(attendanceHistoryData);
          } else {}
        } else {
          absentList.clear();

          lateList.clear();

          veryLateList.clear();
          presentTodayList.clear();
          presenNowtList.clear();
          ontimeList.clear();

          leaveList.clear();
        }
      }
    } on dio.DioError catch (e) {
      print(e.message);
    }
  }
}
