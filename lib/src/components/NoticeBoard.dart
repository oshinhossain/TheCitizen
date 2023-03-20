import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/base.dart';
import '../helpers/loading.dart';
import '../utility/utility.dart';

class NoticeBoard extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    noticeC.getNoticeByUsername();
    return Obx(
      () => noticeC.notice.isEmpty
          ? noticeC.isLoading.value
              ? SizedBox(
                  height: Get.height / 1.5,
                  child: Center(
                    child: Column(
                      children: [
                        Loading(),
                        SizedBox(height: 25),
                        Text('Retrieving notices...'),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Color(0xFFC2DEE9), width: 1.0),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 12.0),
                      minVerticalPadding: 0.0,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'About TheCitizen App',
                          style: TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 15.0,
                              color: Color(0xFF434969),
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      subtitle: Text(
                        '''In our social life, we encounter various troubles during our travel every day, e.g., social security incidents, utility line/service damage, emergency situations, etc. but the government notices them with much delay which prolongs citizen sufferings. TheCitizen platform is developed to bring all government and private service agencies to a single platform to ensure collaboration with the citizens for resolving public issues.\n\nWe believe that this app would revolutionize the way people interact with the government and private service agencies.''',
                        style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 13.0,
                            color: Color(0xFF434969),
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                )
          : ListView.builder(
              itemCount: noticeC.notice.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (BuildContext context, int index) {
                final item = noticeC.notice[index];
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            margin: EdgeInsets.zero,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                  color: Color(0xFFC2DEE9), width: 1.0),
                            ),
                            color: Color(0xFFC2DEE9),
                            child: Padding(
                              //padding:  EdgeInsets.all(10),
                              padding: EdgeInsets.zero,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Card(
                                      margin: EdgeInsets.zero,
                                      elevation: 0.0,
                                      color: Color(0xFFFFFFFF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: BorderSide(
                                            color: Color(0xFFC2DEE9),
                                            width: 1.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 11.0, vertical: 12.0),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              10,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.subject ??
                                                    'About TheCitizen App',
                                                style: TextStyle(
                                                    fontFamily: 'Manrope',
                                                    fontSize: 15.0,
                                                    color: Color(0xFF434969),
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.left,
                                              ),
                                              SizedBox(height: 10.0),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  '${item.noticeDesc}',
                                                  // 'Maecenas lobortis congue sagittis. Integer rutrum felis vel ligula fringilla volutpat eu quis ante. Suspendisse vel risus tempor, tincidunt dui sit amet, facilisis enim. Maecenas cursus interdum nulla vestibulum dapibus',
                                                  style: TextStyle(
                                                      fontFamily: 'Manrope',
                                                      fontSize: 13.0,
                                                      color: Color(0xFF434969),
                                                      fontWeight:
                                                          FontWeight.w300),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                'Posted by : ${item.createdByFullname}',
                                                style: TextStyle(
                                                    fontFamily: 'Manrope',
                                                    fontSize: 12.0,
                                                    color: Color(0xFF434969),
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    // SizedBox(height: 10),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 14.0, 10.0, 12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              ImageIcon(
                                                AssetImage(
                                                    'assets/images/time_icon_active.png'),
                                                color: Color(0xFF72778F),
                                                size: 12.0,
                                              ),
                                              SizedBox(width: 5.0),
                                              Text(
                                                item.createdAt == ""
                                                    ? ''
                                                    : Utility
                                                        .convertSQLToString(
                                                            item.createdAt
                                                                as String),
                                                style: TextStyle(
                                                    fontFamily: 'Manrope',
                                                    fontSize: 11.0,
                                                    color: Color(0xFF72778F),
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textAlign: TextAlign.right,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              ImageIcon(
                                                AssetImage(
                                                    'assets/images/time_icon_expired.png'),
                                                color: Color(0xFF72778F),
                                                size: 12.0,
                                              ),
                                              SizedBox(width: 5.0),
                                              Text(
                                                item.expiryDate == ""
                                                    ? ''
                                                    : Utility
                                                        .convertSQLToString(
                                                            item.expiryDate
                                                                as String),
                                                style: TextStyle(
                                                    fontFamily: 'Manrope',
                                                    fontSize: 11.0,
                                                    color: Color(0xFF72778F),
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textAlign: TextAlign.right,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                  ],
                );
              },
            ),
    );
  }
}
