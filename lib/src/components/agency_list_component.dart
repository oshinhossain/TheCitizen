import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';

import '../config/base.dart';
import '../helpers/k_text.dart';
import '../hive_models/agency_model.dart';

class AgencyListComponent extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => agencyC.agencies.isEmpty
          ? SizedBox()
          : Container(
              width: Get.width,
              height: 55,
              child: DropdownButton<AgencyModel>(
                value: agencyC.selectedAgency,
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

                items: agencyC.agencies
                    .map(
                      (e) => DropdownMenuItem<AgencyModel>(
                        value: e,
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: KText(
                            text: e.agencyName,
                            bold: true,
                            // fontSize: 15,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (x) async {
                  kLog(userC.currentUser.value != null.toString() + ' : ');

                  agencyC.setSelectedAgency = x;
                  kLog(agencyC.selectedAgency!.latitude!.toString() +
                      ' ' +
                      agencyC.selectedAgency!.longitude!.toString());
                  kLog(agencyC.selectedAgency!.agencyId);
                  attendanceC.stopWatchTimer.value.setPresetSecondTime(0);
                  attendanceC.stopWatchTimer.value.onStopTimer();
                  // attendanceC.stopWatchTimer.value = StopWatchTimer(
                  //   mode: StopWatchMode.countUp,
                  //   presetMillisecond:
                  //       StopWatchTimer.getMilliSecFromSecond(0),
                  // );
              await    employeeLeaveManageMentC.getLeaveTypeList();
                  agencyC.putSelectedAgency(x);
                  // await attendanceC.getAttendaneHistory();
                },
              ),
            ),
    );
  }
}
