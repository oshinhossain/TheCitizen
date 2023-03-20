import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:the_citizen_app/src/controllers/agency_controller.dart';
import 'package:the_citizen_app/src/helpers/custom_dialog_helper.dart';
import 'package:the_citizen_app/src/helpers/get_hepler.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import 'package:the_citizen_app/src/models/team_leave_type_model.dart';

import 'package:the_citizen_app/src/pages/home_page.dart';
import 'package:the_citizen_app/src/pages/main_page.dart';
import '../config/api_endpoint.dart';
import '../helpers/get_file_name copy.dart';
import '../helpers/uniqe_id.dart';
import '../models/history_image_count_model.dart';
import '../models/leave_balance_model.dart';
import '../models/officer_search_view_model.dart';
import '../services/api_service.dart';
import 'user_controller.dart';

class EmployeeLeaveManageMentController extends GetxController with ApiService {
  final selectedIndex = RxInt(0);
  final startDate = Rx<DateTime?>(DateTime.now());
  final endDate = Rx<DateTime?>(DateTime.now());
  final historyImageCount = RxList<HistoryImageModel>();
  final leaveTypeList = RxList<TeamLeaveTypeModel?>([]);
  final leaveBalanceList = RxList<LeaveBalanceModel?>([]);
  final searchedOfficerList = RxList<OfficerSearchViewModel?>([]);
  final checkBoxList = RxList<OfficerCheckBox?>([]);
  final selectedleaveType = Rx<TeamLeaveTypeModel?>(null);
  final selectedStartDate = RxString('Select Start Date');
  final selectedContactPerson = RxString('Write Officer Name');
  final selectedEndDate = RxString('Select End Date');
  final purpose = RxString('');
  final contactPersonSearch = RxString('');
  final selectedCheckValue = RxString('');
  final start_half = RxDouble(0);
  final leavedays = RxDouble(1);
  final isLoading = RxBool(false);
  final isLoading1 = RxBool(false);
  final end_half = RxDouble(0);
  final selectedOfficer = Rx<OfficerSearchViewModel?>(null);
  final imageList = RxList<File?>([]);
  final attachments = RxList<MultipartFile?>([]);

  pickImage({required ImageSource imageSource}) async {
    final pickImage = await ImagePicker().pickImage(source: imageSource);
    if (pickImage != null) {
      imageList.add(File(pickImage.path));
      final fileName = getExt(path: pickImage.path);
      attachments.add(
        await MultipartFile.fromFile(
          pickImage.path,
          filename: 'rep.jpg',
        ),
      );
    }
  }

  @override
  void onReady() {
    start_half.value = 1;
    startDate.value = DateTime.now();
    end_half.value = 1;
    endDate.value = DateTime.now();

    super.onReady();
  }

  @override
  void onClose() {
    leavedays.value = 0;
    start_half.value = 1;
    startDate.value = DateTime.now();
    end_half.value = 1;
    endDate.value = DateTime.now();

    super.onClose();
  }

  pickDate({required bool? start}) async {
    final date = await showDatePicker(
        context: Get.context!,
        initialDate: start! ? DateTime.now() : startDate.value!,
        firstDate: start ? DateTime(1950) : startDate.value!,
        lastDate: DateTime(2050));

    if (date != null) {
      if (start) {
        startDate.value = date;
      } else {
        endDate.value = date;

        if (DateFormat.yMMMd().format(startDate.value!) !=
            DateFormat.yMMMd().format(endDate.value!)) {
          differenceDays();
        } else {
          end_half.value = 1.0;
          start_half.value = 1.0;
          leavedays.value = 1.0;
        }
      }
    }
  }

  differenceDays() {
    kLog('differ');
    kLog(startDate.value!);
    kLog(endDate.value);
    leavedays.value =
        (endDate.value!.difference(startDate.value!).inDays.toDouble()) + 2;
    kLog(leavedays);
    if (start_half == .5 || start_half == 1.5) {
      leavedays - 0.5;
    }
    if (end_half == .5 || end_half == 1.5) {
      leavedays - 0.5;
    }
    kLog(leavedays);
  }

  getLeaveBalance() async {
    isLoading.value = true;

    final username = Get.put(UserController()).username;
    final selectedAgency = Get.put(AgencyController()).selectedAgency;
    final body = {
      'apiKey': "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
      'appCode': ApiEndpoint.WFC_APP_CODE,
      'username': username,
      'agencyIds': [selectedAgency!.agencyId],
    };

    // final res = await postDynamic(
    //     authentication: true, path: ApiEndpoint.getLeaveBalance(), body: body);

    try {
      final res =
          await Dio().post('${dotenv.env['BASE_URL_WFC']}/get_leave_balance',
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  // 'latLng':   '${locationC.latLng.value.latitude},${locationC.latLng.value.longitude}',
                  'latLng':
                      '${locationC.latLng.value.latitude},${locationC.latLng.value.longitude}',
                  'Authorization':
                      'Bearer ${Get.put(UserController()).getToken()}'
                },
              ),
              data: body);
      kLog(res);
      if (res.data['status'] != null && res.data['responseCode'] == '200') {
        final allleaveBalance = res.data['data']
            .map((json) =>
                LeaveBalanceModel.fromJson(json as Map<String, dynamic>))
            .toList()
            .cast<LeaveBalanceModel>() as List<LeaveBalanceModel>;
        leaveBalanceList.clear();
        leaveBalanceList.addAll(allleaveBalance);
      }
    } catch (e) {
      throw e;
    }
  }

  // submit_ticket() async {
  //   try {
  //     FormData formDatas = FormData.fromMap({
  //       "image": attachments[0],
  //       "issue_title": "issue_title",
  //       "issue_description": "issue_description",
  //       "customer_email": "hridoycse.eng@gmail.com",
  //       "customer_phone": "01768003197",
  //       "callback_time": "11:12 am",
  //       "note": "note",
  //       "is_resolved": true,
  //       "resolve_note": "resolve_note",
  //     });
  //     kLog(attachments.length);
  //     kLog(formDatas.fields);

  //     final response = await Dio().post(
  //       'http://api.upodesta.com/api/submit_ticket',
  //       options: Options(headers: {'Content-Type': 'application/json'}),
  //       data: formDatas,
  //     );
  //     kLog(response);
  //     showAboutDialog(
  //       context: Get.context!,
  //     );

  //     kLog(response.statusCode);

  //     return response;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  getLeaveTypeList() async {
    try {
      final username = Get.put(UserController()).username;
      final selectedAgency = Get.put(AgencyController()).selectedAgency;
      final body = {
        'apiKey': ApiEndpoint.SHOUT_API_KEY,
        'appCode': ApiEndpoint.SHOUT_APP_CODE,
        'username': username,
        'agencyId': [selectedAgency!.agencyId],
        "uiCodes": ["411001"],
      };

      final res = await getDynamic(
          authentication: true,
          path: ApiEndpoint.getLeaveTypeUrl(),
          queryParameters: body);

      if (res.data['status'] != null &&
          res.data['status'].contains('successful') == true) {
        isLoading.value = false;
        final allleavetype = res.data['data']
            .map((json) =>
                TeamLeaveTypeModel.fromJson(json as Map<String, dynamic>))
            .toList()
            .cast<TeamLeaveTypeModel>() as List<TeamLeaveTypeModel>;
        leaveTypeList.clear();
        leaveTypeList.addAll(allleavetype);

        selectedleaveType.value = leaveTypeList.first;

        print('the length ' + leaveTypeList.length.toString());
        isLoading.value = false;
      }
    } on DioError catch (e) {
      throw e;
    }
  }

  getContactPersonList() async {
    isLoading.value = true;

    final username = Get.put(UserController()).username;
    final selectedAgency = Get.put(AgencyController()).selectedAgency;
    final body = {
      'apiKey': ApiEndpoint.SHOUT_API_KEY,
      'appCode': ApiEndpoint.SHOUT_APP_CODE,
      'username': username,
      'agencyIds': [selectedAgency!.agencyId],
      "uiCodes": ["411001"],
      "additionalUsernames": [username],
      "searchText": contactPersonSearch.value,
    };
    kLog(jsonEncode(body));
    final res = await postDynamic(
        authentication: true, path: ApiEndpoint.getContactPerson(), body: body);
    kLog(res.data);
    if (res.data['status'] != null &&
        res.data['status'].contains('successful') == true) {
      isLoading.value = false;
      final allSearchedOfficer = res.data['data']
          .map((json) =>
              OfficerSearchViewModel.fromJson(json as Map<String, dynamic>))
          .toList()
          .cast<OfficerSearchViewModel>() as List<OfficerSearchViewModel>;
      searchedOfficerList.clear();
      searchedOfficerList.addAll(allSearchedOfficer);
      checkBoxList.clear();
      for (var element in searchedOfficerList) {
        checkBoxList
            .add(OfficerCheckBox(isCheck: false, name: element!.fullname!));
      }
      await getFileCount();
      kLog('the length' +
          searchedOfficerList.length.toString() +
          checkBoxList.length.toString());
      isLoading.value = false;
    }
  }

  leavesubmission() async {
    kLog('value');
    GetHelper.showDialog(widget: CircularProgressIndicator());
    try {
      kLog(DateFormat('yyyy-MM-dd').format(endDate.value!).toString());
      kLog(DateFormat('yyyy-MM-dd').format(startDate.value!).toString());
      final username = Get.put(UserController()).username;

      final selectedAgency = Get.put(AgencyController()).selectedAgency;

      FormData body = FormData.fromMap({
        "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
        "username": username,
        "agencyIds": selectedAgency!.agencyId,
        "appCode": "SHOUT",
        "additionalUsernames": username,
        "leaveCode": selectedleaveType.value!.leaveCode,
        "leaveName": selectedleaveType.value!.leaveName,
        "refno": "1458",
        "mandatory": selectedleaveType.value!.isMandatory,
        "encashable": selectedleaveType.value!.isEncashable,
        "leavePurpose": purpose.value,
        "annualQuota": selectedleaveType.value!.annualQuota,
        "prorated": selectedleaveType.value!.isProrated,
        "contactDetails": [
          {
            "empId": selectedOfficer.value!.id,
            "username": selectedOfficer.value!.username,
            "fullname": selectedOfficer.value!.fullname,
            "mobile": selectedOfficer.value!.mobile,
            "email": selectedOfficer.value!.email,
          }
        ].toString(),
        "leaveStartDate":
            DateFormat('yyyy-MM-dd').format(startDate.value!).toString(),
        "leaveStartFirstHalf": start_half.value == 0.5 ? true : false,
        "leaveStartFull": start_half.value == 1 ? true : false,
        "leaveStartSecondHalf": start_half.value == 1.5 ? true : false,
        "leaveEndDate":
            DateFormat('yyyy-MM-dd').format(endDate.value!).toString(),
        "leaveEndFirstHalf": end_half.value == 0.5 ? true : false,
        "leaveEndFull": end_half.value == 1 ? true : false,
        "leaveEndSecondHalf": end_half.value == 1.5 ? true : false,
        "daysInLeave": leavedays.value,
        "lwp": leaveBalanceList[leaveBalanceList.indexWhere((element) =>
                        element!.leaveCode ==
                        selectedleaveType.value!.leaveCode)]!
                    .balanceAfterLeave ==
                0
            ? true
            : false,
        "attachmentUploaded": true,
        "files": attachments
      });

      kLog(body);
      kLog("http://123.200.22.150:9020/add_tm_leave_application");

      final res = await postDynamic(
          path: "${dotenv.env['BASE_URL_WFC']}/add_tm_leave_application",
          authentication: true,
          body: body);
      kLog(res.data);
      if (res.statusCode == 200) {
        CustomDialogHelper.successDialog(
          title: 'Leave Application',
          msg: 'Application Submitted Successfully',
          color: Colors.amber,
          onPressed: () {
            back();
            offAll(MainPage());
          },
        );
      } else {
        CustomDialogHelper.successDialog(
          title: 'Leave Application',
          msg: 'Application Not Submitted, Try again',
          color: Colors.red,
          onPressed: () {
            back();
            back();
          },
        );
      }
      kLog(res.statusCode);
    } on DioError catch (e) {
      isLoading1.value = false;
      kLog(e.message);
    }
  }

  changeValue({required bool a, required String username}) {
    for (var element in checkBoxList) {
      element!.isCheck = false;
    }
    checkBoxList[checkBoxList.indexWhere((e) => e!.name == username)]!.isCheck =
        a;
    selectedCheckValue.value = username;
  }

  getFileCount() async {
    try {
      isLoading.value = true;
      historyImageCount.clear();
      for (var element in searchedOfficerList) {
        // kLog(element.id);

        final selectedAgency = Get.put(AgencyController()).selectedAgency;
        final username = Get.put(UserController()).username;
        final params = {
          'apiKey': ApiEndpoint.KYC_API_KEY,
          'appCode': ApiEndpoint.WFC_APP_CODE,
          'agencyId': selectedAgency!.agencyId,
          //'agencyId': ['e3b21bef-1afb-4ed7-8a46-2b1801d8649b'],
          'username': username,
          'fileCategory': 'FILE_CATEGORY_TASK_PROGRESS',
          'fileRefId': element!.id!,
          'fileRefNo': '',

          'fileEntryUsername': ''
        };

        final res = await getDynamic(
          path: ApiEndpoint.getFileCount(),
          queryParameters: params,
        );
        historyImageCount.add(HistoryImageModel(
          progressId: element.id!,
          imageCount: res.data['data']['fileCount'].toString(),
        ));

        isLoading.value = false;
      }
      // ignore: unused_local_variable
      for (var element in historyImageCount) {
        print('image Count');
        // kLog('${element.progressId} ${element.imageCount}');
      }
    } on DioError catch (e) {
      print(e.message);
    }
//get history image
  }
}
