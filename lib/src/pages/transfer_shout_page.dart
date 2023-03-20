import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/custom_textfield_with_dropdown.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import 'package:the_citizen_app/src/pages/process_shout_page.dart';

class TransferShoutPage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    validateShoutC.getValidateShout();
    validateShoutC.getUnitData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppTheme.newAppBarBackgroundColor,
        title: KText(
          text: 'Transfer Shouts',
          bold: true,
          fontSize: 16,
        ),
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KText(
                text: 'Unit',
                fontSize: 16,
              ),
              validateShoutC.isLoadding.value
                  ? KText(text: '')
                  : CustomTextFieldWithDropdown(
                      suffix: DropdownButton(
                        value: validateShoutC.selectedUnit.value!.unitName,
                        underline: Container(),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: hexToColor('#80939D'),
                        ),
                        items: validateShoutC.unitList.map((item) {
                          return DropdownMenuItem(
                            onTap: () {
                              validateShoutC.selectedUnit.value = item;

                              //  siteCompletionC.pId.value = item.id!;
                            },
                            value: item.unitName,
                            child: SizedBox(
                              width: Get.width * .85,
                              child: KText(
                                text: item.unitName,
                                fontSize: 13,
                                maxLines: 2,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (item) {
                          //// kLog('value');
                        },
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              KText(
                text: 'Location',
                fontSize: 16,
              ),
              validateShoutC.isLoadding.value
                  ? KText(text: '')
                  : CustomTextFieldWithDropdown(
                      suffix: DropdownButton(
                        value: validateShoutC.selectedLocation.value!.locationName,
                        underline: Container(),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: hexToColor('#80939D'),
                        ),
                        items: validateShoutC.locationList.map((item) {
                          return DropdownMenuItem(
                            onTap: () {
                              validateShoutC.selectedLocation.value = item;
                              //  siteCompletionC.pId.value = item.id!;
                            },
                            value: item.locationName,
                            child: SizedBox(
                              width: Get.width * .85,
                              child: KText(
                                text: item.locationName,
                                fontSize: 13,
                                maxLines: 2,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (item) {
                          //// kLog('value');
                        },
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              DataTable(
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
                      "type",
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
                  DataColumn(
                    label: Text(
                      "Urgency",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    numeric: false,
                  ),
                ],
                rows: validateShoutC.validateShoutList
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
                            Center(child: KText(text: "${data.fulfillmentStatus}")),
                            onTap: () {
                              push(ProcessShoutPage(
                                rateShoutClosure: data,
                                title: 'startTask',
                              ));
                            },
                          ),
                          DataCell(
                            Center(child: KText(text: "${data.urgencyLevel}")),
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
            ],
          ),
        ),
      ),
    );
  }
}
