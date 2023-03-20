import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/custom_dialog_helper.dart';
import 'package:the_citizen_app/src/helpers/global_helper.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/models/request_new_subcategory_model.dart';

class MyRequestSubCategoryPage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    reqShoutSubCategoryC.mySubCategoryRequestGet();
    //  reqShoutCategorySubCategoryC.myCatAndSubCatRequestGet('shoutType');
    return Scaffold(
      body: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Theme(
                    data: Theme.of(context).copyWith(dividerColor: AppTheme.borderColor),
                    child: DataTable(
                      headingRowColor: MaterialStateColor.resolveWith((states) => hexToColor('#EFF6FF')),
                      showBottomBorder: true,
                      columnSpacing: 10,
                      headingRowHeight: 35,
                      horizontalMargin: 10,
                      dividerThickness: 1,
                      columns: [
                        DataColumn(
                          label: Text(
                            "Date",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            "Requested SubCategory",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            "Status",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          numeric: false,
                        ),
                      ],
                      rows: reqShoutSubCategoryC.myRequestList
                          .map(
                            (data) => DataRow(
                              cells: [
                                DataCell(
                                  KText(text: formatDate(date: data!.requestDate!)),
                                  onTap: () {
                                    CustomDialogHelper.tableBottomSheet(
                                      title: "New Shout SubCategory Details",
                                      categoryName: data.categoryName,
                                      shoutType: data.subcategoryName!,
                                      description: data.subcategoryDescription,
                                      status: data.status,
                                      name: "Category Name",
                                    );
                                  },
                                ),
                                DataCell(
                                  Center(child: KText(text: "${data.subcategoryName}")),
                                  onTap: () {
                                    CustomDialogHelper.tableBottomSheet(
                                      title: "New Shout SubCategory Details",
                                      categoryName: data.categoryName,
                                      shoutType: data.subcategoryName!,
                                      description: data.subcategoryDescription,
                                      status: data.status,
                                      name: "Category Name",
                                    );
                                  },
                                ),
                                DataCell(
                                  data.status == "Rejected"
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
                                  //  Icon(
                                  //     Icons.hourglass_top_rounded,
                                  //     color: Colors.grey,
                                  //   ),
                                  onTap: () {
                                    CustomDialogHelper.tableBottomSheet(
                                      title: "New Shout SubCategory Details",
                                      categoryName: data.categoryName,
                                      shoutType: data.subcategoryName!,
                                      description: data.subcategoryDescription,
                                      status: data.status,
                                      name: "Category Name",
                                    );
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
