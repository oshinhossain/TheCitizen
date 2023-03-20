import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
import 'package:the_citizen_app/src/pages/employee_leave_application_page.dart';
import '../config/app_theme.dart';
import '../config/base.dart';
import '../helpers/hex_color.dart';
import '../helpers/k_text.dart';

class SearchAgencyOfficerPage extends StatefulWidget {
  @override
  State<SearchAgencyOfficerPage> createState() =>
      _SearchAgencyOfficerPageState();
}

class _SearchAgencyOfficerPageState extends State<SearchAgencyOfficerPage>
    with Base {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Obx(
                () => Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        onChanged: employeeLeaveManageMentC.contactPersonSearch,
                        decoration: InputDecoration(
                            hintText: 'Write Officer Name',
                            suffixIcon: GestureDetector(
                                onTap: () async {
                                  if (employeeLeaveManageMentC
                                          .contactPersonSearch.value !=
                                      '') {
                                    await employeeLeaveManageMentC
                                        .getContactPersonList();
                                  } else {
                                    Get.dialog(AlertDialog(
                                      content:
                                          KText(text: 'Type A name to search'),
                                    ));
                                  }
                                },
                                child: Icon(Icons.search)),
                            border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: hexToColor('#A3CCDC'))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: hexToColor('#A3CCDC'))),
                            errorBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: hexToColor('#A3CCDC'))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: hexToColor('#A3CCDC'))),
                            disabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: hexToColor('#A3CCDC')))),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: employeeLeaveManageMentC.isLoading.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : employeeLeaveManageMentC.searchedOfficerList.isEmpty
                              ? Center(
                                  child: KText(text: 'No Officer Found'),
                                )
                              : ListView(
                                  children: employeeLeaveManageMentC
                                      .searchedOfficerList
                                      .map((element) => Card(
                                            color: Colors.white,
                                            child: ListTile(
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      0, 5, 5, 5),
                                              minVerticalPadding: 0,
                                              leading: SizedBox(
                                                height: 85,
                                                child: Container(
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    //borderRadius: BorderRadius.circular(35),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors
                                                            .grey.shade300,
                                                        blurRadius: 1,
                                                        offset: Offset(
                                                          1,
                                                          1,
                                                        ), // Shadow position
                                                      ),
                                                      BoxShadow(
                                                        color: Colors
                                                            .grey.shade300,
                                                        blurRadius: 1,
                                                        offset: Offset(
                                                          -1,
                                                          -1,
                                                        ), // Shadow position
                                                      ),
                                                      BoxShadow(
                                                        color: Colors
                                                            .grey.shade300,
                                                        blurRadius: 1,
                                                        offset: Offset(
                                                          -1,
                                                          1,
                                                        ), // Shadow position
                                                      ),
                                                      BoxShadow(
                                                        color: Colors
                                                            .grey.shade300,
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
                                                      //     'http://123.200.22.150:9015/v2/user-attachment/get?latLng=23.90560,93.094535&apiKey=ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5&username=${element!.username!}&appCode=KYC&fileCategory=photo&countryCode=BD',
                                                      //   ),
                                                      // ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              title: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  KText(
                                                    text: element!.fullname,
                                                    fontSize: 14,
                                                    bold: true,
                                                  ),
                                                  KText(
                                                    text: element.email,
                                                    fontSize: 14,
                                                    bold: true,
                                                  ),
                                                  KText(
                                                    text: element.mobile,
                                                    fontSize: 14,
                                                    bold: true,
                                                  ),
                                                ],
                                              ),
                                              trailing: Checkbox(
                                                value: employeeLeaveManageMentC
                                                    .checkBoxList[
                                                        employeeLeaveManageMentC
                                                            .checkBoxList
                                                            .indexWhere((e) =>
                                                                e!.name ==
                                                                element
                                                                    .fullname)]!
                                                    .isCheck,
                                                onChanged: (value) {
                                                  setState(() {
                                                    employeeLeaveManageMentC
                                                        .changeValue(
                                                            a: value!,
                                                            username: element
                                                                .fullname!);
                                                  });
                                                },
                                              ),
                                            ),
                                          ))
                                      .toList()),
                    ),
                    SizedBox(
                      height: 05,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(05.0),
                                      side: BorderSide(color: Colors.white))),
                              fixedSize: MaterialStateProperty.all<Size>(
                                  Size(140, 35)),
                              side: MaterialStateProperty.all(
                                  BorderSide(color: Colors.white)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppTheme.appBarColor)),
                          onPressed: () {
                            employeeLeaveManageMentC.selectedOfficer.value =
                                employeeLeaveManageMentC.searchedOfficerList[
                                    employeeLeaveManageMentC.searchedOfficerList
                                        .indexWhere((e) =>
                                            e!.fullname ==
                                            employeeLeaveManageMentC
                                                .selectedCheckValue.value)];

                            if (employeeLeaveManageMentC
                                    .selectedOfficer.value!.fullname ==
                                null) {
                              employeeLeaveManageMentC
                                      .selectedContactPerson.value =
                                  employeeLeaveManageMentC
                                      .selectedOfficer.value!.username!;
                            } else {
                              employeeLeaveManageMentC
                                      .selectedContactPerson.value =
                                  employeeLeaveManageMentC
                                      .selectedOfficer.value!.fullname!;
                            }
                            kLog(employeeLeaveManageMentC
                                .selectedOfficer.value!.id);
                            kLog(employeeLeaveManageMentC
                                .selectedOfficer.value!.username);
                            kLog(employeeLeaveManageMentC
                                .selectedOfficer.value!.fullname);
                            kLog(employeeLeaveManageMentC
                                .selectedOfficer.value!.mobile);
                            kLog(employeeLeaveManageMentC
                                .selectedOfficer.value!.email);
                            Get.off(() => EmployeeLeaveApplicationpPage());
                          },
                          child: Text(
                            "Add",
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
                  ],
                ),
              )),
        ));
  }
}
