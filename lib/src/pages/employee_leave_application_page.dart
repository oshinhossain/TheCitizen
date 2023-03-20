import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:the_citizen_app/src/controllers/user_controller.dart';
import 'package:the_citizen_app/src/controllers/employee_leave_management_controller.dart';
import 'package:the_citizen_app/src/pages/leave_balance_page.dart';
import 'package:the_citizen_app/src/pages/search_agency_officer_page.dart';
import '../components/leave_type_dropdown.dart';
import '../config/app_theme.dart';
import '../config/base.dart';
import '../helpers/hex_color.dart';
import '../helpers/k_log.dart';
import '../helpers/k_text.dart';
import '../helpers/route.dart';

class EmployeeLeaveApplicationpPage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: hexToColor('#78909C'),
          backgroundColor: hexToColor('#EFF6FF'),
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Employee Leave Application',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 18.0,
              color: AppTheme.textColor6,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: GestureDetector(
              onTap: () {
                back();
              },
              child: Icon(Icons.arrow_back)),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: Material(
              color: hexToColor('#78909C'), // #78909C
              child: Container(
                height: 44.75,
                padding: EdgeInsets.only(
                    left: 30.0, top: 14.75, right: 30.0, bottom: 0.0),
                child: Container(
                  //color: Colors.white.withOpacity(0.5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                    ),
                  ),
                  child: _tabBar,
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(children: [
            BasicTab(
                userC: userC,
                employeeLeaveManageMentC: employeeLeaveManageMentC),
            LeaveBalancePage()
          ]),
        ),
      ),
    );
  }

  TabBar get _tabBar => TabBar(
        labelColor: AppTheme.newAppBarTextColor,
        labelStyle: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 14.0,
          color: AppTheme.newAppBarTextColor,
          fontWeight: FontWeight.w700,
        ),
        indicator: BoxDecoration(
          borderRadius: employeeLeaveManageMentC.selectedIndex == 0
              ? BorderRadius.only(topLeft: Radius.circular(5.0))
              : employeeLeaveManageMentC.selectedIndex == 1
                  ? BorderRadius.only(topRight: Radius.circular(5.0))
                  : null,
          color: Colors.white,
        ),
        indicatorWeight: 1,
        indicatorColor: Colors.white,

        indicatorSize: TabBarIndicatorSize.tab,
        //unselectedLabelColor: Colors.blue,
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 14.0,
          color: AppTheme.newAppBarTextColor,
          fontWeight: FontWeight.w700,
        ),
        isScrollable: false,
        physics: BouncingScrollPhysics(),
        tabs: [
          Tab(
            text: 'Basic',
          ),
          Tab(
            text: 'Leave Balance',
          ),
        ],
        onTap: (tabIndex) {
          employeeLeaveManageMentC.selectedIndex.value = tabIndex;
        },
      );
}

class BasicTab extends StatelessWidget {
  const BasicTab({
    Key? key,
    required this.userC,
    required this.employeeLeaveManageMentC,
  }) : super(key: key);

  final UserController userC;
  final EmployeeLeaveManageMentController employeeLeaveManageMentC;

  @override
  Widget build(BuildContext context) {
    kLog(employeeLeaveManageMentC.startDate.value !=
        employeeLeaveManageMentC.endDate.value);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Obx(
        () => SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //   ==================== Leave Type Section ====================
            SizedBox(
              height: 10,
            ),
            KText(
              text: 'Leave Type',
              fontSize: 14,
              color: hexToColor('#72778F'),
            ),
            LeaveTypeComponent(),
            SizedBox(
              height: 10,
            ),
            //  ==================== Start Date section ====================
            Row(
              children: [
                KText(
                  text: 'Start Date',
                  fontSize: 14,
                  color: hexToColor('#72778F'),
                ),
                SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () {
                    employeeLeaveManageMentC.pickDate(start: true);
                  },
                  child: Icon(Icons.calendar_month),
                ),
              ],
            ),
            KText(
              text: DateFormat.yMMMd()
                  .format(employeeLeaveManageMentC.startDate.value!),
              fontSize: 14,
              color: hexToColor('#141C44'),
            ),

            SizedBox(
              height: 05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 0.5,
                      groupValue: employeeLeaveManageMentC.start_half.value,
                      onChanged: (value) {
                        employeeLeaveManageMentC.start_half.value = value!;
                        employeeLeaveManageMentC.differenceDays();
                      },
                    ),
                    KText(
                        text: 'First Half',
                        color: hexToColor('#141C44'),
                        fontSize: 15),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 1.0,
                      groupValue: employeeLeaveManageMentC.start_half.value,
                      onChanged: (value) {
                        employeeLeaveManageMentC.start_half.value = value!;
                        employeeLeaveManageMentC.differenceDays();
                      },
                    ),
                    KText(
                        text: 'Full day',
                        color: hexToColor('#141C44'),
                        fontSize: 15),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 1.5,
                      groupValue: employeeLeaveManageMentC.start_half.value,
                      onChanged: (value) {
                        employeeLeaveManageMentC.start_half.value = value!;
                        employeeLeaveManageMentC.differenceDays();
                      },
                    ),
                    KText(
                        text: 'Second Half',
                        color: hexToColor('#141C44'),
                        fontSize: 15),
                  ],
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 1,
              color: hexToColor('#A3CCDC'),
            ),
            SizedBox(
              height: 10,
            ),
            //  ==================== End Date section ====================

            Row(
              children: [
                KText(
                  text: 'End Date  ',
                  fontSize: 14,
                  color: hexToColor('#72778F'),
                ),
                SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () {
                    employeeLeaveManageMentC.pickDate(start: false);
                  },
                  child: Icon(Icons.calendar_month),
                ),
              ],
            ),
            KText(
              text: DateFormat.yMMMd()
                  .format(employeeLeaveManageMentC.endDate.value!),
              fontSize: 14,
              color: hexToColor('#141C44'),
            ),

            SizedBox(
              height: 05,
            ),
            DateFormat.yMMMd()
                        .format(employeeLeaveManageMentC.startDate.value!) !=
                    DateFormat.yMMMd()
                        .format(employeeLeaveManageMentC.endDate.value!)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible:
                            employeeLeaveManageMentC.start_half.value != 0.5,
                        child: Row(
                          children: [
                            Radio(
                              groupValue:
                                  employeeLeaveManageMentC.end_half.value,
                              value: 0.5,
                              onChanged: (value) {
                                employeeLeaveManageMentC.end_half.value =
                                    value!;
                                employeeLeaveManageMentC.differenceDays();
                              },
                            ),
                            KText(
                                text: '1st Half',
                                color: hexToColor('#141C44'),
                                fontSize: 15),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Radio(
                            groupValue: employeeLeaveManageMentC.end_half.value,
                            value: 1.0,
                            onChanged: (value) {
                              employeeLeaveManageMentC.end_half.value = value!;
                              employeeLeaveManageMentC.differenceDays();
                            },
                          ),
                          KText(
                              text: 'Full day',
                              color: hexToColor('#141C44'),
                              fontSize: 15),
                        ],
                      ),
                    ],
                  )
                : Text(''),
            Divider(
              height: 15,
              thickness: 1,
              color: hexToColor('#A3CCDC'),
            ),
            SizedBox(
              height: 10,
            ),
            //  ==================== Leave Duration section ====================
            Row(
              children: [
                KText(
                  text: 'Leave Duration: ',
                  fontSize: 14,
                  color: hexToColor('#72778F'),
                ),
                KText(
                    text: employeeLeaveManageMentC.leavedays.value == 0
                        ? '0 days'
                        : employeeLeaveManageMentC.leavedays.value
                                    .toString()
                                    .split('.')[1] ==
                                '0'
                            ? employeeLeaveManageMentC.leavedays.value
                                    .toInt()
                                    .toString() +
                                ' days'
                            : employeeLeaveManageMentC.leavedays.value
                                    .toString() +
                                ' days',
                    fontSize: 14,
                    color: Colors.amber),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            //  ==================== Purpose section ====================
            KText(
              text: 'Purpose',
              fontSize: 14,
              color: hexToColor('#72778F'),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20,
                  width: Get.width * .8,
                  child: TextFormField(
                    onChanged: employeeLeaveManageMentC.purpose,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none),
                  ),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 1,
              color: hexToColor('#A3CCDC'),
            ),

            SizedBox(
              height: 10,
            ),

            //  ==================== Attachment section ====================
            KText(
              text: 'Attachment',
              fontSize: 14,
              color: hexToColor('#72778F'),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KText(
                  text: 'Capture Upload',
                  color: hexToColor('#B3B6C6'),
                ),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () async {
                          employeeLeaveManageMentC.imageList.length > 2
                              ? Get.snackbar('Image Quantity Exceed',
                                  'You can Upload Only 3 Image')
                              : await employeeLeaveManageMentC.pickImage(
                                  imageSource: ImageSource.camera);
                        },
                        child: Icon(Icons.camera_alt_outlined)),
                    SizedBox(
                      width: 04,
                    ),
                    GestureDetector(
                        onTap: () async {
                          employeeLeaveManageMentC.imageList.length > 2
                              ? Get.snackbar('Image Quantity Exceed',
                                  'You can Upload Only 3 Image')
                              : await employeeLeaveManageMentC.pickImage(
                                  imageSource: ImageSource.gallery);
                        },
                        child: Icon(Icons.photo))
                  ],
                )
              ],
            ),
            Divider(
              height: 15,
              thickness: 1,
              color: hexToColor('#A3CCDC'),
            ),
            SizedBox(
              height: 05,
            ),

            employeeLeaveManageMentC.imageList.isNotEmpty
                ? SizedBox(
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        if (employeeLeaveManageMentC.imageList.length == 1) {
                          return index == 0
                              ? GestureDetector(
                                  onTap: () {
                                    Get.dialog(AlertDialog(
                                      content: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: Get.width * .6,
                                        height: 500,
                                        child: Stack(
                                          children: [
                                            PhotoView(
                                                imageProvider: FileImage(
                                                    employeeLeaveManageMentC
                                                        .imageList[index]!)),
                                            Positioned(
                                              bottom: 10,
                                              child: SizedBox(
                                                width: Get.width * .7,
                                                height: 35,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ElevatedButton(
                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        05.0),
                                                                side: BorderSide(
                                                                    color: Colors
                                                                        .white))),
                                                            fixedSize: MaterialStateProperty.all<Size>(
                                                                Size(100, 35)),
                                                            side: MaterialStateProperty.all(
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(hexToColor('#F2BA14'))),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: Text(
                                                          "Cancel",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Manrope',
                                                            fontSize: 20.0,
                                                            color: AppTheme
                                                                .textColor1,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        )),
                                                    ElevatedButton(
                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        05.0),
                                                                side: BorderSide(
                                                                    color: Colors
                                                                        .white))),
                                                            fixedSize: MaterialStateProperty.all<Size>(
                                                                Size(100, 35)),
                                                            side: MaterialStateProperty.all(
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(hexToColor('#FE0101'))),
                                                        onPressed: () async {
                                                          await employeeLeaveManageMentC
                                                              .imageList
                                                              .removeAt(index);
                                                          kLog(
                                                              employeeLeaveManageMentC
                                                                  .imageList
                                                                  .length);
                                                          Get.back();
                                                        },
                                                        child: Text(
                                                          "Delete",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Manrope',
                                                            fontSize: 20.0,
                                                            color: AppTheme
                                                                .textColor1,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.all(0),
                                    ));
                                  },
                                  child: Card(
                                      child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                              employeeLeaveManageMentC
                                                  .imageList[index]!)),
                                    ),
                                  )),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: hexToColor('#72778F'),
                                    child: KText(
                                      text: (index + 1).toString(),
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                        } else if (employeeLeaveManageMentC.imageList.length ==
                            2) {
                          return index == 0
                              ? GestureDetector(
                                  onTap: () {
                                    Get.dialog(AlertDialog(
                                      content: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: Get.width * .6,
                                        height: 500,
                                        child: Stack(
                                          children: [
                                            PhotoView(
                                                imageProvider: FileImage(
                                                    employeeLeaveManageMentC
                                                        .imageList[index]!)),
                                            Positioned(
                                              bottom: 10,
                                              child: SizedBox(
                                                width: Get.width * .7,
                                                height: 35,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ElevatedButton(
                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        05.0),
                                                                side: BorderSide(
                                                                    color: Colors
                                                                        .white))),
                                                            fixedSize: MaterialStateProperty.all<Size>(
                                                                Size(100, 35)),
                                                            side: MaterialStateProperty.all(
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(hexToColor('#F2BA14'))),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: Text(
                                                          "Cancel",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Manrope',
                                                            fontSize: 20.0,
                                                            color: AppTheme
                                                                .textColor1,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        )),
                                                    ElevatedButton(
                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        05.0),
                                                                side: BorderSide(
                                                                    color: Colors
                                                                        .white))),
                                                            fixedSize: MaterialStateProperty.all<Size>(
                                                                Size(100, 35)),
                                                            side: MaterialStateProperty.all(
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                            backgroundColor: MaterialStateProperty.all<Color>(hexToColor('#FE0101'))),
                                                        onPressed: () async {
                                                          await employeeLeaveManageMentC
                                                              .imageList
                                                              .removeAt(index);
                                                          kLog(
                                                              employeeLeaveManageMentC
                                                                  .imageList
                                                                  .length);
                                                          Get.back();
                                                        },
                                                        child: Text(
                                                          "Delete",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Manrope',
                                                            fontSize: 20.0,
                                                            color: AppTheme
                                                                .textColor1,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.all(0),
                                    ));
                                  },
                                  child: Card(
                                      child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                              employeeLeaveManageMentC
                                                  .imageList[index]!)),
                                    ),
                                  )),
                                )
                              : index == 1
                                  ? GestureDetector(
                                      onTap: () {
                                        Get.dialog(AlertDialog(
                                          content: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            width: Get.width * .6,
                                            height: 500,
                                            child: Stack(
                                              children: [
                                                PhotoView(
                                                    imageProvider: FileImage(
                                                        employeeLeaveManageMentC
                                                                .imageList[
                                                            index]!)),
                                                Positioned(
                                                  bottom: 10,
                                                  child: SizedBox(
                                                    width: Get.width * .7,
                                                    height: 35,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        ElevatedButton(
                                                            style: ButtonStyle(
                                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            05.0),
                                                                    side: BorderSide(
                                                                        color: Colors
                                                                            .white))),
                                                                fixedSize:
                                                                    MaterialStateProperty.all<Size>(
                                                                        Size(
                                                                            100,
                                                                            35)),
                                                                side: MaterialStateProperty.all(
                                                                    BorderSide(color: Colors.white)),
                                                                backgroundColor: MaterialStateProperty.all<Color>(hexToColor('#F2BA14'))),
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child: Text(
                                                              "Cancel",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontSize: 20.0,
                                                                color: AppTheme
                                                                    .textColor1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            )),
                                                        ElevatedButton(
                                                            style: ButtonStyle(
                                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            05.0),
                                                                    side: BorderSide(
                                                                        color: Colors
                                                                            .white))),
                                                                fixedSize:
                                                                    MaterialStateProperty.all<Size>(
                                                                        Size(
                                                                            100,
                                                                            35)),
                                                                side: MaterialStateProperty.all(
                                                                    BorderSide(color: Colors.white)),
                                                                backgroundColor: MaterialStateProperty.all<Color>(hexToColor('#FE0101'))),
                                                            onPressed: () async {
                                                              await employeeLeaveManageMentC
                                                                  .imageList
                                                                  .removeAt(
                                                                      index);
                                                              kLog(
                                                                  employeeLeaveManageMentC
                                                                      .imageList
                                                                      .length);
                                                              Get.back();
                                                            },
                                                            child: Text(
                                                              "Delete",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontSize: 20.0,
                                                                color: AppTheme
                                                                    .textColor1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.all(0),
                                        ));
                                      },
                                      child: Card(
                                          child: Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: FileImage(
                                                  employeeLeaveManageMentC
                                                      .imageList[index]!)),
                                        ),
                                      )),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundColor: hexToColor('#72778F'),
                                        child: KText(
                                          text: (index + 1).toString(),
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              Get.dialog(AlertDialog(
                                content: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  width: Get.width * .6,
                                  height: 500,
                                  child: Stack(
                                    children: [
                                      PhotoView(
                                          imageProvider: FileImage(
                                              employeeLeaveManageMentC
                                                  .imageList[index]!)),
                                      Positioned(
                                        bottom: 10,
                                        child: SizedBox(
                                          width: Get.width * .7,
                                          height: 35,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      05.0),
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .white))),
                                                      fixedSize:
                                                          MaterialStateProperty.all<Size>(
                                                              Size(100, 35)),
                                                      side: MaterialStateProperty.all(
                                                          BorderSide(color: Colors.white)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(hexToColor('#F2BA14'))),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                      fontFamily: 'Manrope',
                                                      fontSize: 20.0,
                                                      color:
                                                          AppTheme.textColor1,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  )),
                                              ElevatedButton(
                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      05.0),
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .white))),
                                                      fixedSize:
                                                          MaterialStateProperty.all<Size>(
                                                              Size(100, 35)),
                                                      side: MaterialStateProperty.all(
                                                          BorderSide(color: Colors.white)),
                                                      backgroundColor: MaterialStateProperty.all<Color>(hexToColor('#FE0101'))),
                                                  onPressed: () async {
                                                    await employeeLeaveManageMentC
                                                        .imageList
                                                        .removeAt(index);
                                                    kLog(
                                                        employeeLeaveManageMentC
                                                            .imageList.length);
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                      fontFamily: 'Manrope',
                                                      fontSize: 20.0,
                                                      color:
                                                          AppTheme.textColor1,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(0),
                              ));
                            },
                            child: Card(
                                child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(employeeLeaveManageMentC
                                        .imageList[index]!)),
                              ),
                            )),
                          );
                        }
                      },
                    ),
                  )
                : KText(
                    text: '',
                  ),
            SizedBox(
              height: 10,
            ),
            // ==================== Contact Person section ====================

            KText(
              text: 'Interim Contact Person',
              fontSize: 13,
              color: hexToColor('#72778F'),
            ),
            SizedBox(
              height: 05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 1,
                          offset: Offset(
                            1,
                            1,
                          ), // Shadow position
                        ),
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 1,
                          offset: Offset(
                            -1,
                            -1,
                          ), // Shadow position
                        ),
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 1,
                          offset: Offset(
                            -1,
                            1,
                          ), // Shadow position
                        ),
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 1,
                          offset: Offset(
                            1,
                            -1,
                          ), // Shadow position
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(3),
                    child: Container(
                      height: 56,
                      width: 85,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // image: DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: NetworkImage(
                        //     '${dotenv.env['BASE_URL_FSR']}/v2/user-attachment/get?latLng=23.90560,93.094535&apiKey=ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5&username=${userC.currentUser.value!.username}&appCode=KYC&fileCategory=photo&countryCode=BD',
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 20,
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextField(
                        onChanged: employeeLeaveManageMentC.contactPersonSearch,
                        decoration: InputDecoration(
                            hintText: employeeLeaveManageMentC
                                .selectedContactPerson.value,
                            suffixIcon: GestureDetector(
                                onTap: () async {
                                  if (employeeLeaveManageMentC
                                          .contactPersonSearch.value !=
                                      '') {
                                    await employeeLeaveManageMentC
                                        .getContactPersonList();
                                    push(SearchAgencyOfficerPage());
                                  } else {
                                    Get.dialog(AlertDialog(
                                      content:
                                          KText(text: 'Type A name to search'),
                                    ));
                                  }
                                },
                                child: Icon(Icons.search)),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none),
                      ),
                      Divider(
                        height: 15,
                        thickness: 1,
                        color: hexToColor('#A3CCDC'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //  ==================== emergency Contact Person section ====================
            SizedBox(
              height: 10,
            ),
            KText(
              text: 'Emergency Contact No.',
              fontSize: 14,
              color: hexToColor('#72778F'),
            ),
            SizedBox(
              height: 05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20,
                  width: Get.width * .8,
                  child: TextFormField(
                    onChanged: employeeLeaveManageMentC.purpose,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none),
                  ),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 1,
              color: hexToColor('#A3CCDC'),
            ),
            SizedBox(
              height: 10,
            ),
            //  ==================== Submit Button section ====================
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(05.0),
                              side: BorderSide(color: Colors.white))),
                      fixedSize: MaterialStateProperty.all<Size>(Size(140, 35)),
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.white)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        AppTheme.appBarColor,
                      )),
                  onPressed: () async {
                    employeeLeaveManageMentC.leavesubmission();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 20.0,
                      color: AppTheme.textColor1,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            )
          ]),
        ),
      ),
    );
  }
}
