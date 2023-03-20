import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/pages/agency_summary_page.dart';
import 'package:the_citizen_app/src/pages/change_my_password_page.dart';
import 'package:the_citizen_app/src/pages/enroll_my_biometrics_page.dart';
import 'package:the_citizen_app/src/pages/home_page.dart';
import 'package:the_citizen_app/src/pages/location_traces_page.dart';
import 'package:the_citizen_app/src/pages/my_approval_dashboard_page.dart';
import 'package:the_citizen_app/src/pages/my_attendance_dashboard_page.dart';
import 'package:the_citizen_app/src/pages/my_team_location_page.dart';
import 'package:the_citizen_app/src/pages/rate_shout_closure_page.dart';
import 'package:the_citizen_app/src/pages/request_new_shout_category/request_new_category_page.dart';
import 'package:the_citizen_app/src/pages/request_new_shout_subcategory/request_new_shout_subcategory_page.dart';
import 'package:the_citizen_app/src/pages/start_task_page.dart';
import 'package:the_citizen_app/src/pages/transfer_shout_page.dart';
import 'package:the_citizen_app/src/pages/validate_shout_page.dart';
import '../config/app_theme.dart';
import '../helpers/route.dart';
import '../models/left_side_bar_model.dart';
import '../models/right_side_bar_model.dart';
import '../pages/agency_attendance_dashboard_screen.dart';
import '../pages/assign_task_page.dart';
import '../pages/authorize_the_use_of_my_data_page.dart';
import '../pages/home_screen_osm_map.dart';
import '../pages/my_report_list_page.dart';
import '../pages/report_category_page.dart';

import '../pages/service.dart';
import '../pages/shout_assign_to_me_page.dart';
import '../pages/sync_offline_shout.dart';
import '../pages/update_my_profile_page.dart/update_profile_tap_page.dart';
import '../pages/validate_my_Identity/validate_my_identity_page.dart';

class MenuController extends GetxController {
  final globalKey = GlobalKey<ScaffoldState>();

  final rightSidebar = [
    RightSidebar(
      iconPath: 'assets/icons/emergency_call_icon.png',
      title: 'Emergency Call',
      children: [
        RightSidebarChildren(
          title: 'Rescue Call',
        ),
        RightSidebarChildren(
          title: 'Rescue Call Trend',
        ),
        RightSidebarChildren(
          title: 'Monitor Pickup Support',
        ),
        RightSidebarChildren(
          title: 'Escalated to Me',
        ),
      ],
    ),
    RightSidebar(
      iconPath: 'assets/icons/process_shouts_icon.png',
      title: 'Process Shouts',
      children: [
        RightSidebarChildren(
          title: 'Assign Task',
        ),
        RightSidebarChildren(
          title: 'Validate Shouts',
        ),
        RightSidebarChildren(
          title: 'Transfer Shouts',
        ),
        RightSidebarChildren(
          title: 'Start Task',
        ),
        RightSidebarChildren(
          title: 'Query User',
        ),
        RightSidebarChildren(
          title: 'Finish Task',
        ),
        RightSidebarChildren(
          title: 'Rate Shout Closure',
        ),
      ],
    ),
    RightSidebar(
      iconPath: 'assets/icons/my_activities_icon.png',
      title: 'My Activities',
      children: [
        RightSidebarChildren(
          title: 'My Approval Dashboard',
        ),
        RightSidebarChildren(
          title: 'My Activity Summary',
        ),
        RightSidebarChildren(
          title: 'Shouts Assigned To Me',
        ),
        RightSidebarChildren(
          title: 'My Performance Rating',
        ),
      ],
    ),
    RightSidebar(
      title: 'Agency Transactions',
      iconPath: 'assets/icons/transactions_icon.png',
      children: [
        RightSidebarChildren(title: 'Agency Summary'),
        RightSidebarChildren(title: 'Agency Level Shout Trends'),
        RightSidebarChildren(title: 'Agency Top Performers'),
      ],
    ),
    RightSidebar(
      title: 'Request for New Items',
      iconPath: 'assets/icons/add_icon.png',
      children: [
        RightSidebarChildren(title: 'Request New Shout Category'),
        RightSidebarChildren(title: 'Request New Shout SubCategory'),
      ],
    ),
  ];

  final leftSidebar = [
    LeftSidebar(
      title: 'My Personal Data',
      iconPath: 'assets/icons/my_personal_data_icon.png',
      children: [
        LeftSidebarChildren(title: 'Update My Profile'),
        LeftSidebarChildren(title: 'Validate My Identity'),
        LeftSidebarChildren(title: 'Enroll My Biometrics'),
        LeftSidebarChildren(title: 'Authorize the Use of My Data'),
        LeftSidebarChildren(title: 'Change My Password'),
        LeftSidebarChildren(title: 'My Attendance Dashboard'),
      ],
    ),
    LeftSidebar(
      title: 'Manage Agency',
      iconPath: 'assets/icons/manage_agency_icon.png',
      children: [
        LeftSidebarChildren(title: 'My Team Locations'),
        LeftSidebarChildren(title: 'My Team'),
        LeftSidebarChildren(title: 'Attendance Dashboard'),
        LeftSidebarChildren(title: 'Location Traces'),
      ],
    ),
    LeftSidebar(
      title: 'User Feedback',
      iconPath: 'assets/icons/user_feedback_icon.png',
      children: [
        LeftSidebarChildren(title: 'UI Feedback'),
        LeftSidebarChildren(title: 'Overall Service Quality Feedback'),
        LeftSidebarChildren(title: 'User Complaints'),
      ],
    ),
    LeftSidebar(
      title: 'App Settings',
      iconPath: 'assets/icons/app_settings_icon.png',
      children: [
        LeftSidebarChildren(title: 'App Settings'),
        LeftSidebarChildren(title: 'Update App Configurations'),
      ],
    ),
  ];

  final currentIndex = RxInt(2);
  final isHomeActive = RxBool(true);

  set setCurrentIndex(String item) => currentIndex.value = getMenuIndex(item);

  Widget getCurrentPage() {
    switch (currentIndex.value) {
      case 0:
        return ReportCategoryPage();
      case 1:
        return SyncOfflineShout();
      case 2:
        return HomePage();
      case 3:
        return HomeScreenOsmMap();
      case 4:
        return MyReportListPage();
      //  return RequestNewShoutSubCategoryPage();

      case 5:
        return ServicePage();
      default:
        return Center(child: KText(text: 'page 6'));
    }
  }

  final bottomMenus = ['bottom_shout_icon.png', 'bottom_sync_icon.png', 'bottom_3.svg', 'bottom_4.svg', 'bottom_5.svg'];

  final appbarMenus = ['top_1.svg', 'top_2.svg', 'top_3.svg', 'top_4.svg', 'top_5.svg'];

  int getMenuIndex(String item) {
    return bottomMenus.indexOf(item);
  }

  void pushLeftMenu(String title) {
    switch (title) {
      case 'Update My Profile':
        back();
        return push(UpdateMyProfile());

      case 'Validate My Identity':
        back();
        return push(ValidateMyIdentityPage());

      case 'Enroll My Biometrics':
        back();
        return push(EnrollMyBiometricsPage());

      case 'Authorize the Use of My Data':
        back();
        return push(AuthorizeTheUseOfMyDataPage());

      case 'Change My Password':
        back();
        return push(ChangeMyPasswordPage());

      case 'My Attendance Dashboard':
        back();
        return push(MyAttendanceDashboardPage());

      case 'UI Feedback':
        back();
        return push(ValidateMyIdentityPage());
      case 'Attendance Dashboard':
        back();
        return push(AgencyAttendanceDashboardScreen());
      case 'My Team Locations':
        back();
        return push(MyTeamLocationPage());
      case 'Location Traces':
        back();
        return push(LocationTracesPage());
      // case '':
      //   back();
      //   return push(());
      default:
        {
          Get.snackbar(
            'Attention!!',
            'Development in progress',
            colorText: AppTheme.black,
            backgroundColor: AppTheme.appHomePageColor,
            snackPosition: SnackPosition.BOTTOM,
            maxWidth: 190,
          );
          //statements;
        }
    }
  }

  void pushRightMenu(String title) {
    switch (title) {
      case 'Request New Shout Category':
        back();
        return push(RequestNewShoutCategoryPage());

      case 'Request New Shout SubCategory':
        back();
        return push(RequestNewShoutSubCategoryPage());

      case 'Agency Summary':
        back();
        return push(AgencySummaryPage());

      case 'My Approval Dashboard':
        back();
        return push(MyApprovalDashboardPage());

      case 'Assign Task':
        back();
        return push(AssignTaskPage());
      case 'Validate Shouts':
        back();
        return push(ValidateShoutsPage());
      case 'Transfer Shouts':
        back();
        return push(TransferShoutPage());
      case 'Start Task':
        back();
        return push(StartTaskPage());

      case 'Shouts Assigned To Me':
        back();
        return push(ShoutAssignToMePage());
      case 'Rate Shout Closure':
        back();
        return push(RateShoutClosurePage());

      default:
        {
          Get.snackbar(
            'Attention!!',
            'Development in progress',
            colorText: AppTheme.black,
            backgroundColor: AppTheme.appHomePageColor,
            snackPosition: SnackPosition.BOTTOM,
            maxWidth: 190,
          );
          // showToast('Still not activated',
          //     duration: Toast.lengthLong, gravity: 0);

          //statements;
        }
    }
  }
}
