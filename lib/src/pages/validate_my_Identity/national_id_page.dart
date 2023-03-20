import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:the_citizen_app/src/config/base.dart';

import '../../config/app_theme.dart';
import '../../config/constants.dart';
import '../../helpers/hex_color.dart';
import '../../helpers/k_text.dart';
import '../../helpers/route.dart';

class NationalIdPage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    updateProfileCreateC.updateProfileImageGet('nidfront');
    updateProfileCreateC.updateProfileImageGet('nidback');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppTheme.backgroundColor,
        iconTheme: IconThemeData(
          color: AppTheme.textColor6,
        ),
        leading: GestureDetector(
            onTap: () {
              back();
            },
            child: Icon(Icons.arrow_back)),
        title: Text(
          'National Identity',
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 18.0,
            color: AppTheme.appBarTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  // Bottom rectangular box
                  margin: EdgeInsets.only(
                    top: 40,
                    left: 5,
                    right: 5,
                    bottom: 20,
                  ),
                  // to push the box half way below circle

                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        offset: Offset(
                          1,
                          1,
                        ), // Shadow position
                      ),
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        offset: Offset(
                          -1,
                          -1,
                        ), // Shadow position
                      ),
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        offset: Offset(
                          -1,
                          1,
                        ), // Shadow position
                      ),
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        offset: Offset(
                          1,
                          -1,
                        ), // Shadow position
                      ),
                    ],
                    color: hexToColor('#EEFDFF'),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.only(top: 60, left: 20, right: 20),
                  // spacing inside the box
                  child: Column(
                    children: <Widget>[
                      // Text(
                      //   'kjjknj',
                      //   style: Theme.of(context).textTheme.headline3,
                      // ),
                      SizedBox(
                        height: 16,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text: 'NID No :',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text: authC.userDetail.value!.nidNo ?? 'N/A',
                                bold: true,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text: 'Name: ',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text:
                                    authC.userDetail.value!.personName ?? 'N/A',
                                bold: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text: 'Father: ',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text:
                                    authC.userDetail.value!.fatherName ?? 'N/A',
                                bold: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text: 'Mother: ',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text:
                                    authC.userDetail.value!.motherName ?? 'N/A',
                                bold: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text: 'Date of Birth: ',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text:
                                    authC.userDetail.value!.birthDate ?? 'N/A',
                                bold: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text: 'Gender: ',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text: authC.userDetail.value!.gender ?? 'N/A',
                                bold: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text: 'Blood Group: ',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text:
                                    authC.userDetail.value!.bloodGroup ?? 'N/A',
                                bold: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          KText(
                            text: 'NID Front:',
                            fontSize: 13,
                            bold: true,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          updateProfileCreateC.nidFImg.value != null &&
                                  updateProfileCreateC.nidF.value == null
                              ? Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: GestureDetector(
                                    onTap: updateProfileCreateC.nidFImg.value !=
                                                null &&
                                            updateProfileCreateC.nidF.value ==
                                                null
                                        ? () async {
                                            await showDialog(
                                              context: context,
                                              builder: (context) => PhotoView(
                                                backgroundDecoration:
                                                    BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                imageProvider: MemoryImage(
                                                    updateProfileCreateC
                                                        .nidFImg.value!),
                                              ),
                                            );
                                          }
                                        : () {},
                                    child: Padding(
                                        padding: EdgeInsets.all(1.0),
                                        child: Container(
                                          margin: EdgeInsets.only(right: 8),
                                          height: 200,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: hexToColor('#DFDFDF')),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: MemoryImage(
                                                  updateProfileCreateC
                                                      .nidFImg.value!),
                                            ),
                                          ),
                                        )),
                                  ),
                                )
                              : updateProfileCreateC.nidF.value != null
                                  ? Container(
                                      margin: EdgeInsets.only(right: 8),
                                      height: 200,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: hexToColor('#DFDFDF')),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: FileImage(
                                            File(updateProfileCreateC
                                                .nidF.value!.path),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 200,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: EdgeInsets.all(1.0),
                                        child: Image.asset(
                                          '${Constants.imgPath}/no_image.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          KText(
                            text: 'NID Back:',
                            fontSize: 13,
                            bold: true,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          updateProfileCreateC.nidBImg.value != null &&
                                  updateProfileCreateC.nidB.value == null
                              ? Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: GestureDetector(
                                    onTap: updateProfileCreateC.nidBImg.value !=
                                                null &&
                                            updateProfileCreateC.nidB.value ==
                                                null
                                        ? () async {
                                            await showDialog(
                                              context: context,
                                              builder: (context) => PhotoView(
                                                backgroundDecoration:
                                                    BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                imageProvider: MemoryImage(
                                                  updateProfileCreateC
                                                      .nidBImg.value!,
                                                ),
                                              ),
                                            );
                                          }
                                        : () {},
                                    child: Padding(
                                        padding: EdgeInsets.all(1.0),
                                        child: Container(
                                          margin: EdgeInsets.only(right: 8),
                                          height: 200,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: hexToColor('#DFDFDF')),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: MemoryImage(
                                                updateProfileCreateC
                                                    .nidBImg.value!,
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                )
                              : updateProfileCreateC.nidB.value != null
                                  ? Container(
                                      margin: EdgeInsets.only(right: 8),
                                      height: 200,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: hexToColor('#DFDFDF')),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: FileImage(
                                            File(updateProfileCreateC
                                                .nidB.value!.path),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 200,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: EdgeInsets.all(1.0),
                                        child: Image.asset(
                                          '${Constants.imgPath}/no_image.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                        ],
                      ),

                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     KText(
                      //       text: 'NID Back:',
                      //       fontSize: 13,
                      //       bold: true,
                      //     ),
                      //     SizedBox(
                      //       width: 20,
                      //     ),
                      //     updateProfileCreateC.nidBImg.value != null &&
                      //             updateProfileCreateC.nidB.value == null
                      //         ? Container(
                      //             width: 200,
                      //             decoration: BoxDecoration(
                      //               color: Colors.white,
                      //             ),
                      //             child: GestureDetector(
                      //               onTap: updateProfileCreateC.nidBImg.value !=
                      //                           null &&
                      //                       updateProfileCreateC.nidB.value ==
                      //                           null
                      //                   ? () async {
                      //                       await showDialog(
                      //                         context: context,
                      //                         builder: (context) => PhotoView(
                      //                           backgroundDecoration:
                      //                               BoxDecoration(
                      //                                   borderRadius:
                      //                                       BorderRadius.circular(
                      //                                           10)),
                      //                           imageProvider: MemoryImage(
                      //                             updateProfileCreateC
                      //                                 .nidBImg.value!,
                      //                           ),
                      //                         ),
                      //                       );
                      //                     }
                      //                   : () {},
                      //               child: Padding(
                      //                   padding: EdgeInsets.all(1.0),
                      //                   child: Container(
                      //                     margin: EdgeInsets.only(right: 8),
                      //                     height: 200,
                      //                     width: 200,
                      //                     decoration: BoxDecoration(
                      //                       border: Border.all(
                      //                           width: 2,
                      //                           color: hexToColor('#DFDFDF')),
                      //                       image: DecorationImage(
                      //                         fit: BoxFit.fill,
                      //                         image: MemoryImage(
                      //                           updateProfileCreateC
                      //                               .nidBImg.value!,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   )),
                      //             ),
                      //           )
                      //         : updateProfileCreateC.nidB.value != null
                      //             ? Container(
                      //                 margin: EdgeInsets.only(right: 8),
                      //                 height: 200,
                      //                 width: 200,
                      //                 decoration: BoxDecoration(
                      //                   border: Border.all(
                      //                       width: 2,
                      //                       color: hexToColor('#DFDFDF')),
                      //                   image: DecorationImage(
                      //                     fit: BoxFit.fill,
                      //                     image: FileImage(
                      //                       File(updateProfileCreateC
                      //                           .nidB.value!.path),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               )
                      //             : Container(
                      //                 width: 200,
                      //                 decoration: BoxDecoration(
                      //                     color: Colors.white,
                      //                     borderRadius:
                      //                         BorderRadius.circular(20)),
                      //                 child: Padding(
                      //                   padding: EdgeInsets.all(1.0),
                      //                   child: Image.asset(
                      //                     '${Constants.imgPath}/no_image.png',
                      //                     fit: BoxFit.cover,
                      //                   ),
                      //                 ),
                      //               ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          KText(
                            text: 'Status:',
                            fontSize: 13,
                            bold: true,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            height: 30,
                            width: 110,
                            decoration: BoxDecoration(
                                color: hexToColor('#00BCD5'),
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  '${Constants.svgPath}/up_arrow.svg',
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Submitted',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                //  Positioned(
                //   top: 30,
                //   left: 50,
                //   child: Container(
                //     height: 100,
                //     color: hexToColor('#00BCD5'),
                //     child: SvgPicture.asset(
                //       '${Constants.svgPath}/ nid_card.svg',
                //     ),
                //   ),
                // ),
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        offset: Offset(
                          1,
                          1,
                        ), // Shadow position
                      ),
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        offset: Offset(
                          -1,
                          -1,
                        ), // Shadow position
                      ),
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        offset: Offset(
                          -1,
                          1,
                        ), // Shadow position
                      ),
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        offset: Offset(
                          1,
                          -1,
                        ), // Shadow position
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(3),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: hexToColor('#00BCD5'),
                    child: SvgPicture.asset(
                      '${Constants.svgPath}/nid_card.svg',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
