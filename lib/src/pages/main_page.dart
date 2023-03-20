import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import 'package:the_citizen_app/src/pages/attendance_page.dart';
import 'package:the_citizen_app/src/pages/right_drawer.dart';
import 'package:toast/toast.dart';
import '../components/k_appbar.dart';
import '../components/BottomNavigationBar.dart';
import 'left_drawer.dart';

class MainPage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    log('the token');
    userC.getToken();
    DateTime timeBackPressed = DateTime.now();
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          final difference = DateTime.now().difference(timeBackPressed);
          final isExitWarning = difference >= const Duration(seconds: 2);
          timeBackPressed = DateTime.now();
          if (isExitWarning) {
            Toast.show(
              'Press back again to exit',
              // context,
              gravity: Toast.center,
              backgroundColor: Colors.red,
              textStyle: TextStyle(color: Colors.white),
              duration: 2,
            );
            return false;
          } else {
            ToastView.dismiss();
            return true;
          }
        },
        child: Scaffold(
          floatingActionButton: _FloatingActionButtonContent(),
          key: menuC.globalKey,

          drawer: LeftDrawer(),
          endDrawer: RightDrawer(),

          appBar: KAppbar(),

          bottomNavigationBar: BottomNavigationComponent(),
          // bottomNavigationBar: Container(
          //   color: AppTheme.appbarColor,
          //   height: 82,
          //   width: Get.width,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: menuC.bottomMenus
          //         .map(
          //           (item) => GestureDetector(
          //             onTap: () => menuC.setCurrentIndex = item,
          //             child: SvgPicture.asset(
          //               '${Constants.svgPath}/$item',
          //               color: menuC.getMenuIndex(item) == 2
          //                   ? null
          //                   : menuC.currentIndex.value == menuC.getMenuIndex(item)
          //                       ? AppTheme.color2
          //                       : AppTheme.color6,
          //             ),
          //           ),
          //         )
          //         .toList(),
          //   ),
          // ),
          body: menuC.getCurrentPage(),
        ),
      ),
    );
  }
}

class _FloatingActionButtonContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return Wrap(
          direction: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 14.0),
              child: FloatingActionButton(
                heroTag: 'tag-2',
                //backgroundColor: AppColors.appBarColor,
                backgroundColor: Color(0xFF78909C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(31.0),
                ),
                onPressed: () {
                  push(AttendancePage());
                },
                child: ImageIcon(
                  AssetImage('assets/icons/attendance_floating_icon.png'),
                  color: Color(0xFFFFFFFF),
                  size: 32.0,
                ),
              ),
            ),
            //SizedBox(height: 14.0),
            FloatingActionButton(
              heroTag: 'tag-3',
              //backgroundColor: AppColors.appBarColor,
              backgroundColor: Color(0xFF78909C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(31.0),
              ),
              onPressed: () {},
              child: Icon(Icons.keyboard_arrow_up_rounded, size: 35.0),
            ),
          ],
        );
      },
    );
  }

  // void displayBottomSheetNew(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) {
  //       return BlocBuilder<HomeBloc, HomeState>(
  //           buildWhen: (previous, current) =>
  //               previous.rptSummary != current.rptSummary || previous.bottomSummaryStatus != current.bottomSummaryStatus,
  //           builder: (BuildContext context, state) {
  //             return ClipRRect(
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(5.0),
  //                 topRight: Radius.circular(5.0),
  //               ),
  //               child: Container(
  //                 padding: EdgeInsets.all(5.0),
  //                 decoration: BoxDecoration(
  //                   //color: Color(0xff6e7c7c),
  //                   color: Color(0xff5F7885),
  //                 ),
  //                 child: Container(
  //                   padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
  //                   //color: Color(0xff6e7c7c),
  //                   color: Color(0xff5F7885),
  //                   child: state.bottomSummaryStatus == BottomSummaryStatus.DATA_FETCHING
  //                       ? Column(
  //                           mainAxisSize: MainAxisSize.min,
  //                           children: [
  //                             Center(child: CircularProgressIndicator()),
  //                           ],
  //                         )
  //                       : (state.bottomSummaryStatus == BottomSummaryStatus.DATA_FETCHED_SUCCESS
  //                           ? (shoutRoleLevel <= 305
  //                               ? Column(
  //                                   mainAxisSize: MainAxisSize.min,
  //                                   children: [
  //                                     if (shoutRoleLevel == 305)
  //                                       Row(
  //                                         children: [
  //                                           Expanded(
  //                                               child: Text('Officer :',
  //                                                   style: TextStyle(color: Colors.white), textAlign: TextAlign.left)),
  //                                           Expanded(
  //                                             child: createCaptionWithValueNew(
  //                                               caption: 'Assigned to Me',
  //                                               value: '${state.rptSummary?.assignedToMeCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, SHOUT_ASSIGNED_TO_ME_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                           SizedBox(width: 10.0),
  //                                           Expanded(
  //                                             child: createCaptionWithValueNew(
  //                                               caption: 'To Start',
  //                                               value: '${state.rptSummary?.toStartCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, START_TASK_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                           SizedBox(width: 10.0),
  //                                           Expanded(
  //                                             child: createCaptionWithValueNew(
  //                                               caption: 'To Close',
  //                                               value: '${state.rptSummary?.toCloseCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, FINISH_TASK_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     //Divider(thickness: 1, color: Colors.white),
  //                                     if (shoutRoleLevel == 304)
  //                                       Row(
  //                                         children: [
  //                                           Expanded(
  //                                             child: Text('Location Manager :',
  //                                                 style: TextStyle(color: Colors.white), textAlign: TextAlign.left),
  //                                           ),
  //                                           Expanded(
  //                                             child: createCaptionWithValueNew(
  //                                               caption: 'Assigned to My Location',
  //                                               value: '${state.rptSummary?.assignedToMyLocationCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, AGENCY_SUMMERY_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                           SizedBox(width: 10.0),
  //                                           Expanded(
  //                                             child: createCaptionWithValueNew(
  //                                               caption: 'To Validate',
  //                                               value: '${state.rptSummary?.toValidateCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, VALIDATE_SHOUTS_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                           SizedBox(width: 10.0),
  //                                           Expanded(
  //                                             child: createCaptionWithValueNew(
  //                                               caption: 'Pending',
  //                                               //value: '${state.rptSummary?.myOfficersShoutWipCount ?? 0}',
  //                                               value: '${state.rptSummary?.pendingForMeCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, TRANSFER_SHOUTS_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     //Divider(thickness: 1, color: Colors.white),
  //                                     if (shoutRoleLevel == 303)
  //                                       Row(
  //                                         children: [
  //                                           Expanded(
  //                                               child: Text('Unit Manager :',
  //                                                   style: TextStyle(color: Colors.white), textAlign: TextAlign.left)),
  //                                           Expanded(
  //                                             child: createCaptionWithValueNew(
  //                                               caption: 'Assigned to My Unit',
  //                                               value: '${state.rptSummary?.assignedToMyunitCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, AGENCY_SUMMERY_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                           SizedBox(width: 10.0),
  //                                           Expanded(
  //                                             child: createCaptionWithValueNew(
  //                                               caption: 'Pending',
  //                                               //value: '${state.rptSummary?.myOfficersShoutWipCount ?? 0}',
  //                                               value: '${state.rptSummary?.pendingForMeCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, TRANSFER_SHOUTS_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                           SizedBox(width: 10.0),
  //                                           Expanded(
  //                                             child: createCaptionWithValueNew(
  //                                               caption: 'Closed & Dropped',
  //                                               value: '${state.rptSummary?.closedAndDroppedCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.of(context).pop();
  //                                               },
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     //Divider(thickness: 1, color: Colors.white),
  //                                     if (shoutRoleLevel == 301 || shoutRoleLevel == 302)
  //                                       Row(
  //                                         children: [
  //                                           Expanded(
  //                                               child: Text('Agency Manager :',
  //                                                   style: TextStyle(color: Colors.white), textAlign: TextAlign.left)),
  //                                           Expanded(
  //                                             child: createCaptionWithValueNew(
  //                                               caption: 'Assigned to My Agency',
  //                                               value: '${state.rptSummary?.assignedToMyAgencyCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, AGENCY_SUMMERY_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                           SizedBox(width: 10.0),
  //                                           Expanded(
  //                                             child: createCaptionWithValueNew(
  //                                               caption: 'Pending',
  //                                               //value: '${state.rptSummary?.myOfficersShoutWipCount ?? 0}',
  //                                               value: '${state.rptSummary?.pendingForMeCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, TRANSFER_SHOUTS_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                           SizedBox(width: 10.0),
  //                                           Expanded(
  //                                             child: createCaptionWithValueNew(
  //                                               caption: 'Closed & Dropped',
  //                                               value: '${state.rptSummary?.closedAndDroppedCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.of(context).pop();
  //                                               },
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     //Divider(thickness: 1, color: Colors.white),
  //                                     Divider(thickness: 1, color: Color(0xff4A616D)),
  //                                     Row(
  //                                       children: [
  //                                         //officer also user. userRole=801
  //                                         Expanded(
  //                                             child: Text('User :', style: TextStyle(color: Colors.white), textAlign: TextAlign.left)),
  //                                         Expanded(
  //                                           child: createCaptionWithValueNew(
  //                                             caption: 'Shouted by Me',
  //                                             value: '${state.rptSummary?.myShoutCount ?? 0}',
  //                                             onPress: () {},
  //                                           ),
  //                                         ),
  //                                         SizedBox(width: 10.0),
  //                                         Expanded(
  //                                           child: createCaptionWithValueNew(
  //                                             caption: 'My Shouts in Progress',
  //                                             value: '${state.rptSummary?.myShoutWipCount ?? 0}',
  //                                             onPress: () {},
  //                                           ),
  //                                         ),
  //                                         SizedBox(width: 10.0),
  //                                         Expanded(
  //                                           child: createCaptionWithValueNew(
  //                                             caption: 'My Shouts Closed',
  //                                             value: '${state.rptSummary?.myShoutCompletedCounted ?? 0}',
  //                                             onPress: () {},
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                   ],
  //                                 )
  //                               : Column(
  //                                   // Only User block: shoutRoleLevel = 801
  //                                   mainAxisSize: MainAxisSize.min,
  //                                   children: [
  //                                     Row(
  //                                       children: [
  //                                         Expanded(
  //                                             child: Text('User :', style: TextStyle(color: Colors.white), textAlign: TextAlign.left)),
  //                                         Expanded(
  //                                           child: createCaptionWithValueNew(
  //                                             caption: 'Shouted by Me',
  //                                             value: '${state.rptSummary?.myShoutCount ?? 0}',
  //                                             onPress: () {},
  //                                           ),
  //                                         ),
  //                                         SizedBox(width: 10.0),
  //                                         Expanded(
  //                                           child: createCaptionWithValueNew(
  //                                             caption: 'My Shouts in Progress',
  //                                             value: '${state.rptSummary?.myShoutWipCount ?? 0}',
  //                                             onPress: () {},
  //                                           ),
  //                                         ),
  //                                         SizedBox(width: 10.0),
  //                                         Expanded(
  //                                           child: createCaptionWithValueNew(
  //                                             caption: 'My Shouts Closed',
  //                                             value: '${state.rptSummary?.myShoutCompletedCounted ?? 0}',
  //                                             onPress: () {},
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                   ],
  //                                 ))
  //                           : (state.bottomSummaryStatus == BottomSummaryStatus.DATA_FETCHED_FAILURE
  //                               ? Column(
  //                                   mainAxisSize: MainAxisSize.min,
  //                                   children: [
  //                                     Text('Something went wrong.'),
  //                                   ],
  //                                 )
  //                               : Column(
  //                                   mainAxisSize: MainAxisSize.min,
  //                                   children: [
  //                                     Text('Something went wrong.'),
  //                                   ],
  //                                 ))),
  //                 ),
  //               ),
  //             );
  //           });
  //     },
  //   );
  // }

  // void displayBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) {
  //       return BlocBuilder<HomeBloc, HomeState>(
  //           buildWhen: (previous, current) =>
  //               previous.rptSummary != current.rptSummary || previous.bottomSummaryStatus != current.bottomSummaryStatus,
  //           builder: (BuildContext context, state) {
  //             return ClipRRect(
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(20.0),
  //                 topRight: Radius.circular(20.0),
  //               ),
  //               child: Container(
  //                 padding: EdgeInsets.all(10.0),
  //                 decoration: BoxDecoration(
  //                   color: Color(0xff6e7c7c),
  //                 ),
  //                 child: Container(
  //                   padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
  //                   color: Color(0xff6e7c7c),
  //                   child: state.bottomSummaryStatus == BottomSummaryStatus.DATA_FETCHING
  //                       ? Column(
  //                           mainAxisSize: MainAxisSize.min,
  //                           children: [
  //                             Center(child: CircularProgressIndicator()),
  //                           ],
  //                         )
  //                       : (state.bottomSummaryStatus == BottomSummaryStatus.DATA_FETCHED_SUCCESS
  //                           ? (shoutRoleLevel <= 305
  //                               ? Column(
  //                                   mainAxisSize: MainAxisSize.min,
  //                                   children: [
  //                                     if (shoutRoleLevel == 305)
  //                                       Row(
  //                                         children: [
  //                                           Expanded(
  //                                               child: Text('Officer :',
  //                                                   style: TextStyle(color: Colors.white), textAlign: TextAlign.left)),
  //                                           Expanded(
  //                                             child: createCaptionWithValue(
  //                                               caption: 'Assigned to Me',
  //                                               value: '${state.rptSummary?.assignedToMeCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, SHOUT_ASSIGNED_TO_ME_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                           Container(
  //                                               color: Colors.white,
  //                                               width: 2,
  //                                               height: 45,
  //                                               margin: EdgeInsets.symmetric(horizontal: 5)),
  //                                           Expanded(
  //                                             child: createCaptionWithValue(
  //                                               caption: 'To Start',
  //                                               value: '${state.rptSummary?.toStartCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, START_TASK_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                           Container(
  //                                             color: Colors.white,
  //                                             width: 2,
  //                                             height: 40,
  //                                             margin: EdgeInsets.symmetric(horizontal: 5),
  //                                           ),
  //                                           Expanded(
  //                                             child: createCaptionWithValue(
  //                                               caption: 'To Close',
  //                                               value: '${state.rptSummary?.toCloseCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, FINISH_TASK_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     //Divider(thickness: 1, color: Colors.white),
  //                                     if (shoutRoleLevel == 304)
  //                                       Row(
  //                                         children: [
  //                                           Expanded(
  //                                             child: Text('Location Manager :',
  //                                                 style: TextStyle(color: Colors.white), textAlign: TextAlign.left),
  //                                           ),
  //                                           Expanded(
  //                                             child: createCaptionWithValue(
  //                                               caption: 'Assigned to My Location',
  //                                               value: '${state.rptSummary?.assignedToMyLocationCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, AGENCY_SUMMERY_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                           Container(
  //                                               color: Colors.white,
  //                                               width: 2,
  //                                               height: 45,
  //                                               margin: EdgeInsets.symmetric(horizontal: 5)),
  //                                           Expanded(
  //                                             child: createCaptionWithValue(
  //                                               caption: 'To Validate',
  //                                               value: '${state.rptSummary?.toValidateCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, VALIDATE_SHOUTS_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                           Container(
  //                                             color: Colors.white,
  //                                             width: 2,
  //                                             height: 40,
  //                                             margin: EdgeInsets.symmetric(horizontal: 5),
  //                                           ),
  //                                           Expanded(
  //                                             child: createCaptionWithValue(
  //                                               caption: 'Pending',
  //                                               //value: '${state.rptSummary?.myOfficersShoutWipCount ?? 0}',
  //                                               value: '${state.rptSummary?.pendingForMeCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, TRANSFER_SHOUTS_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     //Divider(thickness: 1, color: Colors.white),
  //                                     if (shoutRoleLevel == 303)
  //                                       Row(
  //                                         children: [
  //                                           Expanded(
  //                                               child: Text('Unit Manager :',
  //                                                   style: TextStyle(color: Colors.white), textAlign: TextAlign.left)),
  //                                           Expanded(
  //                                             child: createCaptionWithValue(
  //                                               caption: 'Assigned to My Unit',
  //                                               value: '${state.rptSummary?.assignedToMyunitCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, AGENCY_SUMMERY_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                           Container(
  //                                               color: Colors.white,
  //                                               width: 2,
  //                                               height: 45,
  //                                               margin: EdgeInsets.symmetric(horizontal: 5)),
  //                                           Expanded(
  //                                             child: createCaptionWithValue(
  //                                               caption: 'Pending',
  //                                               //value: '${state.rptSummary?.myOfficersShoutWipCount ?? 0}',
  //                                               value: '${state.rptSummary?.pendingForMeCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, TRANSFER_SHOUTS_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                           Container(
  //                                             color: Colors.white,
  //                                             width: 2,
  //                                             height: 40,
  //                                             margin: EdgeInsets.symmetric(horizontal: 5),
  //                                           ),
  //                                           Expanded(
  //                                             child: createCaptionWithValue(
  //                                               caption: 'Closed & Dropped',
  //                                               value: '${state.rptSummary?.closedAndDroppedCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.of(context).pop();
  //                                               },
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     //Divider(thickness: 1, color: Colors.white),
  //                                     if (shoutRoleLevel == 301 || shoutRoleLevel == 302)
  //                                       Row(
  //                                         children: [
  //                                           Expanded(
  //                                               child: Text('Agency Manager :',
  //                                                   style: TextStyle(color: Colors.white), textAlign: TextAlign.left)),
  //                                           Expanded(
  //                                             child: createCaptionWithValue(
  //                                               caption: 'Assigned to My Agency',
  //                                               value: '${state.rptSummary?.assignedToMyAgencyCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, AGENCY_SUMMERY_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                           Container(
  //                                               color: Colors.white,
  //                                               width: 2,
  //                                               height: 45,
  //                                               margin: EdgeInsets.symmetric(horizontal: 5)),
  //                                           Expanded(
  //                                             child: createCaptionWithValue(
  //                                               caption: 'Pending',
  //                                               //value: '${state.rptSummary?.myOfficersShoutWipCount ?? 0}',
  //                                               value: '${state.rptSummary?.pendingForMeCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.popAndPushNamed(context, TRANSFER_SHOUTS_SCREEN_ROUTE);
  //                                               },
  //                                             ),
  //                                           ),
  //                                           Container(
  //                                             color: Colors.white,
  //                                             width: 2,
  //                                             height: 40,
  //                                             margin: EdgeInsets.symmetric(horizontal: 5),
  //                                           ),
  //                                           Expanded(
  //                                             child: createCaptionWithValue(
  //                                               caption: 'Closed & Dropped',
  //                                               value: '${state.rptSummary?.closedAndDroppedCount ?? 0}',
  //                                               onPress: () {
  //                                                 Navigator.of(context).pop();
  //                                               },
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     Divider(thickness: 1, color: Colors.white),
  //                                     Row(
  //                                       children: [
  //                                         //officer also user. userRole=801
  //                                         Expanded(
  //                                             child: Text('User :', style: TextStyle(color: Colors.white), textAlign: TextAlign.left)),
  //                                         Expanded(
  //                                           child: createCaptionWithValue(
  //                                             caption: 'Shouted by Me',
  //                                             value: '${state.rptSummary?.myShoutCount ?? 0}',
  //                                             onPress: () {},
  //                                           ),
  //                                         ),
  //                                         Container(
  //                                           color: Colors.white,
  //                                           width: 2,
  //                                           height: 45,
  //                                           margin: EdgeInsets.symmetric(horizontal: 5),
  //                                         ),
  //                                         Expanded(
  //                                           child: createCaptionWithValue(
  //                                             caption: 'My Shouts in Progress',
  //                                             value: '${state.rptSummary?.myShoutWipCount ?? 0}',
  //                                             onPress: () {},
  //                                           ),
  //                                         ),
  //                                         Container(
  //                                           color: Colors.white,
  //                                           width: 2,
  //                                           height: 40,
  //                                           margin: EdgeInsets.symmetric(horizontal: 5),
  //                                         ),
  //                                         Expanded(
  //                                           child: createCaptionWithValue(
  //                                             caption: 'My Shouts Closed',
  //                                             value: '${state.rptSummary?.myShoutCompletedCounted ?? 0}',
  //                                             onPress: () {},
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                   ],
  //                                 )
  //                               : Column(
  //                                   // Only User block: shoutRoleLevel = 801
  //                                   mainAxisSize: MainAxisSize.min,
  //                                   children: [
  //                                     Row(
  //                                       children: [
  //                                         Expanded(
  //                                             child: Text('User :', style: TextStyle(color: Colors.white), textAlign: TextAlign.left)),
  //                                         Expanded(
  //                                           child: createCaptionWithValue(
  //                                             caption: 'Shouted by Me',
  //                                             value: '${state.rptSummary?.myShoutCount ?? 0}',
  //                                             onPress: () {},
  //                                           ),
  //                                         ),
  //                                         Container(
  //                                           color: Colors.white,
  //                                           width: 2,
  //                                           height: 45,
  //                                           margin: EdgeInsets.symmetric(horizontal: 5),
  //                                         ),
  //                                         Expanded(
  //                                           child: createCaptionWithValue(
  //                                             caption: 'My Shouts in Progress',
  //                                             value: '${state.rptSummary?.myShoutWipCount ?? 0}',
  //                                             onPress: () {},
  //                                           ),
  //                                         ),
  //                                         Container(
  //                                           color: Colors.white,
  //                                           width: 2,
  //                                           height: 40,
  //                                           margin: EdgeInsets.symmetric(horizontal: 5),
  //                                         ),
  //                                         Expanded(
  //                                           child: createCaptionWithValue(
  //                                             caption: 'My Shouts Closed',
  //                                             value: '${state.rptSummary?.myShoutCompletedCounted ?? 0}',
  //                                             onPress: () {},
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                   ],
  //                                 ))
  //                           : (state.bottomSummaryStatus == BottomSummaryStatus.DATA_FETCHED_FAILURE
  //                               ? Column(
  //                                   mainAxisSize: MainAxisSize.min,
  //                                   children: [
  //                                     Text('Something went wrong.'),
  //                                   ],
  //                                 )
  //                               : Column(
  //                                   mainAxisSize: MainAxisSize.min,
  //                                   children: [
  //                                     Text('Something went wrong.'),
  //                                   ],
  //                                 ))),
  //                 ),
  //               ),
  //             );
  //           });
  //     },
  //   );
  // }

  // Widget createCaptionWithValueNew({
  //   String value,
  //   String caption,
  //   VoidCallback onPress,
  // }) {
  //   return InkWell(
  //     child: Column(
  //       children: [
  //         ClipRRect(
  //           borderRadius: BorderRadius.circular(2.0),
  //           //borderRadius: BorderRadius.all(Radius.circular(5.0)),
  //           child: Container(
  //             //padding: EdgeInsets.only(top: 5.0),
  //             color: Color(0xff708996),
  //             child: Column(
  //               children: [
  //                 Container(
  //                   //padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
  //                   color: Color(0xff78909C),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Text(
  //                         value,
  //                         style:
  //                             TextStyle(fontFamily: 'Manrope', fontSize: 20.0, color: Color(0xFFFFFFFF), fontWeight: FontWeight.w700),
  //                         textAlign: TextAlign.center,
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 //SizedBox(height: 5),
  //                 Container(
  //                   padding: EdgeInsets.only(top: 3.0),
  //                   height: 45.0,
  //                   color: Color(0xff708996),
  //                   child: Align(
  //                     child: Text(
  //                       caption,
  //                       style: TextStyle(
  //                           height: 1.2, fontFamily: 'Manrope', fontSize: 13.0, color: Color(0xFFFFFFFF), fontWeight: FontWeight.w400),
  //                       textAlign: TextAlign.center,
  //                     ),
  //                     alignment: Alignment.center,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //     onTap: onPress,
  //   );
  // }

  // Widget createCaptionWithValue({
  //   String caption,
  //   String value,
  //   VoidCallback onPress,
  // }) {
  //   return InkWell(
  //     child: Column(
  //       children: [
  //         Text(
  //           value,
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         SizedBox(height: 5),
  //         Align(
  //           child: Text(
  //             caption,
  //             style: TextStyle(color: Colors.white),
  //             textAlign: TextAlign.center,
  //           ),
  //           alignment: Alignment.center,
  //         ),
  //       ],
  //     ),
  //     onTap: onPress,
  //   );
  // }
}
//