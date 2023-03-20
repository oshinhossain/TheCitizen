import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/global_helper.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import 'package:the_citizen_app/src/pages/process_shout_page.dart';

class RateShoutClosurePage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    rateShoutC.getrateShout();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppTheme.newAppBarBackgroundColor,
        title: KText(
          text: 'Rate Shout Closure',
          bold: true,
          fontSize: 16,
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            // padding: const EdgeInsets.all(8.0),
            child: DataTable(
              columnSpacing: 15,
              showCheckboxColumn: false,
              horizontalMargin: 10,
              dividerThickness: 1,
              showBottomBorder: true,
              headingRowColor: MaterialStateColor.resolveWith((states) => AppTheme.textColor16),
              headingRowHeight: 35,
              //dataRowHeight: 35,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: AppTheme.textColor37),
                ),
              ),
              headingTextStyle:
                  TextStyle(fontFamily: 'Manrope', fontSize: 14.0, color: AppTheme.textColor6, fontWeight: FontWeight.w700),
              columns: [
                DataColumn(
                  label: KText(
                    text: 'Type',
                    color: AppTheme.textColor6,
                    fontSize: 14.0,
                  ),
                ),
                DataColumn(
                  label: KText(
                    text: 'Solved By',
                    color: AppTheme.textColor6,
                    fontSize: 14.0,
                  ),
                ),
                DataColumn(
                  label: KText(
                    text: 'Remarks',
                    color: AppTheme.textColor6,
                    fontSize: 14.0,
                  ),
                ),
                DataColumn(
                  label: KText(
                    text: 'Date',
                    color: AppTheme.textColor6,
                    fontSize: 14.0,
                  ),
                ),
              ],
              rows: rateShoutC.rateShoutList
                  .map(
                    (shout) => DataRow(
                      cells: <DataCell>[
                        DataCell(
                          KText(
                            text: shout.subcategoryName,
                          ),
                        ),
                        DataCell(
                          KText(
                            text: shout.reportedByFullname,
                            //  Utility.isEmptyString(shout.officerFullname) ? '' : shout.officerFullname,
                          ),
                        ),
                        DataCell(
                          KText(
                            text: shout.remarks,
                            color: AppTheme.textColor6,
                            // Utility.isEmptyString(shout.remarks) ? '' : shout.remarks,
                          ),
                        ),
                        DataCell(
                          KText(
                            text: formatDate(date: shout.reportDate!),
                            color: AppTheme.textColor6,
                            //  Utility.isEmptyString(shout.reportDate) ? '' : shout.reportDate,
                          ),
                        ),
                      ],
                      onSelectChanged: (value) {
                        push(ProcessShoutPage(
                          rateShoutClosure: shout,
                          title: 'rateShout',
                        ));
                        // if (selectValue == false) {
                        //   selectValue = true;
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute<void>(
                        //       builder: (BuildContext context) => RateShoutClosureFullScreenDialog(
                        //         rateShoutClosureModel: shout,
                        //         voidCallback: () {
                        //           Navigator.pop(context);
                        //         },
                        //       ),
                        //       fullscreenDialog: true,
                        //     ),
                        //   );
                        // }
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
