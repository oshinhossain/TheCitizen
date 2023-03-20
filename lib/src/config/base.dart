import 'package:get/get.dart';
import 'package:the_citizen_app/src/controllers/agency_controller.dart';
import 'package:the_citizen_app/src/controllers/assign_task_controller.dart';
import 'package:the_citizen_app/src/controllers/attendance_controller.dart';
import 'package:the_citizen_app/src/controllers/auth_controller.dart';
import 'package:the_citizen_app/src/controllers/content_controller.dart';
import 'package:the_citizen_app/src/controllers/home_page_map_controller.dart';
import 'package:the_citizen_app/src/controllers/location_traces_controller.dart';
import 'package:the_citizen_app/src/controllers/map_view_controller.dart';
import 'package:the_citizen_app/src/controllers/material_controller.dart';
import 'package:the_citizen_app/src/controllers/menu_controller.dart';
import 'package:the_citizen_app/src/controllers/my_report_list_controller.dart';
import 'package:the_citizen_app/src/controllers/my_team_locations_controller.dart';
import 'package:the_citizen_app/src/controllers/rate_shout_closuer_controller.dart';
import 'package:the_citizen_app/src/controllers/req_new_sub_category_controller.dart';
import 'package:the_citizen_app/src/controllers/req_shout_category_and_sub_category_controller.dart';
import 'package:the_citizen_app/src/controllers/request_new_shout_category_controller.dart';
import 'package:the_citizen_app/src/controllers/shout_controller.dart';
import 'package:the_citizen_app/src/controllers/start_task_controller.dart';
import 'package:the_citizen_app/src/controllers/validate_shout_controller.dart';
import 'package:the_citizen_app/src/controllers/validate_identity_controller.dart';

import '../controllers/agency_attendance_dashboard_controller.dart';

import '../controllers/employee_leave_management_controller.dart';

import '../controllers/location_controller.dart';
import '../controllers/my_attendance_dashboard_controller.dart';
import '../controllers/notice_controller.dart';
import '../controllers/profile_update_controller.dart';
import '../controllers/user_controller.dart';

class Base {
  final locationC = Get.put(LocationController());
  final contentC = Get.put(ContentController());
  final authC = Get.put(AuthController());
  final userC = Get.put(UserController());
  final menuC = Get.put(MenuController());
  final mapViewC = Get.put(MapViewController());
  final employeeLeaveManageMentC = Get.put(EmployeeLeaveManageMentController());
  final agencyAttendanceDashboardC = Get.put(AgencyAttendanceDashboardController());
  final materialC = Get.put(MaterialController());
  final shoutC = Get.put(ShoutController());
  final agencyC = Get.put(AgencyController());
  final myAttendanceDashboardC = Get.put(MyAttendanceDashboardController());
  final noticeC = Get.put(NoticeController());
  final attendanceC = Get.put(AttendanceController());
  final updateProfileCreateC = Get.put(ProfileUpdateController());

  // final employeeLeaveApplicationC =
  //     Get.put(EmployeeLeaveManageMentController());

  final myReportsC = Get.put(MyReportListController());
  final mapC = Get.put(HomePageMapController());
  final teamLocationC = Get.put(MyTeamLocationController());
  final locationTraceC = Get.put(LocationTracesController());
  final reqShoutCategoryC = Get.put(RequestNewShoutCategoryController());
  final ValidateIdentityC = Get.put(ValidateIdentityController());
  final reqShoutSubCategoryC = Get.put(RequestNewShoutSubCategoryController());
  final reqShoutCategorySubCategoryC = Get.put(RequestNewShoutCatAndSubCategoryController());
  final rateShoutC = Get.put(RateShoutClosureController());
  final startTaskC = Get.put(StartTaskController());
  final validateShoutC = Get.put(ValidateShoutController());
  final assignTaskC = Get.put(AssignTaskController());
}
