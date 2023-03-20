import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/base.dart';
import '../helpers/k_text.dart';

class LeaveBalancePage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Padding(
        padding: const EdgeInsets.all(15.0),
        child: employeeLeaveManageMentC.leaveBalanceList.isEmpty
            ? Container(
                alignment: Alignment.center,
                height: Get.height * 0.73,
                child: KText(bold: true, text: 'No Record Found'),
              )
            : ListView(
                shrinkWrap: true,
                children: employeeLeaveManageMentC.leaveBalanceList
                    .map(
                      (e) => Padding(
                        padding: EdgeInsets.only(
                            right: 10, top: 15, bottom: 10, left: 4),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          width: Get.width - 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10.0,
                                color: Colors.black12,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  KText(
                                    text: 'Leave Type',
                                    fontSize: 16,
                                    bold: true,
                                    maxLines: 2,
                                    textOverflow: TextOverflow.visible,
                                  ),
                                  KText(
                                    text: e?.leaveType!,
                                    fontSize: 16,
                                    bold: true,
                                    maxLines: 2,
                                    textOverflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.black26,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  KText(text: 'Balance as of Now'),
                                  KText(
                                    text: e!.totalBalane!.toString(),
                                    bold: true,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 05,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  KText(text: 'Leave Request'),
                                  KText(
                                      bold: true,
                                      text: e.leaveRequest.toString())
                                ],
                              ),
                              Divider(
                                color: Colors.black26,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  KText(text: 'Balance After leave taken'),
                                  KText(
                                    text: e.balanceAfterLeave.toString(),
                                    bold: true,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList()),
      ),
    ));
  }
}
