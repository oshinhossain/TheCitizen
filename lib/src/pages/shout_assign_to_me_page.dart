import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';

import '../config/app_theme.dart';
import '../helpers/k_text.dart';

class ShoutAssignToMePage extends StatefulWidget {
//  final String title;

//  const ShoutAssignToMe({Key key, this.title}) : super(key: key);

  @override
  _ShoutAssignToMePageState createState() => _ShoutAssignToMePageState();
}

class _ShoutAssignToMePageState extends State<ShoutAssignToMePage> {
  //ShoutAssignToMeBloc _assignToMeBloc;
  final _scrollControllerPending = ScrollController();
  final _scrollControllerSettled = ScrollController();
  // final _scrollThreshold = 200.0;

  void _onScrollPending() {
    // final maxScroll = _scrollControllerPending.position.maxScrollExtent;
    // final currentScroll = _scrollControllerPending.position.pixels;
    // if (maxScroll - currentScroll <= _scrollThreshold) {
    //   _assignToMeBloc.add(ShoutAssignToMeLoad("PENDING"));
    // }
  }

  void _onScrollSettled() {
    // final maxScroll = _scrollControllerSettled.position.maxScrollExtent;
    // final currentScroll = _scrollControllerSettled.position.pixels;
    // if (maxScroll - currentScroll <= _scrollThreshold) {
    //   _assignToMeBloc.add(ShoutAssignToMeLoad("SETTLED"));
    // }
  }

  @override
  void initState() {
    super.initState();

    _scrollControllerPending.addListener(_onScrollPending);
    _scrollControllerSettled.addListener(_onScrollSettled);
    // _assignToMeBloc = BlocProvider.of<ShoutAssignToMeBloc>(context);
    // _assignToMeBloc.emit(ShoutAssignToMeState());
    // _assignToMeBloc.add(ShoutAssignToMeLoad("PENDING"));
    // _assignToMeBloc.add(ShoutAssignToMeLoad("SETTLED"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppTheme.backgroundColor,
          iconTheme: IconThemeData(
            color: AppTheme.textColor6,
          ),
          title: KText(
            text: 'Assign To Me',
            color: AppTheme.appBarTextColor,
            fontSize: 18,
            bold: true,
          ),
        ),
        body: Container(
          color: hexToColor('#FFFFFF'),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Pending',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 16.0,
                        color: hexToColor('#150B3D'),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    flex: 0,
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: hexToColor('#F2BA14'),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '0',
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 16.0,
                            color: hexToColor('#FFFFFF'),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    flex: 0,
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              _ShoutAssignToMeDataTable(_scrollControllerPending),
              _ShowSettledShoutsDataTableCheckBox(),
              SizedBox(height: 5.0),
              _ShowSettledShoutsDataTableView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoutAssignToMeDataTable extends StatelessWidget {
  // ignore: unused_field
  final _scrollControllerPending;

  _ShoutAssignToMeDataTable(this._scrollControllerPending);

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<ShoutAssignToMeBloc, ShoutAssignToMeState>(
    //   buildWhen: (p, c) => p.pendingShouts != c.pendingShouts,
    //   builder: (BuildContext context, state) {
    //     if (state.status == ShoutAssignToMeStatus.LOADING_PENDING) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        height: 30,
        width: 25,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: hexToColor('#F2BA14'),
        ),
      ),
    );
    // return CenteredMessage(icon: Icons.info, message: "Start fetching...");

    // else if (state.status == ShoutAssignToMeStatus.SUCCESS_PENDING) {
    //   return buildData(state.pendingShouts, context);
    // } else if (state.status == ShoutAssignToMeStatus.EMPTY_PENDING) {
    //   return Padding(
    //     padding: const EdgeInsets.only(bottom: 20),
    //     child:
    //     CenteredMessage(icon: Icons.info, message: "No pending shout!"),
    //   );
    // }
    // else {
    //   // return CenteredMessage(icon: Icons.error, message: "Failed to load pending shout!");
    //   return Container(
    //     padding: EdgeInsets.all(20),
    //     child: SizedBox(
    //       height: 30,
    //       width: 25,
    //       child: CircularProgressIndicator(
    //         strokeWidth: 2,
    //         color: hexToColor('#F2BA14'),
    //       ),
    //     ),
    //   );
    // }
  }

  Widget buildData() {
    return Expanded(
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: DataTable(
              headingRowHeight: 35,
              columnSpacing: 20,
              showCheckboxColumn: false,
              horizontalMargin: 10,
              dividerThickness: 1,
              showBottomBorder: true,
              headingRowColor: MaterialStateColor.resolveWith(
                  (states) => hexToColor('#EFF6FF')),
              columns: [
                DataColumn(
                    label: Text(
                  'Date',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 15.0,
                    color: hexToColor('#141C44'),
                    fontWeight: FontWeight.w700,
                  ),
                )),
                DataColumn(
                    label: Text(
                  'Category',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 15.0,
                    color: hexToColor('#141C44'),
                    fontWeight: FontWeight.w700,
                  ),
                )),
                DataColumn(
                    label: Text(
                  'Type',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 15.0,
                    color: hexToColor('#141C44'),
                    fontWeight: FontWeight.w700,
                  ),
                )),
                DataColumn(
                    label: Text(
                  'Status',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 15.0,
                    color: hexToColor('#141C44'),
                    fontWeight: FontWeight.w700,
                  ),
                )),
                DataColumn(
                    label: Text(
                  'Shout Age',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 15.0,
                    color: hexToColor('#141C44'),
                    fontWeight: FontWeight.w700,
                  ),
                )),
              ],
              rows: [
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Text(
                        '',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 12.0,
                          color: hexToColor('#524B6B'),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        // showMyReportDetails(context, shout, 1);
                        // context
                        //     .read<ShoutAssignToMeBloc>()
                        //     .add(ShoutAssignToMeImageFetched(shout));
                      },
                    ),
                    DataCell(
                      Text(
                        '',
                        // Utility.isEmptyString(shout.categoryName)
                        //     ? ''
                        //     : shout.categoryName,
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 12.0,
                          color: hexToColor('#524B6B'),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        // showMyReportDetails(context, shout, 1);
                        // context
                        //     .read<ShoutAssignToMeBloc>()
                        //     .add(ShoutAssignToMeImageFetched(shout));
                      },
                    ),
                    DataCell(
                      Text(
                        '',
                        // Utility.isEmptyString(shout.subcategoryName)
                        //     ? ''
                        //     : shout.subcategoryName,
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 12.0,
                          color: hexToColor('#524B6B'),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        // showMyReportDetails(context, shout, 1);
                        // context
                        //     .read<ShoutAssignToMeBloc>()
                        //     .add(ShoutAssignToMeImageFetched(shout));
                      },
                    ),
                    DataCell(
                      // Utility.isEmptyString(shout.fulfillmentStatus) ?
                      Text(''),
                      //   : Align(
                      // child: Utility.generateIconBasedOnStatus(
                      //     shout.fulfillmentStatus),
                      // alignment: Alignment.center,

                      onTap: () {
                        // showMyReportDetails(context, shout, 1);
                        // context
                        //     .read<ShoutAssignToMeBloc>()
                        //     .add(ShoutAssignToMeImageFetched(shout));
                      },
                    ),
                    DataCell(
                      Align(
                        child: Align(
                          child: Text(
                            '',
                            // Utility.isEmptyString(shout.shoutAge.toString())
                            //     ? ''
                            //     : shout.shoutAge.toString(),
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 12.0,
                              color: hexToColor('#524B6B'),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                        alignment: Alignment.center,
                      ),
                      onTap: () {
                        // showMyReportDetails(context, shout, 1);
                        // context
                        //     .read<ShoutAssignToMeBloc>()
                        //     .add(ShoutAssignToMeImageFetched(shout));
                      },
                    ),
                  ],
                ),
              ],
              // shouts
              //     .map(
              //       (shout) =>
              // )
              //     .toList(),
            ),
          ),
        ),
      ),
      flex: 1,
    );
  }
}

class _ShowSettledShoutsDataTableCheckBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<ShoutAssignToMeBloc, ShoutAssignToMeState>(
    //   buildWhen: (p, c) =>
    //   p.isCheckShowDataTableView != c.isCheckShowDataTableView ||
    //       p.settledShouts != c.settledShouts,
    //   builder: (context, state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: 24.0,
            width: 24.0,
            child: Checkbox(
              fillColor: MaterialStateColor.resolveWith(
                  (states) => hexToColor('#78909C')),
              activeColor: hexToColor('#78909C'),
              value: false,
              onChanged: (newValue) {
                // BlocProvider.of<ShoutAssignToMeBloc>(context)
                //     .add(ShoutAssignToMeSettled(newValue));
              },
            ),
          ),
          flex: 0,
        ),
        SizedBox(width: 5.0),
        Expanded(
          child: Text(
            'Show Settled Shouts',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 16.0,
              color: hexToColor('#150B3D'),
              fontWeight: FontWeight.w400,
            ),
          ),
          flex: 0,
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: hexToColor('#F2BA14'),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                ' 0 ',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 16.0,
                  color: hexToColor('#FFFFFF'),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          flex: 0,
        ),
      ],
    );
  }
}

class _ShowSettledShoutsDataTableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<ShoutAssignToMeBloc, ShoutAssignToMeState>(
    //   buildWhen: (p, c) =>
    //   p.status != c.status || p.isCheckShowDataTableView == true,
    //   builder: (context, state) {
    //     if (state.status == ShoutAssignToMeStatus.LOADING_SETTLED) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        height: 30,
        width: 25,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: hexToColor('#F2BA14'),
        ),
      ),
    );
    //  return CenteredMessage(icon: Icons.info, message: "Start fetching...");
    // } else if (state.status == ShoutAssignToMeStatus.SUCCESS_SETTLED) {
    //   return buildSettledData(
    //       state.isCheckShowDataTableView, state.settledShouts, context);
    // } else if (state.status == ShoutAssignToMeStatus.EMPTY_SETTLED) {
    //   return Padding(
    //     padding: const EdgeInsets.only(bottom: 20),
    //     child:
    //     CenteredMessage(icon: Icons.info, message: "No settled shout"),
    //   );
    // } else if (state.status == ShoutAssignToMeStatus.FAILURE) {
    //   return CenteredMessage(
    //       icon: Icons.error, message: "Failed to load settled shout!");
    // } else {
    //   // return CenteredMessage(icon: Icons.info, message: "Check to fetch settled shout");
    //   return Container(
    //     padding: EdgeInsets.all(20),
    //     child: SizedBox(
    //       height: 30,
    //       width: 25,
    //       child: CircularProgressIndicator(
    //         strokeWidth: 2,
    //         color: hexToColor('#F2BA14'),
    //       ),
    //     ),
    //   );
    // }
  }

  Widget buildSettledData() {
    return Visibility(
      visible: true,
      child: Expanded(
        child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: DataTable(
                headingRowHeight: 35,
                columnSpacing: 20,
                showCheckboxColumn: false,
                horizontalMargin: 10,
                dividerThickness: 1,
                showBottomBorder: true,
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => hexToColor('#EFF6FF')),
                columns: [
                  DataColumn(
                      label: Text(
                    'Date',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 15.0,
                      color: hexToColor('#141C44'),
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                  DataColumn(
                      label: Text(
                    'Category',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 15.0,
                      color: hexToColor('#141C44'),
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                  DataColumn(
                      label: Text(
                    'Type',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 15.0,
                      color: hexToColor('#141C44'),
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                  DataColumn(
                      label: Text(
                    'Closure Type',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 15.0,
                      color: hexToColor('#141C44'),
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                  DataColumn(
                      label: Text(
                    'Closure Time(days)',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 15.0,
                      color: hexToColor('#141C44'),
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                ],
                rows: [
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text(
                          '',
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 12.0,
                            color: hexToColor('#524B6B'),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          // showMyReportDetails(context, shout, 2);
                          // context
                          //     .read<ShoutAssignToMeBloc>()
                          //     .add(ShoutAssignToMeImageFetched(shout));
                        },
                      ),
                      DataCell(
                        Text(
                          '',
                          // Utility.isEmptyString(shout.categoryName)
                          //     ? ''
                          //     : shout.categoryName,
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 12.0,
                            color: hexToColor('#524B6B'),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          // showMyReportDetails(context, shout, 2);
                          // context
                          //     .read<ShoutAssignToMeBloc>()
                          //     .add(ShoutAssignToMeImageFetched(shout));
                        },
                      ),
                      DataCell(
                        Text(
                          '',
                          // Utility.isEmptyString(shout.subcategoryName)
                          //     ? ''
                          //     : shout.subcategoryName,
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 12.0,
                            color: hexToColor('#524B6B'),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          // showMyReportDetails(context, shout, 2);
                          // context
                          //     .read<ShoutAssignToMeBloc>()
                          //     .add(ShoutAssignToMeImageFetched(shout));
                        },
                      ),
                      DataCell(
                        //  Utility.isEmptyString(shout.fulfillmentStatus)?
                        Text(''),
                        // : Utility.generateTextBasedOnStatus(shout.fulfillmentStatus),
                        //     : Align(
                        //   child: Utility.generateIconBasedOnStatus(
                        //       shout.fulfillmentStatus),
                        //   alignment: Alignment.center,
                        // ),
                        onTap: () {
                          // showMyReportDetails(context, shout, 2);
                          // context
                          //     .read<ShoutAssignToMeBloc>()
                          //     .add(ShoutAssignToMeImageFetched(shout));
                        },
                      ),
                      DataCell(
                        Align(
                          child: Text(
                            '',
                            //   Utility.isEmptyString(shout.shoutAge.toString())?

                            // : shout.shoutAge.toString(),
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 12.0,
                              color: hexToColor('#524B6B'),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                        onTap: () {
                          // showMyReportDetails(context, shout, 2);
                          // context
                          //     .read<ShoutAssignToMeBloc>()
                          //     .add(ShoutAssignToMeImageFetched(shout));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget showMyReportDetails(context) {
//   // context.read<ShoutAssignToMeBloc>().add(CommentChangeToState(''));
//   showDialog(
//     context: context,
//     builder: (context) {
//       return Dialog(
//         insetPadding: EdgeInsets.symmetric(horizontal: 25),
//         elevation: 5,
//         backgroundColor: Colors.transparent,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(top: 13, bottom: 13),
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: hexToColor('#78909C'),
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(5),
//                     topRight: Radius.circular(5),
//                   ),
//                 ),
//                 child: const Text(
//                   'Shout Details',
//                   style: TextStyle(
//                     fontFamily: 'Manrope',
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(5),
//                     bottomRight: Radius.circular(5),
//                   ),
//                 ),
//                 // spacing inside the box
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     RichText(
//                       text: TextSpan(
//                         children: <TextSpan>[
//                           TextSpan(
//                               text: '${myReport.categoryName} > ',
//                               style: TextStyle(
//                                   fontFamily: 'Manrope',
//                                   color: hexToColor('#121E42'),
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w500,
//                                   height: 1.2)),
//                           TextSpan(
//                               text: '${myReport.subcategoryName}',
//                               style: TextStyle(
//                                   fontFamily: 'Manrope',
//                                   color: hexToColor('#72778F'),
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w500,
//                                   height: 1.2)),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       child: Column(
//                         children: [
//                           _ReportIssueImage(model: myReport),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Reported On',
//                               style: TextStyle(
//                                 fontFamily: 'Manrope',
//                                 color: hexToColor('#72778F'),
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.bottomLeft,
//                               child: Text('',
//
//                                 style: TextStyle(
//                                   fontFamily: 'Manrope',
//                                   color: hexToColor('#121E42'),
//                                   fontSize: 15,
//                                   height: 1.2,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Spacer(),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(
//                               'Urgency',
//                               style: TextStyle(
//                                 fontFamily: 'Manrope',
//                                 color: hexToColor('#72778F'),
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               '${myReport.urgencyLevel}',
//                               style: TextStyle(
//                                 fontFamily: 'Manrope',
//                                 color: hexToColor('#121E42'),
//                                 fontSize: 15,
//                                 height: 1.2,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     !Utility.isEmptyString(myReport.remarks)
//                         ?
//                     SizedBox(
//                       height: 10,
//                     )
//                         : SizedBox(
//                       height: 0,
//                     ),
//                     !Utility.isEmptyString(myReport.remarks)
//                         ?
//                     Divider(
//                       height: 1,
//                       thickness: 1,
//                       color: hexToColor('#BDC5C9'),
//                     )
//                         : SizedBox(
//                       height: 0,
//                     ),
//                     !Utility.isEmptyString(myReport.remarks)
//                         ?
//                     Align(
//                       child: Padding(
//                         padding:
//                         const EdgeInsets.only(top: 10, bottom: 10),
//                         child: Text(
//                           "${myReport.remarks}",
//                           style: TextStyle(
//                               fontFamily: 'Manrope',
//                               color: hexToColor('#434969'),
//                               fontSize: 13,
//                               fontWeight: FontWeight.w300),
//                         ),
//                       ),
//                     )
//                         : SizedBox(
//                       height: 0,
//                     ),
//                     !Utility.isEmptyString(myReport.remarks)
//                         ?
//                     Divider(
//                       height: 1,
//                       thickness: 1,
//                       color: hexToColor('#BDC5C9'),
//                     )
//                         : SizedBox(
//                       height: 0,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Align(
//                       child: Row(
//                         children: [
//                           Text(
//                             'Status: ',
//                             style: TextStyle(
//                               fontFamily: 'Manrope',
//                               color: hexToColor('#72778F'),
//                               fontSize: 15,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           Utility.isEmptyString(myReport.fulfillmentStatus)
//                               ?
//                           Text('')
//                               : Utility.generateTextBasedOnStatus(
//                             myReport.fulfillmentStatus,
//                             color: (myReport.fulfillmentStatus ==
//                                 "REJECTED" ||
//                                 myReport.fulfillmentStatus ==
//                                     "DROPPED")
//                                 ? Colors.red
//                                 : Colors.black,
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Utility.isNotNull(myReport.agencyName)
//                         ?
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Responding Party:',
//                           style: TextStyle(
//                             fontFamily: 'Manrope',
//                             color: hexToColor('#72778F'),
//                             fontSize: 15,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         Text(
//                           '{myReport.agencyName}',
//                           style: TextStyle(
//                             fontFamily: 'Manrope',
//                             color: hexToColor('#121E42'),
//                             fontSize: 15,
//                             height: 1.2,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     )
//                         : SizedBox(
//                       height: 0,
//                     ),
//
//                     //Drop comment
//
//                     if (myReport.fulfillmentStatus == "DROPPED" ||
//                         myReport.fulfillmentStatus == "COMPLETED")
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           if (myReport.comletedOrDroppedComment != null &&
//                               myReport.comletedOrDroppedComment != "null")
//                             Text(
//                               'Remarks by Officer: ',
//                               style: TextStyle(
//                                 fontFamily: 'Manrope',
//                                 color: hexToColor('#72778F'),
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           if (myReport.comletedOrDroppedComment != null &&
//                               myReport.comletedOrDroppedComment != "null")
//                             Text(
//                               '${myReport.comletedOrDroppedComment}',
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                 fontFamily: 'Manrope',
//                                 color: hexToColor('#121E42'),
//                                 fontSize: 15,
//                                 height: 1.2,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                         ],
//                       ),
//                     if (myReport.fulfillmentStatus == "STARTED" && type == 1)
//                       CommentTextField(),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children:
//                         getStatusWiseButtonList(myReport, type, context)
//                           ..toList(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

class CommentTextField extends StatefulWidget {
  //const CommentTextField({Key key}) : super(key: key);

  @override
  State<CommentTextField> createState() => _CommentTextFieldState();
}

class _CommentTextFieldState extends State<CommentTextField> {
  String _colorText = '#434969';

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<ShoutAssignToMeBloc, ShoutAssignToMeState>(
    //     buildWhen: (previous, current) => previous.comment != current.comment,
    //     builder: (BuildContext context, state) {
    String _defaultColor = '#78909C';
    String _focusColor = '#F2BA14';
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() => _colorText = hasFocus ? _focusColor : _defaultColor);
      },
      child: TextField(
        maxLines: 5,
        minLines: 2,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp("['\"]")),
        ],
        onChanged: (value) {},
        // (comments) => context
        // .read<ShoutAssignToMeBloc>()
        // .add(CommentChangeToState(comments)),
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: 'Enter your comment here',
          hintStyle: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 14.0,
            color: AppTheme.textColor3,
            fontWeight: FontWeight.w400,
          ),
          filled: false,
          labelText: 'Comment',
          labelStyle: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 15.0,
            color: hexToColor(_colorText),
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.borderColor, width: 1.5),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: hexToColor('#F2BA14'), width: 1.5),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: hexToColor('#FE0101'), width: 1.5),
            // borderRadius: BorderRadius.circular(5.0),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: hexToColor('#FE0101'), width: 1.5),
          ),
        ),
      ),
    );
  }
}

// List<Widget> getStatusWiseButtonList(
//     ShoutIncidentsModel shout, int type, BuildContext context) {
//   if (shout.fulfillmentStatus == "VERIFIED" && type == 1) {
//     return [
//       Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             width: 109,
//             child: ElevatedButton(
//               onPressed: () async {
//                 PopMessage(
//                     message: 'Submitting...',
//                     context: context,
//                     backgroundColor: Colors.grey,
//                     duration: 1);
//                 final result = await context
//                     .read<ValidateShoutBloc>()
//                     .updateFulfillmentStatus(shout.id, "STARTED");
//                 if (result['status'] != 'error') {
//                   PopMessage(
//                       message: result['message'],
//                       context: context,
//                       backgroundColor: Colors.green);
//                 } else
//                   PopMessage(
//                       message: result['message'],
//                       context: context,
//                       backgroundColor: Colors.red);
//                 Navigator.of(context).pop();
//                 Navigator.pushReplacementNamed(
//                     context, SHOUT_ASSIGNED_TO_ME_SCREEN_ROUTE);
//               },
//               style: ButtonStyle(
//                 backgroundColor:
//                 MaterialStateProperty.all<Color>(hexToColor('#F2BA14')),
//               ),
//               child: Text(
//                 'Start',
//                 style: TextStyle(
//                     fontFamily: 'Manrope',
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w700),
//               ),
//             ),
//           )
//         ],
//       ),
//     ];
//   } else if (shout.fulfillmentStatus == "STARTED" && type == 1) {
//     return [
//       BlocBuilder<ShoutAssignToMeBloc, ShoutAssignToMeState>(
//           buildWhen: (p, c) => p.comment != c.comment,
//           builder: (BuildContext context, state) {
//             return Expanded(
//               child: ElevatedButton(
//                 onPressed: Utility.isEmptyString(state.comment)
//                     ? null
//                     : () async {
//                   PopMessage(
//                       message: 'Submitting...',
//                       context: context,
//                       backgroundColor: Colors.grey,
//                       duration: 1);
//                   final result = await context
//                       .read<ValidateShoutBloc>()
//                       .updateFulfillmentStatus(shout.id, "DROPPED",
//                       comments: state.comment);
//                   if (result['status'] != 'error') {
//                     PopMessage(
//                         message: result['message'],
//                         context: context,
//                         backgroundColor: Colors.green);
//                   } else
//                     PopMessage(
//                         message: result['message'],
//                         context: context,
//                         backgroundColor: Colors.red);
//                   Navigator.of(context).pop();
//                   Navigator.pushReplacementNamed(
//                       context, SHOUT_ASSIGNED_TO_ME_SCREEN_ROUTE);
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all<Color>(
//                       Utility.isEmptyString(state.comment)
//                           ? Colors.black12
//                           : Colors.red),
//                 ),
//                 child: Text(
//                   'Drop',
//                   style: TextStyle(
//                       fontFamily: 'Manrope',
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//             );
//           }),
//       SizedBox(width: 30.0),
//       BlocBuilder<ShoutAssignToMeBloc, ShoutAssignToMeState>(
//           buildWhen: (p, c) => p.comment != c.comment,
//           builder: (BuildContext context, state) {
//             return Expanded(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   // PopMessage(
//                   //     message: 'Submitting...',
//                   //     context: context,
//                   //     backgroundColor: Colors.grey,
//                   //     duration: 1);
//                   // final result = await context
//                   //     .read<ValidateShoutBloc>()
//                   //     .updateFulfillmentStatus(shout.id, "COMPLETED",
//                   //     comments: state.comment);
//                   // if (result['status'] != 'error') {
//                   //   PopMessage(
//                   //       message: result['message'],
//                   //       context: context,
//                   //       backgroundColor: Colors.green);
//                   // } else
//                   //   PopMessage(
//                   //       message: result['message'],
//                   //       context: context,
//                   //       backgroundColor: Colors.red);
//                   // Navigator.of(context).pop();
//                   // Navigator.pushReplacementNamed(
//                   //     context, SHOUT_ASSIGNED_TO_ME_SCREEN_ROUTE);
//                 },
//                 style: ButtonStyle(
//                   backgroundColor:
//                   MaterialStateProperty.all<Color>(Colors.green),
//                 ),
//                 child: Text(
//                   'Complete',
//                   style: TextStyle(
//                       fontFamily: 'Manrope',
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//             );
//           }),
//     ];
//   } else {
//     return [
//       Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             width: 109,
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               style: ButtonStyle(
//                 backgroundColor:
//                 MaterialStateProperty.all<Color>(AppTheme.appBarColor),
//               ),
//               child: Text(
//                 'Ok',
//                 style: TextStyle(
//                     fontFamily: 'Manrope',
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w700),
//               ),
//             ),
//           )
//         ],
//       ),
//     ];
//   }
// }

// void buildConifrmationDialog(
//     ShoutIncidentsModel shout, BuildContext context, String status, title) {
//   showConfirmationDialog(
//     context: context,
//     title: '$title',
//     pressCancelButton: () {
//       Navigator.of(context).pop();
//     },
//     pressOkButton: () async {
//       final result = await context
//           .read<ValidateShoutBloc>()
//           .updateFulfillmentStatus(shout.id, "$status");
//       if (result['status'] != 'error') {
//         PopMessage(
//             message: result['message'],
//             context: context,
//             backgroundColor: Colors.green);
//       } else
//         PopMessage(
//             message: result['message'],
//             context: context,
//             backgroundColor: Colors.green);
//       Navigator.of(context).pop();
//       Navigator.of(context).pop();
//       Navigator.pushReplacementNamed(
//           context, SHOUT_ASSIGNED_TO_ME_SCREEN_ROUTE);
//     },
//   );
// }

class _ReportIssueImage extends StatefulWidget {
  // final ShoutIncidentsModel model;
  //
  // _ReportIssueImage({Key key, this.model}) : super(key: key);

  @override
  __ReportIssueImageState createState() => __ReportIssueImageState();
}

class __ReportIssueImageState extends State<_ReportIssueImage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<ShoutAssignToMeBloc, ShoutAssignToMeState>(
    //     buildWhen: (previous, current) =>
    //     previous.reportIssueImageFiles != current.reportIssueImageFiles ||
    //         previous.imageStatus != current.imageStatus,
    //     builder: (context, state) {
    return Container(
      decoration: BoxDecoration(
        color: hexToColor('#F6FAFC'),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: hexToColor('#64788250'), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey,
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child:
          // state.imageStatus ==
          //     MyReportImageLoadStatus.IMAGE_LOAD_INITIALIZE
          //     ?
          // SizedBox(
          //   height: 200,
          //   child: Center(
          //     child: SizedBox(
          //       height: 20,
          //       width: 20,
          //       child: CircularProgressIndicator(
          //         strokeWidth: 2,
          //         color: Colors.amber,
          //       ),
          //     ),
          //   ),
          // )
          //     :
          Column(
        children: [
          SizedBox(
            height: 200,
            child:
                // state.reportIssueImageFiles.isNotEmpty
                //     ?
                // Container(
                //   padding: EdgeInsets.all(3),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   // child: PhotoViewGallery(
                //   //   itemCount: state.reportIssueImageFiles.length,
                //   //   builder: (BuildContext context, int index) {
                //   //     return PhotoViewGalleryPageOptions(
                //   //       imageProvider: MemoryImage(
                //   //           state.reportIssueImageFiles[index]),
                //   //       // maxScale: PhotoViewComputedScale.covered,
                //   //       // minScale: PhotoViewComputedScale.covered,
                //   //       //  tightMode: true,
                //   //     );
                //   //   },
                //   //   scrollPhysics: BouncingScrollPhysics(),
                //   //   backgroundDecoration: BoxDecoration(
                //   //       color: Theme.of(context).canvasColor,
                //   //       // color: Colors.transparent,
                //   //       borderRadius: BorderRadius.circular(5)),
                //   //   onPageChanged: (int index) {
                //   //     setState(() {
                //   //       _currentIndex = index;
                //   //     });
                //   //   },
                //   // ),
                // )

                Container(
              padding: EdgeInsets.all(3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/images/no_image.png',
                  fit: BoxFit.cover,
                  // width: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width - 20,
                ),
              ),
            ),
          ),
          SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child:
                  // state.reportIssueImageFiles.length != 0
                  //     ?
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 10,
                    //      state.reportIssueImageFiles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        // padding: EdgeInsets.symmetric(horizontal: 5),
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: index == _currentIndex
                              ? hexToColor('#F2BA14')
                              : hexToColor('#C8E0EA'),
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              color: hexToColor('#000000'),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
              //     :
              // Center(
              //   child: Text(
              //     'No Image Available',
              //     style: TextStyle(
              //       fontFamily: 'Manrope',
              //       color: hexToColor('#000000'),
              //       fontSize: 15,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
              ),
        ],
      ),
    );
  }

  Future showDialogForDeleteImage({
    required BuildContext context,
    int? index,
    VoidCallback? onPress,
    required Uint8List imageFile,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Delete This Image'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Are you sure to delete this image from list?'),
              const SizedBox(height: 10),
              Image.memory(
                imageFile,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 2,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                      onPressed: () {
                        Navigator.of(dialogContext)
                            .pop(); // Dismiss alert dialog
                      },
                      child: const Text('No'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                      onPressed: onPress,
                      child: const Text('Yes'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

////

// class PopMessage{
//
//   PopMessage({
//     @required String message,
//     @required BuildContext context,
//     MaterialColor backgroundColor = Colors.red,
//     int duration = 3,
//   }){
//     final snackBar = SnackBar(
//       backgroundColor: backgroundColor,
//       duration: Duration(seconds: duration),
//       content: Text('${message}'),
//       action: SnackBarAction(
//         label: 'Ok',
//         textColor: Colors.white,
//         onPressed: () {
//           ScaffoldMessenger.of(context).hideCurrentSnackBar();
//         },
//       ),
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }
