import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/models/my_attendance_dashboard_model.dart';
import '../config/app_theme.dart';
import '../config/base.dart';

class MyAttendanceDashboardPage extends StatefulWidget {
  @override
  State<MyAttendanceDashboardPage> createState() =>
      _MyAttendanceDashboardPageState();
}

class _MyAttendanceDashboardPageState extends State<MyAttendanceDashboardPage>
    with Base {
  List<Widget> attendanceList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Attendance Dashboard',
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
        backgroundColor: AppTheme.backgroundColor,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 15,
              ),
              Expanded(
                  flex: 0,
                  child: AttendanceDatePicker(
                    title: '',
                  )),
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: AttendanceGridView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AttendanceDatePicker extends StatefulWidget {
  String title;
  AttendanceDatePicker({required this.title});
  @override
  State<AttendanceDatePicker> createState() => _AttendanceDatePickerState();
}

class _AttendanceDatePickerState extends State<AttendanceDatePicker> with Base {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    //final difference = myAttendanceDashboardC.dateRange.value.duration;
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
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
                Text(
                  myAttendanceDashboardC.dateRange.value.start.day < 10
                      ? myAttendanceDashboardC.dateRange.value.start.month < 10
                          ? '0${myAttendanceDashboardC.dateRange.value.start.day}-0${myAttendanceDashboardC.dateRange.value.start.month}-${myAttendanceDashboardC.dateRange.value.start.year}'
                          : '0${myAttendanceDashboardC.dateRange.value.start.day}-${myAttendanceDashboardC.dateRange.value.start.month}-${myAttendanceDashboardC.dateRange.value.start.year}'
                      : myAttendanceDashboardC.dateRange.value.start.month < 10
                          ? '${myAttendanceDashboardC.dateRange.value.start.day}-0${myAttendanceDashboardC.dateRange.value.start.month}-${myAttendanceDashboardC.dateRange.value.start.year}'
                          : '${myAttendanceDashboardC.dateRange.value.start.day}-${myAttendanceDashboardC.dateRange.value.start.month}-${myAttendanceDashboardC.dateRange.value.start.year}',
                  // '${(fromDate == null || fromDate == '') ?
                  // DateFormat('dd-MMM-yyyy').format(start) : state?.fromDate}',
                  // DateFormat('dd-MMM-yyyy').format(start),

                  style: TextStyle(
                    color: AppTheme.textColor6,
                    fontFamily: 'Manrope',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),

                  /// '${start.year}/${start.month}/${start.day}',
                ),
                SizedBox(
                  width: 10.0,
                ),
                // Icon(
                //   Icons.date_range_outlined,
                //   size: 20.0,
                //   color: AppTheme.textColor9,
                // ),
              ],
            ),
            onPressed: () {},
            // () async {
            //   await myAttendanceDashboardC.pickDateRange();
            // },
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            '-',
            style: TextStyle(
              color: AppTheme.textColor2,
              fontFamily: 'Manrope',
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: ElevatedButton(
              // style: ElevatedButton.styleFrom(
              // ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppTheme.textColor1),
                shadowColor:
                    MaterialStateProperty.all<Color>(AppTheme.appBarColor),
              ),
              child: Row(
                children: [
                  Text(
                    myAttendanceDashboardC.dateRange.value.end.day < 10
                        ? myAttendanceDashboardC.dateRange.value.end.month < 10
                            ? '0${myAttendanceDashboardC.dateRange.value.end.day}-0${myAttendanceDashboardC.dateRange.value.end.month}-${myAttendanceDashboardC.dateRange.value.end.year}'
                            : '0${myAttendanceDashboardC.dateRange.value.end.day}-${myAttendanceDashboardC.dateRange.value.end.month}-${myAttendanceDashboardC.dateRange.value.end.year}'
                        : myAttendanceDashboardC.dateRange.value.end.month < 10
                            ? '${myAttendanceDashboardC.dateRange.value.end.day}-0${myAttendanceDashboardC.dateRange.value.end.month}-${myAttendanceDashboardC.dateRange.value.end.year}'
                            : '${myAttendanceDashboardC.dateRange.value.end.day}-${myAttendanceDashboardC.dateRange.value.end.month}-${myAttendanceDashboardC.dateRange.value.end.year}',
                    // '${(state?.toDate == null || state?.toDate == '') ?
                    // DateFormat('dd-MMM-yyyy').format(end) : state?.toDate}',
                    style: TextStyle(
                      color: AppTheme.textColor6,
                      fontFamily: 'Manrope',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Visibility(
                    visible: widget.title != 'title',
                    child: Icon(
                      Icons.date_range_outlined,
                      size: 20.0,
                      color: AppTheme.textColor9,
                    ),
                  ),
                ],
              ),
              onPressed: widget.title == 'title'
                  ? () {}
                  : () async {
                      await myAttendanceDashboardC.pickDateRange();
                    },
            ),
          ),
        ],
      ),
    );
  }
}

class AttendanceGridView extends StatefulWidget {
  // const AttendanceGridView({Key key}) : super(key: key);
  @override
  State<AttendanceGridView> createState() => _AttendanceGridViewState();
}

class _AttendanceGridViewState extends State<AttendanceGridView> with Base {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.count(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 0.0, top: 0.0),
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        children: [
          createAttendanceGridItems(
            onTab: () {
              Get.to(() => AttendanceDetailsPage(
                    title: 'Present Details',
                    historyList: myAttendanceDashboardC.presentList,
                  ));
              // BlocProvider.of<MyAttendanceDashboardBloc>(context).add(MyDailyAttendanceSummaryFetched('present'));
              // Navigator.push(
              //   context,
              //   MaterialPageRoute<void>(
              //     builder: (BuildContext context) => PresentDetails(
              //       title: 'Present Details',
              //       status: 'present',
              //     ),
              //fullscreenDialog: true,
              //   ),
              // );
            },
            presentTextColor: '#E9FAF4',
            index: 1,
            themeColor: '#434969',
            imagePath: 'assets/icons/present_icon.png',
            titleText: myAttendanceDashboardC.presentList.length < 10
                ? '0' + myAttendanceDashboardC.presentList.length.toString()
                : myAttendanceDashboardC.presentList.length.toString(),
            subTitleText: 'Present',
          ),
          createAttendanceGridItems(
            onTab: () {
              Get.to(() => AttendanceDetailsPage(
                    title: 'Late Details',
                    historyList: myAttendanceDashboardC.lateList,
                  ));
              // Get.to(()=>LateDetails());
              // BlocProvider.of<MyAttendanceDashboardBloc>(context).add(MyDailyAttendanceSummaryFetched('late'));
              // Navigator.push(
              //   context,
              //   MaterialPageRoute<void>(
              //     builder: (BuildContext context) => LateDetails(
              //       title: 'Late Details',
              //     ),
              //     // fullscreenDialog: true,
              //   ),
              // );
            },
            presentTextColor: '#F9F2D2',
            index: 1,
            themeColor: '434969',
            imagePath: 'assets/icons/late_icon.png',
            titleText: myAttendanceDashboardC.lateList.length < 10
                ? '0' + myAttendanceDashboardC.lateList.length.toString()
                : myAttendanceDashboardC.lateList.length.toString(),
            // state.myDailyAttendanceModel != null ? '${state.myDailyAttendanceModel.totalLate.toString() ?? ''}' : '00',
            subTitleText: 'Late',
          ),
          createAttendanceGridItems(
            onTab: () {
              Get.to(() => AttendanceDetailsPage(
                    title: 'Leave Details',
                    historyList: myAttendanceDashboardC.leaveList,
                  ));

              // BlocProvider.of<MyAttendanceDashboardBloc>(context).add(MyDailyAttendanceSummaryFetched('leave'));
              // Navigator.push(
              //   context,
              //   MaterialPageRoute<void>(
              //     builder: (BuildContext context) => LeaveDetails(
              //       title: 'Leave Details',
              //     ),
              //     //  fullscreenDialog: true,
              //   ),
              // );
            },
            presentTextColor: '#E1E7E9',
            index: 1,
            themeColor: '434969',
            imagePath: 'assets/icons/leave_icon.png',
            titleText: myAttendanceDashboardC.leaveList.length < 10
                ? '0' + myAttendanceDashboardC.leaveList.length.toString()
                : myAttendanceDashboardC.leaveList.length.toString(),
            // state.myDailyAttendanceModel != null
            //     ? '${state.myDailyAttendanceModel.totalOnLeave.toString() ?? ''}'
            //     : '00',
            subTitleText: 'Leave',
          ),
          createAttendanceGridItems(
            onTab: () {
              Get.to(() => AttendanceDetailsPage(
                    title: 'Absent Details',
                    historyList: myAttendanceDashboardC.absentList,
                  ));
              //  Get.to(()=>AbsentDetails());

              // BlocProvider.of<MyAttendanceDashboardBloc>(context).add(MyDailyAttendanceSummaryFetched('absent'));
              // Navigator.push(
              //   context,
              //   MaterialPageRoute<void>(
              //     builder: (BuildContext context) => AbsentDetails(
              //       title: 'Absent Details',
              //     ),
              //     //fullscreenDialog: true,
              //   ),
              // );
            },
            presentTextColor: '#FBDAE5',
            index: 1,
            themeColor: '434969',
            imagePath: 'assets/icons/absent_icon.png',
            titleText: myAttendanceDashboardC.absentList.length < 10
                ? '0' + myAttendanceDashboardC.absentList.length.toString()
                : myAttendanceDashboardC.absentList.length.toString(),
            // state.myDailyAttendanceModel != null
            //     ? '${state.myDailyAttendanceModel.totalAbsent.toString() ?? ''}'
            //     : '00',
            subTitleText: 'Absent',
          ),
          createAttendanceGridItems(
            onTab: () {
              Get.to(() => AttendanceDetailsPage(
                    title: 'Very Late Details',
                    historyList: myAttendanceDashboardC.veryLateList,
                  ));
              // Get.to(()=>VeryLateDetails());
              // BlocProvider.of<MyAttendanceDashboardBloc>(context).add(MyDailyAttendanceSummaryFetched('present'));
              // Navigator.push(
              //   context,
              //   MaterialPageRoute<void>(
              //     builder: (BuildContext context) => PresentDetails(
              //       title: 'Present Details',
              //       status: 'present',
              //     ),
              //fullscreenDialog: true,
              //   ),
              // );
            },
            presentTextColor: '#F9DED2',
            index: 1,
            themeColor: '#434969',
            imagePath: 'assets/icons/present_icon.png',
            titleText: myAttendanceDashboardC.veryLateList.length < 10
                ? '0' + myAttendanceDashboardC.veryLateList.length.toString()
                : myAttendanceDashboardC.veryLateList.length.toString(),
            // state.myDailyAttendanceModel != null
            //     ? '${state.myDailyAttendanceModel.totalPresent.toString() ?? ''}'
            //     : '00',
            subTitleText: 'Very Late',
          ),
        ],
      ),
    );
  }

  Widget createAttendanceGridItems(
      {int? index,
      String? presentTextColor,
      String? themeColor,
      String? imagePath,
      String? titleText,
      String? subTitleText,
      VoidCallback? onTab}) {
    bool a = index == 0
        ? myAttendanceDashboardC.presentLoad.value
        : index == 1
            ? myAttendanceDashboardC.lateBool.value
            : index == 2
                ? myAttendanceDashboardC.leaveBool.value
                : index == 3
                    ? myAttendanceDashboardC.absentBool.value
                    : index == 4
                        ? myAttendanceDashboardC.veryLateBool.value
                        : false;
    return Container(
      padding: EdgeInsets.all(5),
      //  height: 160,
      //color: textColor41,
      // padding: EdgeInsets.only(bottom: 40),
      child: Card(
        elevation: 2,
        shadowColor: hexToColor(presentTextColor!),
        // shadowColor: Colors.grey[100],
        color: hexToColor(presentTextColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: hexToColor(presentTextColor), width: 0.0),
        ),
        child: InkWell(
          onTap: onTab,
          // onTab,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 0, bottom: 0, top: 0),
            child: Center(
              child: Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 60,
                      width: 60,
                      alignment: Alignment.topRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(270.0),
                          bottomLeft: Radius.circular(280.0),
                          bottomRight: Radius.circular(180.0),
                        ),
                        color: AppTheme.textColor36.withOpacity(0.4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: ImageIcon(
                          AssetImage('assets/images/shout_logo.png'),
                          // (Utility.isEmptyString(imagePath) ? 'assets/images/shout_logo.png' : imagePath),
                          //    color: Utility.isEmptyString(themeColor) ? themeColor : MyHexColor(themeColor),
                          size: 29, //category.imageSize,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: a
                          ? CircularProgressIndicator()
                          : Text(
                              titleText ?? '',
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 36.0,
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
                            subTitleText ?? '',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 16.0,
                              color: AppTheme.textColor6,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 05,
                          ),
                          Icon(Icons.arrow_forward_outlined,
                              size: 15, color: AppTheme.textColor5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AttendanceDetailsPage extends StatelessWidget with Base {
  String? title;
  List<MyAttendanceDashboardModel> historyList;
  AttendanceDetailsPage({required this.title, required this.historyList});
  //: super(key: key);

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
                Row(
                  children: [
                    KText(bold: true, text: 'Period:'),
                    KText(
                        text: employeeLeaveManageMentC.startDate.value!
                            .toString())
                  ],
                ),
                SizedBox(height: 15.0),
                SizedBox(
                  height: Get.height * 0.73,
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
                                      right: 10, top: 15, bottom: 10, left: 4),
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
                                              text: myAttendanceDashboardC
                                                  .formatDate(date: e.attDate!),
                                              fontSize: 16,
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
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            KText(text: 'In Time'),
                                            KText(
                                              text: agencyAttendanceDashboardC
                                                  .formatTime(time: e.inTime!),
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
                                                                time:
                                                                    e.outTime!),
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
                                                        effTime: agencyAttendanceDashboardC
                                                            .calculateEffectiveTime(
                                                                time: (Duration(seconds: int.parse(e.effectiveHoursText!))
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
                                                                time: (Duration(
                                                                            seconds: int.parse(e
                                                                                .effectiveHoursText!))
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

class AttendanceDateSelect extends StatelessWidget {
  // const AttendanceDateSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'date 00',
          style: TextStyle(
            color: AppTheme.textColor6,
            fontFamily: 'Manrope',
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          '-',
          style: TextStyle(
            color: AppTheme.textColor2,
            fontFamily: 'Manrope',
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          'date 01',
          style: TextStyle(
            color: AppTheme.textColor6,
            fontFamily: 'Manrope',
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
