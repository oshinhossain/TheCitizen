import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../services/api_service.dart';

class MyApprovalDashboardController extends GetxController with ApiService {
  final startDate = Rx<DateTime?>(DateTime.now());
  final endDate = Rx<DateTime?>(DateTime.now());
  final selectedStartDate = RxString('Select Start Date');
  final selectedEndDate = RxString('Select End Date');
  final start_half = RxDouble(1.0);
  final leavedays = RxDouble(0);
  final end_half = RxDouble(1.0);

  pickDate({required bool? start}) async {
    final date = await showDatePicker(
        context: Get.context!,
        initialDate: start! ? DateTime.now() : startDate.value!,
        firstDate: start ? DateTime(1950) : startDate.value!,
        lastDate: DateTime(2050));

    if (date != null) {
      if (start) {
        startDate.value = date;
        selectedStartDate.value = DateFormat.yMMMd().format(date);
      } else {
        endDate.value = date;
        selectedEndDate.value = DateFormat.yMMMd().format(date);
        start_half.value = 1;
        end_half.value = 1;

        differenceDays();
      }
    }
  }

  startHalfSelector() {
    if (startDate.value != endDate.value &&
        selectedStartDate.value == 'Select End Date') {
      if (start_half.value == .5) {
        start_half.value = 1;
      } else if (start_half.value == 1) {
        start_half.value = 1.5;
      } else {
        start_half.value = 1;
      }
    }
    if (start_half.value == .5) {
      start_half.value = 1;
    } else if (start_half.value == 1) {
      start_half.value = 1.5;
    } else {
      if (end_half.value != 1) {
        start_half.value = .5;
      }
      end_half.value = 1;
    }
    differenceDays();
  }

  secondHalfSelector() {
    if (start_half.value == 1.5) {
      if (end_half.value == .5) {
        end_half.value = 1;
      } else if (end_half.value == 1) {
        end_half.value = .5;
      } else {
        end_half.value = .5;
      }
    } else if (start_half.value == .5) {
      start_half.value = 1;
      // if (end_half.value == 1.5) {
      //   end_half.value = 1;
      // } else if (end_half.value == 1) {
      //   end_half.value = 1.5;
      // } else {
      //   end_half.value = 1;
      // }
    } else {
      if (end_half.value == .5) {
        end_half.value = 1;
      } else if (end_half.value == 1) {
        end_half.value = .5;
      } else {
        end_half.value = 1.5;
      }
    }
    differenceDays();
  }

  differenceDays() {
    leavedays.value =
        endDate.value!.difference(startDate.value!).inDays.toDouble() + 1;
    if (start_half == .5 || start_half == 1.5) {
      leavedays - 0.5;
    }
    if (end_half == .5 || end_half == 1.5) {
      leavedays - 0.5;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }
}
