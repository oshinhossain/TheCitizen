import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/models/my_attendance_dashboard_model.dart';
import '../helpers/k_log.dart';
import '../services/api_service.dart';
import 'package:get/get.dart';
import 'agency_controller.dart';
import 'user_controller.dart';

class MyAttendanceDashboardController extends GetxController with ApiService {
  final presentList = RxList<MyAttendanceDashboardModel>([]);
  final lateList = RxList<MyAttendanceDashboardModel>([]);
  final leaveList = RxList<MyAttendanceDashboardModel>([]);
  final absentList = RxList<MyAttendanceDashboardModel>([]);
  final veryLateList = RxList<MyAttendanceDashboardModel>([]);
  final presentLoad = RxBool(false);
  final selectedOption = Rx<String>('');
  final lateBool = RxBool(false);
  final leaveBool = RxBool(false);
  final absentBool = RxBool(false);
  final veryLateBool = RxBool(false);
  Rx<DateTimeRange> dateRange = DateTimeRange(
    end:
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
    start: DateTime(DateTime.now().year, DateTime.now().month, 01),
  ).obs;

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              onBackground: hexToColor('#78909C'), // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  backgroundColor: hexToColor('#78909C') // button text color
                  ),
            ),
          ),
          child: child!,
        );
      },
      saveText: 'OK',
      context: Get.context!,
      initialDateRange: dateRange.value,
      initialEntryMode: DatePickerEntryMode.calendar,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (newDateRange != null) {
      dateRange.value = newDateRange;
      if (newDateRange.start != null) {
        DateFormat('dd-MMM-yyyy').format(newDateRange.start);
      }
      if (newDateRange.end != null) {
        DateFormat('dd-MMM-yyyy').format(newDateRange.end);
      }

      await getPresentInMonth(isFirst: false);
      await getLateInMonth(isFirst: false);
      // await getveryLateInMonth(isFirst: false);
      await getAbsentInMonth(isFirst: false);
      await getLeaveInMonth(isFirst: false);
    }
  }

  formatDate({required String date}) {
    List<String> splitdate = date.split('-');
    String month = date.split('-')[1];
    switch (month) {
      case '01':
        return splitdate[2] + ' Jan ' + splitdate[0];
      case '02':
        return splitdate[2] + ' Feb ' + splitdate[0];
      case '03':
        return splitdate[2] + ' Mar ' + splitdate[0];
      case '04':
        return splitdate[2] + ' Apr ' + splitdate[0];
      case '05':
        return splitdate[2] + ' May ' + splitdate[0];
      case '06':
        return splitdate[2] + ' June ' + splitdate[0];
      case '07':
        return splitdate[2] + ' July ' + splitdate[0];
      case '08':
        return splitdate[2] + ' Aug ' + splitdate[0];
      case '09':
        return splitdate[2] + ' Sept ' + splitdate[0];
      case '10':
        return splitdate[2] + ' Oct ' + splitdate[0];
      case '11':
        return splitdate[2] + ' Nov ' + splitdate[0];
      case '12':
        return splitdate[2] + ' Dec ' + splitdate[0];

      default:
    }
  }

  getPresentInMonth({required bool isFirst}) async {
    presentLoad.value = true;
    try {
      //isLoading.value = true;
      final selectedAgency = Get.put(AgencyController()).selectedAgency;
      final username = Get.put(UserController()).username;

      final data = {
        "username": username,
        "agencyIds": [selectedAgency!.agencyId],
        "fromDate": isFirst
            ?  DateFormat('yyyy-MM-dd')
                .format(DateTime(DateTime.now().year, DateTime.now().month, 01))
                .toString()
            : DateFormat('yyyy-MM-dd').format(dateRange.value.start),
        "toDate": isFirst
            ? DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()
            : DateFormat('yyyy-MM-dd').format(dateRange.value.end),
        "attStatus": 'present',
        "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
        "appCode": "SHOUT"
      };

      kLog(data);

      final res = await postDynamic(
        authentication: true,
        path: '${dotenv.env['BASE_URL_WFC']}/get_my_daily_attendance_summary',
        body: data,
      );
      kLog('present Count');
      kLog(res.data);
      presentList.clear();
      if (res.data['responseCode'] != null &&
          res.data['responseCode'].contains('200') == true) {
        final getAttendanceHistoryList = res.data['data']
                .map((json) => MyAttendanceDashboardModel.fromJson(
                    json as Map<String, dynamic>))
                .toList()
                .cast<MyAttendanceDashboardModel>()
            as List<MyAttendanceDashboardModel>;

        kLog(getAttendanceHistoryList);

        presentList.clear();
        presentList.addAll(getAttendanceHistoryList);
        presentLoad.value = false;
      }
      presentLoad.value = false;
    } on DioError catch (e) {
      presentLoad.value = false;
      print(e.message);
    }
  }

  getLateInMonth({required bool isFirst}) async {
    lateBool.value = true;
    try {
      //isLoading.value = true;
      final selectedAgency = Get.put(AgencyController()).selectedAgency;
      final username = Get.put(UserController()).username;

      final data = {
        "username": username,
        "agencyIds": [selectedAgency!.agencyId],
        "fromDate": isFirst
            ?  DateFormat('yyyy-MM-dd')
                .format(DateTime(DateTime.now().year, DateTime.now().month, 01))
                .toString()
            : DateFormat('yyyy-MM-dd').format(dateRange.value.start),
        "toDate": isFirst
            ? DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()
            : DateFormat('yyyy-MM-dd').format(dateRange.value.end),
        "attStatus": 'late',
        "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
        "appCode": "SHOUT"
      };

      kLog(data);

      final res = await postDynamic(
        authentication: true,
        path: '${dotenv.env['BASE_URL_WFC']}/get_my_daily_attendance_summary',
        body: data,
      );
      kLog('Late Count');
      kLog(res.data);
      lateList.clear();
      if (res.data['responseCode'] != null &&
          res.data['responseCode'].contains('200') == true) {
        final getAttendanceHistoryList = res.data['data']
                .map((json) => MyAttendanceDashboardModel.fromJson(
                    json as Map<String, dynamic>))
                .toList()
                .cast<MyAttendanceDashboardModel>()
            as List<MyAttendanceDashboardModel>;

        kLog(getAttendanceHistoryList);

        lateList.addAll(getAttendanceHistoryList);
      }
      lateBool.value = false;
    } on DioError catch (e) {
      lateBool.value = false;
      print(e.message);
    }
  }

  // getveryLateInMonth({required bool isFirst}) async {
  //   veryLateBool.value = true;
  //   try {
  //     //isLoading.value = true;
  //     final selectedAgency = Get.put(AgencyController()).selectedAgency;
  //     final username = Get.put(UserController()).username;

  //     final data = {
  //       "username": username,
  //       "agencyIds": [selectedAgency!.agencyId],
  //       "fromDate": isFirst
  //           ? DateFormat('yyyy-MM').format(DateTime.now()).toString() +
  //               '-' +
  //               '01'
  //           : DateFormat('yyyy-MM-dd').format(dateRange.value.start),
  //       "toDate": isFirst
  //           ? DateFormat('yyyy-MM').format(DateTime.now()).toString() +
  //               '-' +
  //               '30'
  //           : DateFormat('yyyy-MM-dd').format(dateRange.value.end),
  //       "attStatus": 'verylate',
  //       "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
  //       "appCode": "SHOUT"
  //     };

  //     kLog(data);

  //     final res = await postDynamic(
  //       authentication: true,
  //       path: '${dotenv.env['BASE_URL_WFC']}/get_my_daily_attendance_summary',
  //       body: data,
  //     );

  //     kLog(res.data);

  //     if (res.data['responseCode'] != null &&
  //         res.data['responseCode'].contains('200') == true) {
  //       final getAttendanceHistoryList = res.data['data']
  //               .map((json) => MyAttendanceDashboardModel.fromJson(
  //                   json as Map<String, dynamic>))
  //               .toList()
  //               .cast<MyAttendanceDashboardModel>()
  //           as List<MyAttendanceDashboardModel>;

  //       kLog(getAttendanceHistoryList);

  //       veryLateList.clear();
  //       veryLateList.addAll(getAttendanceHistoryList);
  //     }
  //     veryLateBool.value = false;
  //   } on DioError catch (e) {
  //     veryLateBool.value = false;
  //     print(e.message);
  //   }
  // }

  getAbsentInMonth({required bool isFirst}) async {
    absentBool.value = true;
    try {
      //isLoading.value = true;
      final selectedAgency = Get.put(AgencyController()).selectedAgency;
      final username = Get.put(UserController()).username;

      final data = {
        "username": username,
        "agencyIds": [selectedAgency!.agencyId],
        "fromDate": isFirst
            ?  DateFormat('yyyy-MM-dd')
                .format(DateTime(DateTime.now().year, DateTime.now().month, 01))
                .toString()
            : DateFormat('yyyy-MM-dd').format(dateRange.value.start),
        "toDate": isFirst
            ? DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()
            : DateFormat('yyyy-MM-dd').format(dateRange.value.end),
        "attStatus": 'absent',
        "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
        "appCode": "SHOUT"
      };

      kLog(data);

      final res = await postDynamic(
        authentication: true,
        path: '${dotenv.env['BASE_URL_WFC']}/get_my_daily_attendance_summary',
        body: data,
      );
      kLog('Absent Count');
      kLog(res.data);
      absentList.clear();
      if (res.data['responseCode'] != null &&
          res.data['responseCode'].contains('200') == true) {
        final getAttendanceHistoryList = res.data['data']
                .map((json) => MyAttendanceDashboardModel.fromJson(
                    json as Map<String, dynamic>))
                .toList()
                .cast<MyAttendanceDashboardModel>()
            as List<MyAttendanceDashboardModel>;

        kLog(getAttendanceHistoryList);

        absentList.addAll(getAttendanceHistoryList);
      }
      absentBool.value = false;
    } on DioError catch (e) {
      absentBool.value = false;
      print(e.message);
    }
  }

  getLeaveInMonth({required bool isFirst}) async {
    leaveBool.value = true;
    try {
      //isLoading.value = true;
      final selectedAgency = Get.put(AgencyController()).selectedAgency;
      final username = Get.put(UserController()).username;

      final data = {
        "username": username,
        "agencyIds": [selectedAgency!.agencyId],
        "fromDate": isFirst
            ? DateFormat('yyyy-MM-dd')
                .format(DateTime(DateTime.now().year, DateTime.now().month, 01))
                .toString()
            : DateFormat('yyyy-MM-dd').format(dateRange.value.start),
        "toDate": isFirst
            ? DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()
            : DateFormat('yyyy-MM-dd').format(dateRange.value.end),
        "attStatus": 'leave',
        "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
        "appCode": "SHOUT"
      };

      kLog(data);
      leaveList.clear();
      final res = await postDynamic(
        authentication: true,
        path: '${dotenv.env['BASE_URL_WFC']}/get_my_daily_attendance_summary',
        body: data,
      );
      kLog('leave Count');
      kLog(res.data);

      if (res.data['responseCode'] != null &&
          res.data['responseCode'].contains('200') == true) {
        final getAttendanceHistoryList = res.data['data']
                .map((json) => MyAttendanceDashboardModel.fromJson(
                    json as Map<String, dynamic>))
                .toList()
                .cast<MyAttendanceDashboardModel>()
            as List<MyAttendanceDashboardModel>;

        kLog(getAttendanceHistoryList);

        leaveList.addAll(getAttendanceHistoryList);
      }
      leaveBool.value = false;
    } on DioError catch (e) {
      leaveBool.value = false;
      print(e.message);
    }
  }
}
