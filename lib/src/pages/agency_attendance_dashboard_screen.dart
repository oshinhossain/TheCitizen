import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import 'dart:math';
import '../config/base.dart';
import '../models/get_employees_by_attendance_model.dart';

class AgencyAttendanceDashboardScreen extends StatefulWidget {
  @override
  State<AgencyAttendanceDashboardScreen> createState() =>
      _AgencyAttendanceDashboardScreenState();
}

class _AgencyAttendanceDashboardScreenState
    extends State<AgencyAttendanceDashboardScreen> with Base {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (agencyAttendanceDashboardC.selectedDate.value != '') {
      agencyAttendanceDashboardC.getAgencyattendanceSummary(isfirst: false);
    } else {
      agencyAttendanceDashboardC.getAgencyattendanceSummary(isfirst: true);
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: hexToColor('#EFF6FF'),
        iconTheme: IconThemeData(
          color: AppTheme.newAppBarTextColor,
        ),
        title: Text(
          "${'Attendance Dashboard'}",
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 18.0,
            color: AppTheme.textColor15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: hexToColor('#FFFFFF'),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                  flex: 0,
                  child: AttendanceDateSelector(
                    i: 0,
                  )),
              SizedBox(
                height: 10,
              ),
              Expanded(flex: 1, child: AttendanceDashboardGridView()),
            ],
          ),
        ),
      ),
    );
  }
}

class AttendanceDateSelector extends StatelessWidget with Base {
  int i;
  AttendanceDateSelector({required this.i});
  final myDateFormat = new DateFormat('dd-MMM-yyyy'); // Show for user.

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            children: [
              Expanded(flex: 1, child: KText(text: 'Location:')),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          //isCollapsed: true,
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                    Container(
                      height: .5,
                      width: Get.width * .7,
                      color: hexToColor('#A3CCDC'),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 13.0),
                child: KText(text: 'Date:'),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppTheme.textColor1),
                  shadowColor:
                      MaterialStateProperty.all<Color>(AppTheme.appBarColor),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    KText(
                        text:
                            agencyAttendanceDashboardC.selectedDate.value != ''
                                ? agencyAttendanceDashboardC.showDate(
                                    agencyAttendanceDashboardC
                                        .selectedShowDate.value!)
                                : agencyAttendanceDashboardC
                                    .showDate(DateTime.now())),
                    SizedBox(
                      width: 10.0,
                    ),
                    Visibility(
                      visible: i == 0,
                      child: Icon(
                        Icons.date_range_outlined,
                        size: 20.0,
                        color: AppTheme.textColor9,
                      ),
                    ),
                  ],
                ),
                onPressed: i != 0
                    ? () {}
                    : () async {
                        await agencyAttendanceDashboardC.pickDate();
                      },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AttendanceDashboardGridView extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Obx(
          () => DateFormat('yyyy-MM-dd').format(DateTime.now()) !=
                  agencyAttendanceDashboardC.selectedDate.value
              ? GridView(
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement(
                          itemCount: 7,
                          crossAxisCount:
                              (orientation == Orientation.portrait) ? 2 : 7),
                  //childAspectRatio: 4 / 3,
                  physics: BouncingScrollPhysics(),
                  //crossAxisCount: (orientation == Orientation.portrait) ? 2 : 7,
                  children: [
                    createAttendanceGridItem(
                      onTap: () async {
                        await agencyAttendanceDashboardC
                            .getattendancehistorydetails(attStatus: 'present');
                        push(AttendanceDetailsPage1(
                          historyList:
                              agencyAttendanceDashboardC.presentTodayList,
                          title: 'Present Details',
                        ));
                      },
                      index: 1,
                      cardThemeColor: '#E9FAF4',
                      iconThemeColor: '#434969',
                      imagePath: 'assets/svg/present_today.svg',
                      titleText: agencyAttendanceDashboardC
                                  .agencyattendanceSummary.value !=
                              null
                          ? agencyAttendanceDashboardC
                              .agencyattendanceSummary.value!.presentEmpCounter!
                              .toString()
                          : '0',
                      // '${state.dailyAttendanceStatusMadel != null ? state.dailyAttendanceStatusMadel.presentEmpCounter.toString() : 0}',
                      subTitleText: 'Present Today',
                    ),
                    createAttendanceGridItem(
                      onTap: () async {
                        await agencyAttendanceDashboardC
                            .getattendancehistorydetails(attStatus: 'ontime');
                        push(AttendanceDetailsPage1(
                          historyList: agencyAttendanceDashboardC.ontimeList,
                          title: 'Present Now',
                        ));
                      },
                      index: 3,
                      cardThemeColor: '#E9EAFA',
                      iconThemeColor: '#434969',
                      imagePath: 'assets/svg/Ontime_icon.svg',
                      titleText: agencyAttendanceDashboardC
                                  .agencyattendanceSummary.value !=
                              null
                          ? agencyAttendanceDashboardC
                              .agencyattendanceSummary.value!.onTimeEmpCounter!
                              .toString()
                          : '0',
                      //'${state.dailyAttendanceStatusMadel != null ? state.dailyAttendanceStatusMadel.onTimeEmpCounter.toString() : 0}',
                      subTitleText: 'On Time Office',
                    ),
                    createAttendanceGridItem(
                      onTap: () async {
                        await agencyAttendanceDashboardC
                            .getattendancehistorydetails(attStatus: 'late');
                        push(AttendanceDetailsPage1(
                          historyList: agencyAttendanceDashboardC.lateList,
                          title: 'Late',
                        ));
                      },
                      index: 4,
                      iconThemeColor: '#F9F2D2',
                      cardThemeColor: '#F9F2D2',
                      imagePath: 'assets/svg/late icon.svg',
                      titleText: agencyAttendanceDashboardC
                                  .agencyattendanceSummary.value !=
                              null
                          ? agencyAttendanceDashboardC
                              .agencyattendanceSummary.value!.lateEmpCounter!
                              .toString()
                          : '0',
                      // '${state.dailyAttendanceStatusMadel != null ? state.dailyAttendanceStatusMadel.lateEmpCounter.toString() : 0}',
                      subTitleText: 'Late',
                    ),
                    createAttendanceGridItem(
                      onTap: () async {
                        await agencyAttendanceDashboardC
                            .getattendancehistorydetails(attStatus: 'verylate');
                        push(AttendanceDetailsPage1(
                          historyList: agencyAttendanceDashboardC.veryLateList,
                          title: 'Very Late Details',
                        ));
                      },
                      index: 5,
                      iconThemeColor: '#F9DED2',
                      cardThemeColor: '#F9DED2',
                      imagePath: 'assets/svg/very_late_icon.svg',
                      titleText: agencyAttendanceDashboardC
                                  .agencyattendanceSummary.value !=
                              null
                          ? agencyAttendanceDashboardC
                              .agencyattendanceSummary.value!.lateEmpCounter!
                              .toString()
                          : '0',
                      // '${state.dailyAttendanceStatusMadel != null ? state.dailyAttendanceStatusMadel.onLeaveEmpCounter.toString() : 0}',
                      subTitleText: 'Very Late',
                    ),
                    createAttendanceGridItem(
                      onTap: () async {
                        await agencyAttendanceDashboardC
                            .getattendancehistorydetails(attStatus: 'leave');
                        push(AttendanceDetailsPage1(
                          historyList: agencyAttendanceDashboardC.leaveList,
                          title: 'Leave Details',
                        ));
                      },
                      index: 5,
                      iconThemeColor: 'E1E7E9',
                      cardThemeColor: '#E1E7E9',
                      imagePath: 'assets/svg/Leave 2 icon.svg',
                      titleText: agencyAttendanceDashboardC
                                  .agencyattendanceSummary.value !=
                              null
                          ? agencyAttendanceDashboardC
                              .agencyattendanceSummary.value!.onLeaveEmpCounter!
                              .toString()
                          : '0',
                      // '${state.dailyAttendanceStatusMadel != null ? state.dailyAttendanceStatusMadel.onLeaveEmpCounter.toString() : 0}',
                      subTitleText: 'On Leave',
                    ),
                    createAttendanceGridItem(
                      onTap: () async {
                        await agencyAttendanceDashboardC
                            .getattendancehistorydetails(attStatus: 'absent');
                        push(AttendanceDetailsPage1(
                          historyList: agencyAttendanceDashboardC.absentList,
                          title: 'Leave Details',
                        ));
                      },
                      index: 6,
                      cardThemeColor: '#FBDAE5',
                      iconThemeColor: '#434969',
                      imagePath: 'assets/svg/absent icon.svg',
                      titleText: agencyAttendanceDashboardC
                                  .agencyattendanceSummary.value !=
                              null
                          ? agencyAttendanceDashboardC
                              .agencyattendanceSummary.value!.absentEmpCounter!
                              .toString()
                          : '0',
                      // '${state.dailyAttendanceStatusMadel != null ? state.dailyAttendanceStatusMadel.absentEmpCounter.toString() : 0}',
                      subTitleText: 'Absent',
                    ),
                    createAttendanceGridItem(
                      onTap: () {},
                      index: 6,
                      cardThemeColor: '#F1F1F1',
                      iconThemeColor: '#434969',
                      imagePath: 'assets/svg/people_icon.svg',
                      titleText: '',
                      // '${state.dailyAttendanceStatusMadel != null ? state.dailyAttendanceStatusMadel.absentEmpCounter.toString() : 0}',
                      subTitleText: 'Total People',
                    ),
                  ],
                )
              : GridView.count(
                  childAspectRatio: 4 / 3,
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: (orientation == Orientation.portrait) ? 2 : 7,
                  children: [
                    createAttendanceGridItem(
                      onTap: () async {
                        await agencyAttendanceDashboardC
                            .getattendancehistorydetails(attStatus: 'present');
                        push(AttendanceDetailsPage1(
                          historyList:
                              agencyAttendanceDashboardC.presentTodayList,
                          title: 'Present Details',
                        ));
                      },
                      index: 1,
                      cardThemeColor: '#E9FAF4',
                      iconThemeColor: '#434969',
                      imagePath: 'assets/svg/present_today.svg',
                      titleText: agencyAttendanceDashboardC
                                  .agencyattendanceSummary.value !=
                              null
                          ? agencyAttendanceDashboardC
                              .agencyattendanceSummary.value!.presentEmpCounter!
                              .toString()
                          : '0',
                      // '${state.dailyAttendanceStatusMadel != null ? state.dailyAttendanceStatusMadel.presentEmpCounter.toString() : 0}',
                      subTitleText: 'Present Today',
                    ),
                    createAttendanceGridItem(
                      onTap: () async {
                        await agencyAttendanceDashboardC
                            .getattendancehistorydetails(
                                attStatus: 'presentnow');
                        push(AttendanceDetailsPage1(
                          historyList:
                              agencyAttendanceDashboardC.presenNowtList,
                          title: 'Present Now',
                        ));
                      },
                      index: 2,
                      cardThemeColor: '#D2F9F9',
                      iconThemeColor: '#434969',
                      imagePath: 'assets/svg/Present icon.svg',
                      titleText: agencyAttendanceDashboardC
                                  .agencyattendanceSummary.value !=
                              null
                          ? agencyAttendanceDashboardC.agencyattendanceSummary
                              .value!.presentNowEmpCounter!
                              .toString()
                          : '0',
                      // '${state.dailyAttendanceStatusMadel != null ? state.dailyAttendanceStatusMadel.presentNowEmpCounter.toString() : 0}',
                      subTitleText: 'Present Now',
                    ),
                    createAttendanceGridItem(
                      onTap: () async {
                        await agencyAttendanceDashboardC
                            .getattendancehistorydetails(attStatus: 'ontime');
                        push(AttendanceDetailsPage1(
                          historyList: agencyAttendanceDashboardC.ontimeList,
                          title: 'Present Now',
                        ));
                      },
                      index: 3,
                      cardThemeColor: '#E9EAFA',
                      iconThemeColor: '#434969',
                      imagePath: 'assets/svg/Ontime_icon.svg',
                      titleText: agencyAttendanceDashboardC
                                  .agencyattendanceSummary.value !=
                              null
                          ? agencyAttendanceDashboardC
                              .agencyattendanceSummary.value!.onTimeEmpCounter!
                              .toString()
                          : '0',
                      //'${state.dailyAttendanceStatusMadel != null ? state.dailyAttendanceStatusMadel.onTimeEmpCounter.toString() : 0}',
                      subTitleText: 'On Time Office',
                    ),
                    createAttendanceGridItem(
                      onTap: () async {
                        await agencyAttendanceDashboardC
                            .getattendancehistorydetails(attStatus: 'late');
                        push(AttendanceDetailsPage1(
                          historyList: agencyAttendanceDashboardC.lateList,
                          title: 'Late',
                        ));
                      },
                      index: 4,
                      iconThemeColor: '#F9F2D2',
                      cardThemeColor: '#F9F2D2',
                      imagePath: 'assets/svg/late icon.svg',
                      titleText: agencyAttendanceDashboardC
                                  .agencyattendanceSummary.value !=
                              null
                          ? agencyAttendanceDashboardC
                              .agencyattendanceSummary.value!.lateEmpCounter!
                              .toString()
                          : '0',
                      // '${state.dailyAttendanceStatusMadel != null ? state.dailyAttendanceStatusMadel.lateEmpCounter.toString() : 0}',
                      subTitleText: 'Late',
                    ),
                    createAttendanceGridItem(
                      onTap: () async {
                        await agencyAttendanceDashboardC
                            .getattendancehistorydetails(attStatus: 'verylate');
                        push(AttendanceDetailsPage1(
                          historyList: agencyAttendanceDashboardC.veryLateList,
                          title: 'Very Late Details',
                        ));
                      },
                      index: 5,
                      iconThemeColor: '#F9DED2',
                      cardThemeColor: '#F9DED2',
                      imagePath: 'assets/svg/very_late_icon.svg',
                      titleText: agencyAttendanceDashboardC
                                  .agencyattendanceSummary.value !=
                              null
                          ? agencyAttendanceDashboardC
                              .agencyattendanceSummary.value!.lateEmpCounter!
                              .toString()
                          : '0',
                      // '${state.dailyAttendanceStatusMadel != null ? state.dailyAttendanceStatusMadel.onLeaveEmpCounter.toString() : 0}',
                      subTitleText: 'Very Late',
                    ),
                    createAttendanceGridItem(
                      onTap: () async {
                        await agencyAttendanceDashboardC
                            .getattendancehistorydetails(attStatus: 'leave');
                        push(AttendanceDetailsPage1(
                          historyList: agencyAttendanceDashboardC.leaveList,
                          title: 'Leave Details',
                        ));
                      },
                      index: 5,
                      iconThemeColor: 'E1E7E9',
                      cardThemeColor: '#E1E7E9',
                      imagePath: 'assets/svg/Leave 2 icon.svg',
                      titleText: agencyAttendanceDashboardC
                                  .agencyattendanceSummary.value !=
                              null
                          ? agencyAttendanceDashboardC
                              .agencyattendanceSummary.value!.onLeaveEmpCounter!
                              .toString()
                          : '0',
                      // '${state.dailyAttendanceStatusMadel != null ? state.dailyAttendanceStatusMadel.onLeaveEmpCounter.toString() : 0}',
                      subTitleText: 'On Leave',
                    ),
                    createAttendanceGridItem(
                      onTap: () async {
                        await agencyAttendanceDashboardC
                            .getattendancehistorydetails(attStatus: 'absent');
                        push(AttendanceDetailsPage1(
                          historyList: agencyAttendanceDashboardC.absentList,
                          title: 'Leave Details',
                        ));
                      },
                      index: 6,
                      cardThemeColor: '#FBDAE5',
                      iconThemeColor: '#434969',
                      imagePath: 'assets/svg/absent icon.svg',
                      titleText: agencyAttendanceDashboardC
                                  .agencyattendanceSummary.value !=
                              null
                          ? agencyAttendanceDashboardC
                              .agencyattendanceSummary.value!.absentEmpCounter!
                              .toString()
                          : '0',
                      // '${state.dailyAttendanceStatusMadel != null ? state.dailyAttendanceStatusMadel.absentEmpCounter.toString() : 0}',
                      subTitleText: 'Absent',
                    ),
                    createAttendanceGridItem(
                      onTap: () {},
                      index: 6,
                      cardThemeColor: '#F1F1F1',
                      iconThemeColor: '#434969',
                      imagePath: 'assets/svg/people_icon.svg',
                      titleText: '',
                      // '${state.dailyAttendanceStatusMadel != null ? state.dailyAttendanceStatusMadel.absentEmpCounter.toString() : 0}',
                      subTitleText: 'Total People',
                    ),
                  ],
                ),
        );
      },
    );
  }
}

Widget createAttendanceGridItem(
    {required int index,
    required String iconThemeColor,
    required String cardThemeColor,
    required String imagePath,
    required String titleText,
    required String subTitleText,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: hexToColor(cardThemeColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 0, bottom: 0, top: 0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.only(
                        bottom: 15, left: 15, top: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      color: AppTheme.textColor36.withOpacity(0.4),
                    ),
                    child: SvgPicture.asset(imagePath),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      titleText,
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 20.0,
                        color: AppTheme.textColor6,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          subTitleText,
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 16.0,
                            color: AppTheme.textColor6,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.arrow_forward_outlined,
                            size: 20, color: AppTheme.textColor5),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class AttendanceDetailsPage1 extends StatelessWidget with Base {
  String? title;
  List<GetEmployeesByAttendanceModel> historyList;
  AttendanceDetailsPage1({required this.title, required this.historyList});
  //: super(key: key);

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppTheme.backgroundColor,
          title: Text(
            title!,
            style: TextStyle(
              color: AppTheme.textColor6,
              fontFamily: 'Manrope',
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          iconTheme: IconThemeData(
            color: AppTheme.textColor6,
          ),
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: AttendanceDateSelector(
                      i: 1,
                    )),

                Expanded(
                  flex: 5,
                  child: SizedBox(
                    // height: Get.height * 0.65,
                    child: historyList.isEmpty
                        ? Container(
                            alignment: Alignment.center,
                            height: Get.height * 0.73,
                            child: KText(bold: true, text: 'No Record Found'),
                          )
                        : ListView(
                            shrinkWrap: true,
                            children: historyList
                                .map(
                                  (e) => Padding(
                                    padding: EdgeInsets.only(
                                        right: 10,
                                        top: 15,
                                        bottom: 10,
                                        left: 4),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 15,
                                      ),
                                      width: Get.width - 80,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 10.0,
                                            color: Colors.black12,
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              KText(
                                                text: e.username,
                                                fontSize: 16,
                                                bold: true,
                                                maxLines: 2,
                                                textOverflow:
                                                    TextOverflow.visible,
                                              ),
                                              KText(
                                                text: e.isAbsent!
                                                    ? 'Absent'
                                                    : e.isVeryLate!
                                                        ? 'Very Late'
                                                        : e.isLate!
                                                            ? 'Late'
                                                            : 'In',
                                                fontSize: 16,
                                                bold: true,
                                                maxLines: 2,
                                                color: e.isAbsent!
                                                    ? Colors.amber
                                                    : e.isVeryLate!
                                                        ? Colors.red
                                                        : e.isLate!
                                                            ? Colors.red
                                                            : Colors.green,
                                                textOverflow:
                                                    TextOverflow.visible,
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: Colors.black26,
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: KText(
                                              text: e.email,
                                              bold: true,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: KText(
                                              text: e.mobile,
                                              bold: true,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.black26,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              KText(text: 'In Time'),
                                              KText(
                                                text: agencyAttendanceDashboardC
                                                    .formatTime(
                                                        time: e.inTime!),
                                                bold: true,
                                              )
                                            ],
                                          ),
                                          Divider(
                                            color: Colors.black26,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              KText(text: 'Out -Time'),
                                              e.outTime != null
                                                  ? KText(
                                                      text:
                                                          agencyAttendanceDashboardC
                                                              .formatTime(
                                                                  time: e
                                                                      .outTime!),
                                                      bold: true,
                                                    )
                                                  : KText(
                                                      text: 'N/A',
                                                      bold: true,
                                                    )
                                            ],
                                          ),
                                          Divider(
                                            color: Colors.black26,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              KText(text: 'Working Hours'),
                                              KText(
                                                text: Duration(
                                                        seconds: int.parse(e
                                                            .effectiveHoursText!))
                                                    .toString()
                                                    .split('.')[0],
                                                bold: true,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 9,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 0,
                                                    vertical: 5,
                                                  ),
                                                  child: LinearPercentIndicator(
                                                      percent: agencyAttendanceDashboardC.calculateEffectiveTime(time: (Duration(seconds: int.parse(e.effectiveHoursText!)).toString().split('.')[0]).toString()) > 1
                                                          ? 1
                                                          : agencyAttendanceDashboardC
                                                              .calculateEffectiveTime(
                                                                  time: (Duration(seconds: int.parse(e.effectiveHoursText!)).toString().split('.')[0])
                                                                      .toString()),
                                                      barRadius:
                                                          Radius.circular(10),
                                                      animation: true,
                                                      lineHeight: 8.0,
                                                      animationDuration: 5000,
                                                      progressColor: agencyAttendanceDashboardC.colorFix(
                                                          effTime: agencyAttendanceDashboardC.calculateEffectiveTime(
                                                              time: (Duration(
                                                                          seconds: int.parse(e.effectiveHoursText!))
                                                                      .toString()
                                                                      .split('.')[0])
                                                                  .toString()))),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: KText(
                                                  bold: true,
                                                  text: (agencyAttendanceDashboardC.calculateEffectiveTime(
                                                                  time: (Duration(seconds: int.parse(e.effectiveHoursText!))
                                                                          .toString()
                                                                          .split(
                                                                              '.')[0])
                                                                      .toString()) *
                                                              100)
                                                          .toStringAsFixed(2) +
                                                      ' %',
                                                  fontSize: 12,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                .toList()),
                  ),
                )

                // DataTable(
                //   showCheckboxColumn: false,
                //   horizontalMargin: 2,
                //   dividerThickness: 1,
                //   showBottomBorder: true,
                //   headingRowHeight: 54,
                //   //dataRowHeight: 45,
                //   headingRowColor: MaterialStateColor.resolveWith(
                //       (states) => AppTheme.textColor16),
                //   headingTextStyle: TextStyle(
                //     fontFamily: 'Manrope',
                //     fontSize: 14.0,
                //     color: AppTheme.textColor15,
                //     fontWeight: FontWeight.w700,
                //   ),
                //   decoration: BoxDecoration(
                //     border: Border(
                //         bottom: BorderSide(
                //             width: 1.0, color: AppTheme.textColor39)),
                //   ),
                //   columns:

                //   [
                //     DataColumn(
                //       label: Padding(
                //         padding: const EdgeInsets.only(left: 10.0),
                //         child: Text(
                //           'Date',
                //           style: TextStyle(
                //             fontFamily: 'Manrope',
                //             fontSize: 14.0,
                //             color: AppTheme.textColor15,
                //             fontWeight: FontWeight.w700,
                //           ),
                //         ),
                //       ),
                //     ),
                //     DataColumn(
                //       label: Text(
                //         'In Time',
                //         style: TextStyle(
                //           fontFamily: 'Manrope',
                //           fontSize: 14.0,
                //           color: AppTheme.textColor15,
                //           fontWeight: FontWeight.w700,
                //         ),
                //       ),
                //     ),
                //     DataColumn(
                //       label: Text(
                //         'Out Time',
                //         style: TextStyle(
                //           fontFamily: 'Manrope',
                //           fontSize: 14.0,
                //           color: AppTheme.textColor15,
                //           fontWeight: FontWeight.w700,
                //         ),
                //       ),
                //       numeric: false,
                //     ),
                //     DataColumn(
                //       label: Padding(
                //         padding: EdgeInsets.only(right: 10.0),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(
                //               'Total Effective',
                //               style: TextStyle(
                //                 fontFamily: 'Manrope',
                //                 fontSize: 14.0,
                //                 color: AppTheme.textColor15,
                //                 fontWeight: FontWeight.w700,
                //               ),
                //             ),
                //             Text(
                //               'Hours',
                //               style: TextStyle(
                //                 fontFamily: 'Manrope',
                //                 fontSize: 14.0,
                //                 color: AppTheme.textColor15,
                //                 fontWeight: FontWeight.w700,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       numeric: false,
                //     ),
                //   ],
                //   rows: historyList.map((element) {
                //     return

                //     DataRow(
                //       cells: <DataCell>[
                //         DataCell(
                //           Padding(
                //             padding: EdgeInsets.only(left: 10.0),
                //             child: Text(
                //               element.attDate!,
                //               // "${presentBalance.attDate != null ? Utility.formatDate(Utility.convertStringSQLToDate
                //               //   (presentBalance.attDate)) : ""}",
                //               style: TextStyle(
                //                 fontFamily: 'Manrope',
                //                 fontSize: 12.0,
                //                 color: AppTheme.textColor42,
                //                 fontWeight: FontWeight.w400,
                //               ),
                //             ),
                //           ),
                //         ),
                //         DataCell(
                //           Align(
                //             child: Text(
                //               agencyAttendanceDashboardC.formatTime(
                //                   time: element.inTime!),
                //               // element.inTime!,

                //               // Utility.isEmptyString(presentBalance.inTime)
                //               //     ? ''
                //               //     : Utility.convertTime24To12(presentBalance.inTime),
                //               style: TextStyle(
                //                 fontFamily: 'Manrope',
                //                 fontSize: 12.0,
                //                 color: AppTheme.textColor42,
                //                 fontWeight: FontWeight.w400,
                //               ),
                //             ),
                //             alignment: Alignment.centerLeft,
                //           ),
                //         ),
                //         DataCell(
                //           Align(
                //             child: element.outTime != null
                //                 ? KText(
                //                     text: agencyAttendanceDashboardC
                //                         .formatTime(time: element.outTime!),
                //                   )
                //                 : KText(text: 'N/A'),
                //             alignment: Alignment.center,
                //           ),
                //         ),
                //         DataCell(
                //           Align(
                //             child: element.effectiveHoursText != '0'
                //                 ? KText(
                //                     text: Duration(
                //                                 seconds: int.parse(element
                //                                     .effectiveHoursText!))
                //                             .toString()
                //                             .split(':')[0] +
                //                         ':' +
                //                         Duration(seconds: int.parse(element.effectiveHoursText!))
                //                             .toString()
                //                             .split(':')[1] +
                //                         ':' +
                //                         double.parse(Duration(
                //                                     seconds:
                //                                         int.parse(element.effectiveHoursText!))
                //                                 .toString()
                //                                 .split(':')[2])
                //                             .toInt()
                //                             .toString())
                //                 : KText(text: element.effectiveHoursText),
                //             alignment: Alignment.center,
                //           ),
                //         ),
                //       ],
                //     );

                //   }).toList(),
                //   //      Align(
                //   // alignment: Alignment.topCenter, child: CenteredMessage(message: "No data found", icon: Icons.edit)),
                // ),
              ],
            ),
          ),
        ));
  }
}

class SliverGridWithCustomGeometryLayout extends SliverGridRegularTileLayout {
  /// The builder for each child geometry.
  final SliverGridGeometry Function(
    int index,
    SliverGridRegularTileLayout layout,
  ) geometryBuilder;

  SliverGridWithCustomGeometryLayout({
    required this.geometryBuilder,
    required int crossAxisCount,
    required double mainAxisStride,
    required double crossAxisStride,
    required double childMainAxisExtent,
    required double childCrossAxisExtent,
    required bool reverseCrossAxis,
  })  : assert(geometryBuilder != null),
        assert(crossAxisCount != null && crossAxisCount > 0),
        assert(mainAxisStride != null && mainAxisStride >= 0),
        assert(crossAxisStride != null && crossAxisStride >= 0),
        assert(childMainAxisExtent != null && childMainAxisExtent >= 0),
        assert(childCrossAxisExtent != null && childCrossAxisExtent >= 0),
        assert(reverseCrossAxis != null),
        super(
          crossAxisCount: crossAxisCount,
          mainAxisStride: mainAxisStride,
          crossAxisStride: crossAxisStride,
          childMainAxisExtent: childMainAxisExtent,
          childCrossAxisExtent: childCrossAxisExtent,
          reverseCrossAxis: reverseCrossAxis,
        );

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    return geometryBuilder(index, this);
  }
}

/// Creates grid layouts with a fixed number of tiles in the cross axis, such
/// that fhe last element, if the grid item count is odd, is centralized.
class SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement
    extends SliverGridDelegateWithFixedCrossAxisCount {
  /// The total number of itens in the layout.
  final int itemCount;

  SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement({
    required this.itemCount,
    required int crossAxisCount,
    double mainAxisSpacing = 0.0,
    double crossAxisSpacing = 0.0,
    double childAspectRatio = 1.0,
  })  : assert(itemCount != null && itemCount > 0),
        assert(crossAxisCount != null && crossAxisCount > 0),
        assert(mainAxisSpacing != null && mainAxisSpacing >= 0),
        assert(crossAxisSpacing != null && crossAxisSpacing >= 0),
        assert(childAspectRatio != null && childAspectRatio > 0),
        super(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
        );

  bool _debugAssertIsValid() {
    assert(crossAxisCount > 0);
    assert(mainAxisSpacing >= 0.0);
    assert(crossAxisSpacing >= 0.0);
    assert(childAspectRatio > 0.0);
    return true;
  }

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    assert(_debugAssertIsValid());
    final usableCrossAxisExtent = max(
      0.0,
      constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1),
    );
    final childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    final childMainAxisExtent = childCrossAxisExtent / childAspectRatio;
    return SliverGridWithCustomGeometryLayout(
      geometryBuilder: (index, layout) {
        return SliverGridGeometry(
          scrollOffset: (index ~/ crossAxisCount) * layout.mainAxisStride,
          crossAxisOffset: itemCount.isOdd && index == itemCount - 1
              ? layout.crossAxisStride / 2
              : _getOffsetFromStartInCrossAxis(index, layout),
          mainAxisExtent: childMainAxisExtent,
          crossAxisExtent: childCrossAxisExtent,
        );
      },
      crossAxisCount: crossAxisCount,
      mainAxisStride: childMainAxisExtent + mainAxisSpacing,
      crossAxisStride: childCrossAxisExtent + crossAxisSpacing,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: childCrossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  double _getOffsetFromStartInCrossAxis(
    int index,
    SliverGridRegularTileLayout layout,
  ) {
    final crossAxisStart = (index % crossAxisCount) * layout.crossAxisStride;

    if (layout.reverseCrossAxis) {
      return crossAxisCount * layout.crossAxisStride -
          crossAxisStart -
          layout.childCrossAxisExtent -
          (layout.crossAxisStride - layout.childCrossAxisExtent);
    }
    return crossAxisStart;
  }
}
