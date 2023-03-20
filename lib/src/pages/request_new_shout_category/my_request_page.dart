import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/custom_dialog_helper.dart';
import 'package:the_citizen_app/src/helpers/global_helper.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/loading.dart';

class MyRequestTabPage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    reqShoutCategoryC.myShoutRequestGet();
    //  reqShoutCategorySubCategoryC.myCatAndSubCatRequestGet('shoutCategory');
    return Scaffold(
      body: Obx(
        () => reqShoutCategoryC.isLoading.value
            ? Center(child: Loading())
            : Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Theme(
                          data: Theme.of(context).copyWith(dividerColor: AppTheme.borderColor),
                          child: DataTable(
                            headingRowColor: MaterialStateColor.resolveWith((states) => hexToColor('#EFF6FF')),
                            showBottomBorder: true,
                            columnSpacing: 20,
                            headingRowHeight: 35,
                            horizontalMargin: 10,
                            dividerThickness: 1,
                            sortAscending: true,
                            columns: [
                              DataColumn(
                                label: KText(
                                  text: "Date",
                                  bold: true,
                                  fontSize: 14,
                                ),
                                numeric: false,
                              ),
                              DataColumn(
                                label: KText(
                                  text: "Requested Category",
                                  bold: true,
                                  fontSize: 14,
                                ),
                                numeric: false,
                              ),
                              DataColumn(
                                label: KText(
                                  text: "Status",
                                  bold: true,
                                  fontSize: 14,
                                ),
                                numeric: false,
                              ),
                            ],
                            rows: reqShoutCategoryC.myRequestList
                                .map(
                                  (data) => DataRow(
                                    cells: [
                                      DataCell(
                                        KText(
                                          text: formatDate(date: data!.requestDate!),
                                          maxLines: 1,
                                        ),
                                        onTap: () {
                                          CustomDialogHelper.tableBottomSheet(
                                              title: "New Shout Category Details",
                                              categoryName: data.categoryName,
                                              description: data.categoriesDescription,
                                              status: data.status,
                                              name: "New Category Name");
                                        },
                                      ),
                                      DataCell(
                                        Center(child: KText(text: "${data.categoryName}")),
                                        onTap: () {
                                          CustomDialogHelper.tableBottomSheet(
                                              title: "New Shout Category Details",
                                              categoryName: data.categoryName,
                                              description: data.categoriesDescription,
                                              status: data.status,
                                              name: "New Category Name");
                                        },
                                      ),
                                      DataCell(
                                        Center(
                                          child: data.status == "Rejected"
                                              ? Icon(
                                                  Icons.cancel_outlined,
                                                  color: Colors.red,
                                                )
                                              : data.status == "Approved"
                                                  ? Icon(
                                                      Icons.check_circle_outline,
                                                      color: Colors.green,
                                                    )
                                                  : Image.asset(
                                                      "assets/icons/Pending_icon_new.png",
                                                      height: 25,
                                                    ),
                                        ),
                                        onTap: () {
                                          CustomDialogHelper.tableBottomSheet(
                                              title: "New Shout Category Details",
                                              categoryName: data.categoryName,
                                              description: data.categoriesDescription,
                                              status: data.status,
                                              name: "New Category Name");
                                        },
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
