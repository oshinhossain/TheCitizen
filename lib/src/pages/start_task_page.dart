import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/global_helper.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import 'package:the_citizen_app/src/pages/process_shout_page.dart';

class StartTaskPage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    startTaskC.getStartTask();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.newAppBarBackgroundColor,
        centerTitle: true,
        title: KText(
          text: 'Start Task',
          bold: true,
          fontSize: 16,
        ),
      ),
      body: Obx(
        () => Container(
          width: Get.width,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: DataTable(
            headingRowColor: MaterialStateColor.resolveWith((states) => hexToColor('#EFF6FF')),
            showBottomBorder: true,
            columnSpacing: 10,
            headingRowHeight: 35,
            horizontalMargin: 10,
            dividerThickness: 1,
            showCheckboxColumn: false,
            columns: [
              DataColumn(
                label: Text(
                  "Sub-Category",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                numeric: false,
              ),
              DataColumn(
                label: Text(
                  "Urgercy",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                numeric: false,
              ),
              DataColumn(
                label: Text(
                  "Remarks",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                numeric: false,
              ),
            ],
            rows: startTaskC.startTaskList
                .map(
                  (data) => DataRow(
                    cells: [
                      DataCell(KText(text: data.subcategoryName!), onTap: () {
                        push(ProcessShoutPage(
                          rateShoutClosure: data,
                          title: 'startTask',
                        ));

                        myReportsC.files.clear();
                        myReportsC.mapMyReportListImageFetched(userInfo: data);
                      }),
                      DataCell(
                        Center(child: KText(text: "${data.urgencyLevel}")),
                        onTap: () {
                          push(ProcessShoutPage(
                            rateShoutClosure: data,
                            title: 'startTask',
                          ));
                        },
                      ),
                      DataCell(
                        Center(child: KText(text: data.remarks != null ? "${data.remarks}" : '')),
                        //  Icon(
                        //     Icons.hourglass_top_rounded,
                        //     color: Colors.grey,
                        //   ),
                        onTap: () {
                          push(ProcessShoutPage(
                            rateShoutClosure: data,
                            title: 'startTask',
                          ));
                        },
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
