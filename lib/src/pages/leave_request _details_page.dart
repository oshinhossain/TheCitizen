// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/state_manager.dart';
// import 'package:intl/intl.dart';
// import 'package:the_citizen_app/src/config/base.dart';
// import 'package:the_citizen_app/src/helpers/k_log.dart';
// import 'package:the_citizen_app/src/helpers/route.dart';
// import 'dart:math' as math;
// import '../config/app_theme.dart';
// import '../helpers/hex_color.dart';
// import '../helpers/k_text.dart';

// // ignore: must_be_immutable
// class LeaveRequestDetailsPage extends StatelessWidget with Base {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppTheme.newAppBarBackgroundColor,
//         centerTitle: true,
//         elevation: 0,
//         title: Text(
//           'Employee Leave Application',
//           style: TextStyle(
//             fontFamily: 'Manrope',
//             fontSize: 18.0,
//             color: AppTheme.textColor6,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         leading: GestureDetector(
//             onTap: () {
//               back();
//             },
//             child: Icon(Icons.arrow_back)),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Obx(
//             () => Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 05,
//                 ),
//                 KText(
//                   text: 'Submitted on',
//                   fontSize: 13,
//                   color: hexToColor('#72778F'),
//                 ),
//                 KText(
//                   bold: true,
//                   text: DateFormat.yMMMd().format(DateTime.now()),
//                   fontSize: 13,
//                   color: hexToColor('#141C44'),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Divider(
//                   height: 15,
//                   thickness: 1,
//                   color: hexToColor('#BDC5C9'),
//                 ),
//                 SizedBox(
//                   height: 05,
//                 ),
//                 KText(
//                   text: 'Submitted by',
//                   fontSize: 13,
//                   color: hexToColor('#72778F'),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       height: 75,
//                       width: 75,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.shade400,
//                             blurRadius: 1,
//                             offset: Offset(
//                               1,
//                               1,
//                             ), // Shadow position
//                           ),
//                           BoxShadow(
//                             color: Colors.grey.shade400,
//                             blurRadius: 1,
//                             offset: Offset(
//                               -1,
//                               -1,
//                             ), // Shadow position
//                           ),
//                           BoxShadow(
//                             color: Colors.grey.shade400,
//                             blurRadius: 1,
//                             offset: Offset(
//                               -1,
//                               1,
//                             ), // Shadow position
//                           ),
//                           BoxShadow(
//                             color: Colors.grey.shade400,
//                             blurRadius: 1,
//                             offset: Offset(
//                               1,
//                               -1,
//                             ), // Shadow position
//                           ),
//                         ],
//                       ),
//                       padding: EdgeInsets.all(3),
//                       child: CircleAvatar(
//                         radius: 30,
//                         child: Container(
//                           height: 70,
//                           width: 70,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: NetworkImage(
//                                   '${dotenv.env['BASE_URL_FSR']}/v2/user-attachment/get?latLng=23.90560,93.094535&apiKey=ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5&username=${userC.currentUser.value!.username}&appCode=KYC&fileCategory=photo&countryCode=BD',
//                                 ),
//                                 fit: BoxFit.cover),
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         KText(
//                           bold: true,
//                           text: userC.username,
//                           fontSize: 13,
//                           color: hexToColor('#141C44'),
//                         ),
//                         KText(
//                           bold: true,
//                           text: userC.currentUser.value!.email!,
//                           fontSize: 13,
//                           color: hexToColor('#72778F'),
//                         ),
//                         KText(
//                           bold: true,
//                           text: userC.currentUser.value!.mobile!,
//                           fontSize: 13,
//                           color: hexToColor('#72778F'),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 05,
//                 ),
//                 Divider(
//                   height: 15,
//                   thickness: 1,
//                   color: hexToColor('#BDC5C9'),
//                 ),
//                 SizedBox(
//                   height: 05,
//                 ),
//                 KText(
//                   text: 'Leave Type',
//                   fontSize: 13,
//                   color: hexToColor('#72778F'),
//                 ),
//                 KText(
//                   text: 'Sick Leave',
//                   fontSize: 14,
//                   color: hexToColor('#141C44'),
//                 ),
//                 Divider(
//                   height: 15,
//                   thickness: 1,
//                   color: hexToColor('#BDC5C9'),
//                 ),
//                 SizedBox(
//                   height: 05,
//                 ),
//                 KText(
//                   text: 'Start Date',
//                   fontSize: 13,
//                   color: hexToColor('#72778F'),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         employeeLeaveManageMentC.pickDate(start: true);
//                       },
//                       child: KText(
//                         text: employeeLeaveManageMentC.selectedStartDate.value,
//                         fontSize: 14,
//                         color: hexToColor('#141C44'),
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () =>
//                               employeeLeaveApplicationC.startHalfSelector(),
//                           child: Obx(() =>
//                               employeeLeaveManageMentC.start_half.value == .5
//                                   ? SvgPicture.asset('assets/svg/half_left.svg')
//                                   : employeeLeaveManageMentC.start_half.value ==
//                                           1
//                                       ? SvgPicture.asset('assets/svg/full.svg')
//                                       : SvgPicture.asset(
//                                           'assets/svg/half_right.svg')),
//                         ),
//                         SizedBox(width: 10),
//                         SizedBox(
//                             width: 70,
//                             height: 20,
//                             child: KText(
//                               text: employeeLeaveManageMentC.start_half.value ==
//                                       .5
//                                   ? '1st Half'
//                                   : employeeLeaveManageMentC.start_half.value ==
//                                           1
//                                       ? 'Full Day'
//                                       : '2nd Half',
//                               fontSize: 14,
//                               color: hexToColor('#141C44'),
//                             )),
//                       ],
//                     )
//                   ],
//                 ),
//                 Divider(
//                   height: 15,
//                   thickness: 1,
//                   color: hexToColor('#BDC5C9'),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 KText(
//                   text: 'End Date',
//                   fontSize: 13,
//                   color: hexToColor('#72778F'),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         employeeLeaveManageMentC.pickDate(start: false);
//                       },
//                       child: KText(
//                         text: employeeLeaveManageMentC.selectedEndDate.value,
//                         fontSize: 14,
//                         color: hexToColor('#141C44'),
//                       ),
//                     ),
//                     employeeLeaveManageMentC.selectedEndDate.value ==
//                             'Select End Date'
//                         ? KText(text: '')
//                         : employeeLeaveManageMentC.startDate ==
//                                 employeeLeaveManageMentC.endDate.value
//                             ? KText(text: '')
//                             : Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () => employeeLeaveManageMentC
//                                         .secondHalfSelector(),
//                                     child: Obx(() => employeeLeaveManageMentC
//                                                 .end_half.value ==
//                                             .5
//                                         ? SvgPicture.asset(
//                                             'assets/svg/half_left.svg')
//                                         : employeeLeaveManageMentC
//                                                     .end_half.value ==
//                                                 1
//                                             ? SvgPicture.asset(
//                                                 'assets/svg/full.svg')
//                                             : SvgPicture.asset(
//                                                 'assets/svg/half_right.svg')),
//                                   ),
//                                   SizedBox(width: 10),
//                                   SizedBox(
//                                     width: 70,
//                                     height: 20,
//                                     child: FittedBox(
//                                       child: KText(
//                                         text: employeeLeaveManageMentC
//                                                     .end_half.value ==
//                                                 .5
//                                             ? '1st Half'
//                                             : employeeLeaveManageMentC
//                                                         .end_half.value ==
//                                                     1
//                                                 ? 'Full Day'
//                                                 : '2nd Half',
//                                         fontSize: 14,
//                                         color: hexToColor('#141C44'),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                   ],
//                 ),
//                 Divider(
//                   height: 15,
//                   thickness: 1,
//                   color: hexToColor('#BDC5C9'),
//                 ),
//                 SizedBox(
//                   height: 05,
//                 ),
//                 KText(
//                   text: 'Leave Duration',
//                   fontSize: 13,
//                   color: hexToColor('#72778F'),
//                 ),
//                 KText(
//                   text: employeeLeaveManageMentC.leavedays.value == 0
//                       ? '0'
//                       : employeeLeaveManageMentC.leavedays.value
//                                   .toString()
//                                   .split('.')[1] ==
//                               '0'
//                           ? employeeLeaveManageMentC.leavedays.value
//                               .toInt()
//                               .toString()
//                           : employeeLeaveManageMentC.leavedays.value.toString(),
//                   fontSize: 14,
//                   color: hexToColor('#141C44'),
//                 ),
//                 Divider(
//                   height: 15,
//                   thickness: 1,
//                   color: hexToColor('#BDC5C9'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
