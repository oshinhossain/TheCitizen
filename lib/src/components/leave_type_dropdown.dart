import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/models/team_leave_type_model.dart';

import '../helpers/hex_color.dart';
import '../helpers/k_log.dart';
import '../helpers/k_text.dart';

class LeaveTypeComponent extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => employeeLeaveManageMentC.leaveTypeList.isEmpty
          ? SizedBox()
          : Container(
              width: Get.width,
              height: 55,
              child: DropdownButton<TeamLeaveTypeModel>(
                value: employeeLeaveManageMentC.selectedleaveType.value,
                underline: Container(
                  height: 1,
                  color: hexToColor('#72778F'),
                ),
                icon: SizedBox(
                  width: 25,
                  height: 25,
                  child: ImageIcon(
                    AssetImage("assets/images/down_arrow.png"),
                    color: Color(0xFF8C8D92),
                    size: 24,
                  ),
                ),
                isExpanded: true,
                // isDense: true,
                alignment: Alignment.bottomCenter,
                // elevation: 4,

                items: employeeLeaveManageMentC.leaveTypeList
                    .map(
                      (e) => DropdownMenuItem<TeamLeaveTypeModel>(
                        value: e,
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: KText(
                            text: e!.leaveName!,
                            bold: true,
                            // fontSize: 15,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (x) async {
                  employeeLeaveManageMentC.selectedleaveType.value = x;
                  kLog(agencyC.selectedAgency!.agencyId);
                },
              ),
            ),
    );
  }
}
