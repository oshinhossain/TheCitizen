// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:the_citizen_app/src/config/app_theme.dart';
// import 'package:the_citizen_app/src/config/base.dart';
// import 'package:the_citizen_app/src/helpers/hex_color.dart';
// import 'package:the_citizen_app/src/helpers/k_text.dart';
// import 'package:the_citizen_app/src/helpers/render_svg.dart';

// class LeftSidebarComponent extends StatelessWidget with Base {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: AppTheme.white,
//       child: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               physics: BouncingScrollPhysics(),
//               child: Column(
//                 children: [
//                   Container(
//                     color: hexToColor('#C1E1FF'),
//                     width: Get.width,
//                     height: 250,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: 16,
//                         ),
//                         CircleAvatar(
//                           backgroundColor: AppTheme.color4,
//                           radius: 45,
//                           child: RenderSvg(path: 'avatar_placeholder'),
//                         ),
//                         SizedBox(
//                           height: 22,
//                         ),
//                         KText(
//                           text: 'Mohammad Shumon Iqbal',
//                           bold: true,
//                           fontSize: 16,
//                         ),
//                         KText(text: 'Agency Manager'),
//                         KText(text: 'Uttara, Dhaka'),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     children: menuC.leftSidebar
//                         .map(
//                           (item) => Column(
//                             children: [
//                               ExpansionTile(
//                                 childrenPadding: EdgeInsets.zero,
//                                 backgroundColor: hexToColor('#EFF7FF'),
//                                 leading: RenderSvg(path: '${item.svgPath}'),
//                                 // collapsedBackgroundColor: hexToColor('#EFF7FF'),
//                                 title: KText(
//                                   text: '${item.title}',
//                                   bold: true,
//                                   fontSize: 17,
//                                 ),
//                                 children: [
//                                   Column(
//                                     children: item.children!
//                                         .map(
//                                           (item) => Column(
//                                             children: [
//                                               Divider(),
//                                               Container(
//                                                 padding: EdgeInsets.all(5),
//                                                 margin:
//                                                     EdgeInsets.only(left: 15),
//                                                 child: Column(
//                                                   children: [
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .start,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         SizedBox(
//                                                           width: 12,
//                                                         ),
//                                                         KText(
//                                                           text: '●',
//                                                           fontSize: 8,
//                                                         ),
//                                                         SizedBox(
//                                                           width: 8,
//                                                         ),
//                                                         KText(
//                                                           text: '${item.title}',
//                                                           fontSize: 16,
//                                                         )
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         )
//                                         .toList(),
//                                   ),
//                                 ],
//                               ),
//                               Container(
//                                   color: Color(0xFFB6B8C5),
//                                   width: double.infinity,
//                                   height: 1.0),
//                             ],
//                           ),
//                         )
//                         .toList(),
//                   ),
//                   Container(
//                     color: Colors.white,
//                     child: ListTile(
//                       onTap: () => userC.logOut(),
//                       contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//                       horizontalTitleGap: 10.0,
//                       minVerticalPadding: 0.0,
//                       //minLeadingWidth: 10.0,
//                       leading: ImageIcon(
//                           AssetImage("assets/icons/logout_icon.png"),
//                           color: Color(0xFF2A3050)),
//                       title: Text(
//                         'Logout',
//                         style: TextStyle(
//                             fontFamily: 'Manrope',
//                             fontSize: 14.0,
//                             color: Color(0xFF2A3050),
//                             fontWeight: FontWeight.w600),
//                       ),
//                       //trailing: Icon(Icons.logout),
//                     ),
//                   ),
//                   Container(
//                       color: Color(0xFFB6B8C5),
//                       width: double.infinity,
//                       height: 1.0),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 5),
//           Expanded(
//             flex: 0,
//             child: Align(
//               alignment: Alignment.center,
//               child: Text(
//                 'Version 1.0.8',
//                 style: TextStyle(
//                   fontFamily: 'Manrope',
//                   fontSize: 12.0,
//                   color: Color(0xFF000000),
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 5),
//         ],
//       ),
//     );
//   }
// }
