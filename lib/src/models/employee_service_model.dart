import 'package:the_citizen_app/src/pages/attendance_page.dart';

import '../pages/employee_leave_application_page.dart';

class EmployeeServiceList {
  // final Function? onTap;
  final String? themeColor;
  final String? imagePath;
  final String? titleText;
  final List<EmployeeServiceListItem> listItem;

  EmployeeServiceList({
    // required this.onTap,
    required this.themeColor,
    required this.imagePath,
    required this.titleText,
    required this.listItem,
  });
  static final timemanagement = [
    AttendancePage(),
    EmployeeLeaveApplicationpPage()
  ];
  static final employeeServiceList = [
    EmployeeServiceList(
      // onTap: onTap,
      themeColor: '2F8F9D',
      imagePath: 'assets/images/time_management.png',
      titleText: 'Time Management',
      listItem: [
        EmployeeServiceListItem(
          onTap: () {},
          themeColor: '97C4B8',
          imagePath: 'assets/images/attendance.png',
          titleText: 'Employee Attendance',
        ),
        EmployeeServiceListItem(
          onTap: () {},
          themeColor: '97C4B8',
          imagePath: 'assets/images/leave_application.png',
          titleText: 'Employee Leave Application',
        ),
      ],
    ),
    EmployeeServiceList(
      // onTap: onTap,
      themeColor: '2F8F9D',
      imagePath: 'assets/images/travelling.png',
      titleText: 'Traveling',
      listItem: [
        EmployeeServiceListItem(
          onTap: () {},
          themeColor: '8D8DAA',
          imagePath: 'assets/images/travel_requisition.png',
          titleText: 'Travel Requisition',
        ),
        EmployeeServiceListItem(
          onTap: () {},
          themeColor: '8D8DAA',
          imagePath: 'assets/images/vehicle_requisition.png',
          titleText: 'Vehicle Requisition',
        ),
        EmployeeServiceListItem(
          onTap: () {},
          themeColor: '8D8DAA',
          imagePath: 'assets/images/repair_requisition.png',
          titleText: 'Repair Requisition',
        ),
      ],
    ),
    EmployeeServiceList(
      // onTap: onTap,
      themeColor: '2F8F9D',
      imagePath: 'assets/images/expenses.png',
      titleText: 'Expenses',
      listItem: [
        EmployeeServiceListItem(
          onTap: () {},
          themeColor: '789395',
          imagePath: 'assets/images/advance_application.png',
          titleText: 'Advance Application',
        ),
        EmployeeServiceListItem(
          onTap: () {},
          themeColor: '789395',
          imagePath: 'assets/images/reimbursement_claim.png',
          titleText: 'Reimbursement Claim',
        ),
      ],
    ),
    EmployeeServiceList(
      // onTap: onTap,
      themeColor: '2F8F9D',
      imagePath: 'assets/images/loan_application.png',
      titleText: 'Loan Management',
      listItem: [
        EmployeeServiceListItem(
          onTap: () {},
          themeColor: '789395',
          imagePath: 'assets/images/loan_application.png',
          titleText: 'Loan Application',
        ),
      ],
    ),
  ];
}

class EmployeeServiceListItem {
  final Function? onTap;
  final String? themeColor;
  final String? imagePath;
  late final String? titleText;

  EmployeeServiceListItem({
    required this.onTap,
    required this.themeColor,
    required this.imagePath,
    required this.titleText,
  });
}
