// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:the_citizen_app/src/config/app_theme.dart';
// import 'package:the_citizen_app/src/config/base.dart';
// import 'package:the_citizen_app/src/helpers/hex_color.dart';
// import 'package:the_citizen_app/src/helpers/k_text.dart';
// import 'package:the_citizen_app/src/helpers/render_svg.dart';

// class RightSidebarComponent extends StatelessWidget with Base {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: AppTheme.white,
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               color: hexToColor('#EFF7FF'),
//               width: Get.width,
//               height: 220,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 16,
//                   ),
//                   RenderSvg(path: 'workforce_logo')
//                 ],
//               ),
//             ),
//             Column(
//               children: menuC.rightSidebar
//                   .map(
//                     (item) => ExpansionTile(
//                       childrenPadding: EdgeInsets.zero,
//                       backgroundColor: hexToColor('#EFF7FF'),
//                       leading: RenderSvg(path: '${item.svgPath}'),
//                       // collapsedBackgroundColor: hexToColor('#EFF7FF'),
//                       title: KText(
//                         text: '${item.title}',
//                         bold: true,
//                         fontSize: 17,
//                       ),
//                       children: [
//                         Column(
//                           children: item.children!
//                               .map(
//                                 (item) => Column(
//                                   children: [
//                                     Divider(),
//                                     Container(
//                                       padding: EdgeInsets.all(5),
//                                       margin: EdgeInsets.only(left: 15),
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             children: [
//                                               SizedBox(
//                                                 width: 12,
//                                               ),
//                                               KText(
//                                                 text: '●',
//                                                 fontSize: 8,
//                                               ),
//                                               SizedBox(
//                                                 width: 8,
//                                               ),
//                                               KText(
//                                                 text: '${item.title}',
//                                                 fontSize: 16,
//                                               )
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                               .toList(),
//                         ),
//                       ],
//                     ),
//                   )
//                   .toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
