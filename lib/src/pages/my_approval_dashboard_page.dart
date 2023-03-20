import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import '../config/app_theme.dart';
import '../widgets/centered_message.dart';
import 'leave_request_details.dart';

class MyApprovalDashboardPage extends StatefulWidget {
  const MyApprovalDashboardPage({Key? key}) : super(key: key);

  @override
  State<MyApprovalDashboardPage> createState() =>
      _MyApprovalDashboardPageState();
}

class _MyApprovalDashboardPageState extends State<MyApprovalDashboardPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.newAppBarBackgroundColor,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'My Attendance',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 18.0,
              color: AppTheme.textColor6,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: GestureDetector(
              onTap: () {
                back();
              },
              child: Icon(Icons.arrow_back)),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: Material(
              color: AppTheme.bannerColor1, // #78909C
              child: Container(
                height: 44.75,
                padding: EdgeInsets.only(
                    left: 30.0, top: 14.75, right: 30.0, bottom: 0.0),
                child: Container(
                  //color: Colors.white.withOpacity(0.5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                    ),
                  ),
                  child: _tabBar,
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              ApprovalRequestTab(),
              MyRequestTab(),
            ],
          ),
        ),
      ),
    );
  }

  TabBar get _tabBar => TabBar(
        labelColor: AppTheme.textColor6,
        labelStyle: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 14.0,
          color: AppTheme.textColor6,
          fontWeight: FontWeight.w700,
        ),
        indicator: BoxDecoration(
          borderRadius: _selectedIndex == 0
              ? BorderRadius.only(
                  topRight: Radius.circular(5.0), topLeft: Radius.circular(5.0))
              : _selectedIndex == 1
                  ? BorderRadius.only(topRight: Radius.circular(5.0))
                  : null,
          color: AppTheme.textColor1,
        ),
        indicatorWeight: 1,
        indicatorColor: AppTheme.textColor1,
        indicatorSize: TabBarIndicatorSize.tab,
        //unselectedLabelColor: Colors.blue,
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 14.0,
          color: AppTheme.textColor6,
          fontWeight: FontWeight.w700,
        ),
        isScrollable: false,
        physics: BouncingScrollPhysics(),
        tabs: [
          Tab(
            text: 'Approval Requests',
          ),
          Tab(
            text: 'My Requests',
          ),
        ],
        onTap: (tabIndex) {
          setState(
            () {
              _selectedIndex = tabIndex;
            },
          );
        },
      );
}

class MyRequestTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.0, color: AppTheme.textColor39)),
            ),
            child: ExpansionTile(
              tilePadding: EdgeInsets.all(5),
              iconColor: AppTheme.appBarColor,
              textColor: Colors.black,
              backgroundColor: AppTheme.textColor1,
              childrenPadding: EdgeInsets.zero,
              // leading: Padding(
              //   padding: const EdgeInsets.only(left: 15.0),
              //   child: ImageIcon(
              //     AssetImage('assets/icons/leave_icon_new.png'),
              //     color: appBarColor,
              //     size: 25, //category.imageSize,
              //   ),
              // ),
              title: Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage('assets/icons/leave_icon_new.png'),
                      color: AppTheme.appBarColor,
                      size: 25, //category.imageSize,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Leave Requests:',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 15.0,
                          color: AppTheme.textColor4,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: AppTheme.textColor10,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1.5,
                              color: AppTheme.textColor10,
                              style: BorderStyle.solid),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '${0}',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 16.0,
                              color: AppTheme.textColor1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      flex: 0,
                    ),
                  ],
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.0, color: AppTheme.textColor1)),
                    ),
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return _buildLeaveListItemCard();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.0, color: AppTheme.textColor39)),
            ),
            child: ExpansionTile(
              tilePadding: EdgeInsets.all(5),
              iconColor: AppTheme.appBarColor,
              textColor: Colors.black,
              backgroundColor: AppTheme.textColor1,
              childrenPadding: EdgeInsets.zero,
              // leading: Padding(
              //   padding: const EdgeInsets.only(left: 15.0),
              //   child: ImageIcon(
              //     AssetImage('assets/icons/notice_icon.png'),
              //     color: appBarColor,
              //     size: 25, //category.imageSize,
              //   ),
              // ),
              title: Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                child: Row(children: [
                  ImageIcon(
                    AssetImage('assets/icons/notice_icon.png'),
                    color: AppTheme.appBarColor,
                    size: 25, //category.imageSize,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Notice Requests:',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 15.0,
                      color: AppTheme.textColor4,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppTheme.textColor10,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1.5,
                            color: AppTheme.textColor10,
                            style: BorderStyle.solid),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '0',
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 16.0,
                            color: AppTheme.textColor1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    flex: 0,
                  ),
                ]),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                    color: AppTheme.textColor1,
                    height: 100,
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return _buildBlankListItem();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlankListItem() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: SizedBox(
              width: 360,
              child: DataTable(
                columnSpacing: 10,
                showCheckboxColumn: false,
                horizontalMargin: 10,
                dividerThickness: 1,
                showBottomBorder: true,
                dataRowHeight: 45,
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => AppTheme.textColor16),
                headingRowHeight: 35,
                //dataRowHeight: 35,
                decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1.0, color: AppTheme.textColor39)),
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
                      'Date',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 14.0,
                        color: AppTheme.textColor15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Responded by',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 14.0,
                        color: AppTheme.textColor15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Status',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 14.0,
                        color: AppTheme.textColor15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],

                rows: <DataRow>[
                  DataRow(cells: <DataCell>[
                    DataCell(
                      Text(
                        '',
                      ),
                      onTap: () {
                        //myApprovalDashboardDialog(context, shout, 1);
                      },
                    ),
                    DataCell(
                      Text(
                        '',
                      ),
                      onTap: () {
                        // myApprovalDashboardDialog(context, shout, 1);
                      },
                    ),
                    DataCell(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                  ], onSelectChanged: (value) {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeaveListItemCard() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: SizedBox(
              width: 360,
              child: DataTable(
                columnSpacing: 10,
                showCheckboxColumn: false,
                horizontalMargin: 10,
                dividerThickness: 1,
                showBottomBorder: true,
                dataRowHeight: 45,
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => AppTheme.textColor16),
                headingRowHeight: 35,
                //dataRowHeight: 35,
                decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1.0, color: AppTheme.textColor39)),
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
                      'Date',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 14.0,
                        color: AppTheme.textColor15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Responded by',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 14.0,
                        color: AppTheme.textColor15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Status',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 14.0,
                        color: AppTheme.textColor15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],

                rows: <DataRow>[
                  DataRow(cells: <DataCell>[
                    DataCell(
                      Text(
                        '16Aug2022',
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
                        'Nayeem Ahmad',
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                  ], onSelectChanged: (value) {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ApprovalRequestTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.0, color: AppTheme.textColor39)),
            ),
            child: ExpansionTile(
              tilePadding: EdgeInsets.all(5),
              iconColor: AppTheme.appBarColor,
              textColor: Colors.black,
              backgroundColor: AppTheme.textColor1,
              childrenPadding: EdgeInsets.zero,
              // leading: Padding(
              //   padding: const EdgeInsets.only(left: 15.0),
              //   child: ImageIcon(
              //     AssetImage('assets/icons/leave_icon_new.png'),
              //     color: appBarColor,
              //     size: 25, //category.imageSize,
              //   ),
              // ),
              title: Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage('assets/icons/leave_icon_new.png'),
                      color: AppTheme.appBarColor,
                      size: 25, //category.imageSize,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Leave Requests:',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 15.0,
                          color: AppTheme.textColor4,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: AppTheme.textColor10,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1.5,
                              color: AppTheme.textColor10,
                              style: BorderStyle.solid),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '${0}',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 16.0,
                              color: AppTheme.textColor1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      flex: 0,
                    ),
                  ],
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.0, color: AppTheme.textColor1)),
                    ),
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return _buildLeaveListItemCard();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.0, color: AppTheme.textColor39)),
            ),
            child: ExpansionTile(
              tilePadding: EdgeInsets.all(5),
              iconColor: AppTheme.appBarColor,
              textColor: Colors.black,
              backgroundColor: AppTheme.textColor1,
              childrenPadding: EdgeInsets.zero,
              // leading: Padding(
              //   padding: const EdgeInsets.only(left: 15.0),
              //   child: ImageIcon(
              //     AssetImage('assets/icons/notice_icon.png'),
              //     color: appBarColor,
              //     size: 25, //category.imageSize,
              //   ),
              // ),
              title: Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                child: Row(children: [
                  ImageIcon(
                    AssetImage('assets/icons/notice_icon.png'),
                    color: AppTheme.appBarColor,
                    size: 25, //category.imageSize,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Notice Requests:',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 15.0,
                      color: AppTheme.textColor4,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppTheme.textColor10,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1.5,
                            color: AppTheme.textColor10,
                            style: BorderStyle.solid),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '0',
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 16.0,
                            color: AppTheme.textColor1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    flex: 0,
                  ),
                ]),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                    color: AppTheme.textColor1,
                    height: 100,
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return _buildBlankListItem();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlankListItem() {
    return Center(
      //child: Text(''),
      child: CenteredMessage(
          message: "0 Pending request found", icon: Icons.error),
    );
  }

  Widget _buildLeaveListItemCard() {
    return InkWell(
      onTap: () {
        Get.to(LeaveRequestDetails());
      },
      child: Card(
        child: Container(
          height: 35,
          //color: textColor34,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppTheme.textColor34, //remove color to make it transpatent
            border: Border.all(
              width: 0.0,
              style: BorderStyle.solid,
              color: AppTheme.textColor34,
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                '12 Jul 2022',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 14.0,
                  color: AppTheme.textColor6,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'Md. Shumon Iqbal',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 14.0,
                  color: AppTheme.textColor6,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
