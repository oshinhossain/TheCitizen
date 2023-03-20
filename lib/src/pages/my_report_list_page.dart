import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/global_helper.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/render_img.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import 'package:the_citizen_app/src/pages/report_details_page.dart';
import '../helpers/loading.dart';

class MyReportListPage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    myReportsC.getReports();
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => myReportsC.reportList.isEmpty
              ? myReportsC.isLoading.value
                  ? SizedBox(
                      height: Get.height / 1.5,
                      child: Center(
                        child: Loading(),
                      ),
                    )
                  : SizedBox(
                      height: Get.height / 1.5,
                      child: Center(child: KText(text: 'No data found')),
                    )
              : Container(
                  height: Get.height,
                  width: Get.width,
                  color: hexToColor('#EFF6FF'),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: DataTable(
                        headingRowHeight: 35,
                        columnSpacing: 20,
                        showCheckboxColumn: false,
                        horizontalMargin: 10,
                        dividerThickness: 1,
                        showBottomBorder: true,
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => hexToColor('#EFF6FF')),
                        // headingTextStyle: TextStyle(color: Colors.black),
                        columns: [
                          DataColumn(
                            label: Text(
                              "Date",
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 15.0,
                                color: hexToColor('#141C44'),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Category",
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 15.0,
                                color: hexToColor('#141C44'),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          DataColumn(
                            numeric: true,
                            label: Text(
                              "Status",
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 15.0,
                                color: hexToColor('#141C44'),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                        rows: myReportsC.reportList
                            .map((myReports) => DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      KText(
                                        text:
                                            "${myReports!.reportDate != null ? formatDate(date: myReports.reportDate!) : ""}",
                                      ),
                                      onTap: () {
                                        push(ReportDetailsPage(
                                            myReport: myReports));
                                        myReportsC.files.clear();
                                        myReportsC.mapMyReportListImageFetched(
                                            userInfo: myReports);
                                      },
                                    ),
                                    DataCell(
                                      KText(
                                        text:
                                            "${myReports.categoryName != null ? "${myReports.categoryName} > ${myReports.subcategoryName}" : ""}",
                                        maxLines: 2,
                                      ),
                                      onTap: () {
                                        push(ReportDetailsPage(
                                            myReport: myReports));
                                        myReportsC.files.clear();
                                        myReportsC.mapMyReportListImageFetched(
                                            userInfo: myReports);
                                      },
                                    ),
                                    DataCell(
                                      RenderImg(
                                        path: myReports.fulfillmentStatus ==
                                                'UNASSIGNED'
                                            ? 'icon_received.png'
                                            : myReports.fulfillmentStatus ==
                                                    'ASSIGNED'
                                                ? 'icon_unseen.png'
                                                : myReports.fulfillmentStatus ==
                                                        'VERIFIED'
                                                    ? 'icon_assigned.png'
                                                    : myReports.fulfillmentStatus ==
                                                            'REJECTED'
                                                        ? 'icon_rejected.png'
                                                        : myReports.fulfillmentStatus ==
                                                                'STARTED'
                                                            ? 'icon_started.png'
                                                            : myReports.fulfillmentStatus ==
                                                                    'COMPLETED'
                                                                ? 'icon_completed.png'
                                                                : myReports.fulfillmentStatus ==
                                                                        'DROPPED'
                                                                    ? 'icon_dropped.png'
                                                                    : myReports.fulfillmentStatus ==
                                                                            'Closed By Shouter'
                                                                        ? 'icon_closed.png'
                                                                        : 'alert.png',
                                        height: 25,
                                      ),
                                      // KText(
                                      //   text: "${myReports.fulfillmentStatus != null ? myReports.fulfillmentStatus : ""}",
                                      // ),
                                      onTap: () {
                                        push(ReportDetailsPage(
                                            myReport: myReports));
                                        myReportsC.files.clear();
                                        myReportsC.mapMyReportListImageFetched(
                                            userInfo: myReports);
                                      },
                                    ),
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
