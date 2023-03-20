import 'package:flutter/material.dart';

import '../config/app_theme.dart';
import '../helpers/hex_color.dart';
import '../helpers/k_text.dart';

class LeaveRequestDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        title: Text(
          'Leave Request Details',
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 18.0,
            color: AppTheme.textColor6,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: IconThemeData(
          color: AppTheme.textColor6,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Submitted on',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      color: AppTheme.textColor20,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '16 Aug 2022',
                    //'${shoutIncidentsModel.agencyName}',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      color: AppTheme.textColor21,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 14.0),
                  Divider(
                      height: 1.0, color: AppTheme.textColor22, thickness: 1),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Submitted by',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          color: AppTheme.textColor20,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 11.5),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20.0,
                            backgroundColor: AppTheme.textColor1,
                            child: Container(
                              width: 44,
                              height: 44,
                              child: Image.asset(
                                  'assets/images/profile_avatar.png'),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          //  Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mehedi Hassan',
                                //'${shoutIncidentsModel.agencyName}',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  color: AppTheme.textColor21,
                                  fontSize: 15,
                                  height: 1,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'mehedi.hassan@gmail.com',
                                //'${shoutIncidentsModel.agencyName}',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  color: AppTheme.textColor20,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '01765434156',
                                //'${shoutIncidentsModel.agencyName}',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  color: AppTheme.textColor20,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 14.0),
                  Divider(
                      height: 1.0, color: AppTheme.textColor22, thickness: 1),
                  SizedBox(height: 15),
                  Text(
                    'Leave Type',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      color: AppTheme.textColor20,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Sick Leave',
                    //'${shoutIncidentsModel.agencyName}',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      color: AppTheme.textColor21,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 14.0),
                  Divider(
                      height: 1.0, color: AppTheme.textColor22, thickness: 1),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Date',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          color: AppTheme.textColor20,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Text(
                            '23 Aug 2022',
                            //'${shoutIncidentsModel.agencyName}',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              color: AppTheme.textColor21,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.star,
                            size: 16,
                            color: AppTheme.textColor10,
                          ),
                          SizedBox(width: 10.83),
                          Text(
                            '2nd Half',
                            //'${shoutIncidentsModel.agencyName}',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              color: AppTheme.textColor21,
                              fontSize: 15,
                              height: 1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.86),
                  Divider(
                      height: 1.0, color: AppTheme.textColor22, thickness: 1),
                  SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Date',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          color: AppTheme.textColor20,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Text(
                            '24 Aug 2022',
                            //'${shoutIncidentsModel.agencyName}',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              color: AppTheme.textColor21,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.star,
                            size: 16,
                            color: AppTheme.textColor10,
                          ),
                          SizedBox(width: 10.83),
                          Text(
                            'Full Day',
                            //'${shoutIncidentsModel.agencyName}',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              color: AppTheme.textColor21,
                              fontSize: 15,
                              height: 1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.86),
                  Divider(
                      height: 1.0, color: AppTheme.textColor22, thickness: 1),
                  SizedBox(height: 15.0),
                  Text(
                    'Leave Duration',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      color: AppTheme.textColor20,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '15 Days',
                    //'${shoutIncidentsModel.agencyName}',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      color: AppTheme.textColor21,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 15.72),
                  Divider(
                      height: 1.0, color: AppTheme.textColor22, thickness: 1),
                  SizedBox(height: 15.0),
                  Text(
                    'Purpose',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      color: AppTheme.textColor20,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Injury in my hand',
                    //'${shoutIncidentsModel.agencyName}',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      color: AppTheme.textColor21,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 14.0),
                  Divider(
                      height: 1.0, color: AppTheme.textColor22, thickness: 1),
                  SizedBox(height: 15.0),
                  Text(
                    'Attachment',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      color: AppTheme.textColor20,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 56,
                        child: Image.asset('assets/images/tin.png'),
                      ),
                      Container(
                        width: 100,
                        height: 56,
                        child: Image.asset('assets/images/travelling.png'),
                      ),
                      Container(
                        width: 100,
                        height: 56,
                        child:
                            Image.asset('assets/images/travel_requisition.png'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.86),
                  Divider(
                      height: 1.0, color: AppTheme.textColor22, thickness: 1),
                  SizedBox(height: 15.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Interim Contact Person',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          color: AppTheme.textColor20,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 11.5),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20.0,
                            backgroundColor: AppTheme.textColor1,
                            child: Container(
                              width: 44,
                              height: 44,
                              child: Image.asset('assets/images/user.png'),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          //  Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mohammad Abdul Rahim',
                                //'${shoutIncidentsModel.agencyName}',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  color: AppTheme.textColor21,
                                  fontSize: 15,
                                  height: 1,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'ctrends.setet@gmail.com',
                                //'${shoutIncidentsModel.agencyName}',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  color: AppTheme.textColor20,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '01765434156',
                                //'${shoutIncidentsModel.agencyName}',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  color: AppTheme.textColor20,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 11.5),
                  Divider(
                      height: 1.0, color: AppTheme.textColor22, thickness: 1),
                  SizedBox(height: 15.0),
                  Text(
                    'Emergency Contact No',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      color: AppTheme.textColor20,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '01768654178',
                    //'${shoutIncidentsModel.agencyName}',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      color: AppTheme.textColor21,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 14.0),
                  Divider(
                      height: 1.0, color: AppTheme.textColor22, thickness: 1),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Leave Balance',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          color: AppTheme.textColor20,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 11.5),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: DataTable(
                                  columnSpacing: 10,
                                  showCheckboxColumn: false,
                                  horizontalMargin: 10,
                                  dividerThickness: 1,
                                  showBottomBorder: true,
                                  // dataRowHeight: 45,
                                  headingRowColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => AppTheme.textColor16),
                                  headingRowHeight: 51,
                                  dataRowHeight: 35,
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1.0,
                                            color: AppTheme.textColor39)),
                                  ),
                                  headingTextStyle: TextStyle(
                                    fontFamily: 'Manrope',
                                    fontSize: 14.0,
                                    color: AppTheme.textColor15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  dataTextStyle: TextStyle(
                                    fontFamily: 'Manrope',
                                    fontSize: 12.0,
                                    color: AppTheme.textColor42,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  columns: [
                                    DataColumn(
                                      label: Text(
                                        'Type',
                                        style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontSize: 14.0,
                                          color: AppTheme.textColor15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Balance',
                                              style: TextStyle(
                                                fontFamily: 'Manrope',
                                                fontSize: 14.0,
                                                color: AppTheme.textColor15,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              'as of now',
                                              style: TextStyle(
                                                fontFamily: 'Manrope',
                                                fontSize: 14.0,
                                                color: AppTheme.textColor15,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      numeric: false,
                                    ),
                                    DataColumn(
                                      label: Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Leave',
                                              style: TextStyle(
                                                fontFamily: 'Manrope',
                                                fontSize: 14.0,
                                                color: AppTheme.textColor15,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              'Request',
                                              style: TextStyle(
                                                fontFamily: 'Manrope',
                                                fontSize: 14.0,
                                                color: AppTheme.textColor15,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      numeric: false,
                                    ),
                                    DataColumn(
                                      label: Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Balance after',
                                              style: TextStyle(
                                                fontFamily: 'Manrope',
                                                fontSize: 14.0,
                                                color: AppTheme.textColor15,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              'leave taken',
                                              style: TextStyle(
                                                fontFamily: 'Manrope',
                                                fontSize: 14.0,
                                                color: AppTheme.textColor15,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      numeric: false,
                                    ),
                                  ],

                                  rows: <DataRow>[
                                    DataRow(
                                      cells: <DataCell>[
                                        DataCell(
                                          Text(
                                            'EL',
                                            // Utility.isEmptyString(shout.createdOn)
                                            //     ? ''
                                            //     : Utility.formatDate(Utility.convertStringSQLToDate(shout.createdOn)),
                                            style: TextStyle(
                                              fontFamily: 'Manrope',
                                              fontSize: 12.0,
                                              color: AppTheme.textColor42,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          onTap: () {
                                            //myApprovalDashboardDialog(context, shout, 1);
                                          },
                                        ),
                                        DataCell(
                                          Text(
                                            '15',
                                            //Utility.isEmptyString(shout.type) ? '' : shout.type,
                                            style: TextStyle(
                                              fontFamily: 'Manrope',
                                              fontSize: 12.0,
                                              color: AppTheme.textColor42,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          onTap: () {
                                            // myApprovalDashboardDialog(context, shout, 1);
                                          },
                                        ),
                                        DataCell(
                                          Text(
                                            '01',
                                            //Utility.isEmptyString(shout.type) ? '' : shout.type,
                                            style: TextStyle(
                                              fontFamily: 'Manrope',
                                              fontSize: 12.0,
                                              color: AppTheme.textColor42,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          onTap: () {
                                            // myApprovalDashboardDialog(context, shout, 1);
                                          },
                                        ),
                                        DataCell(
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(width: 10.0),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppTheme.cardColor,
              blurRadius: 10.0,
            )
          ],
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: 40,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 30,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                color: Colors.red,
              ),
              child: Center(
                child: KText(
                  text: 'Reject',
                  bold: true,
                  fontSize: 16,
                  color: hexToColor('#FFFFFF'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 30,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                color: Colors.green,
              ),
              child: Center(
                child: KText(
                  text: 'Approve',
                  bold: true,
                  fontSize: 16,
                  color: hexToColor('#FFFFFF'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 50,
          ),
        ]),
      ),
    );
  }
}
