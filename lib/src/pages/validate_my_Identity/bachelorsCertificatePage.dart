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

class BachelorsCertificatePage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
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
        // title: Text(
        //   'Passport',
        //   style: TextStyle(
        //     decoration: TextDecoration.lineThrough,
        //     fontFamily: 'Manrope',
        //     fontSize: 18.0,
        //     color: AppTheme.appBarTextColor,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        title: KText(
          text: 'Bachelors Certificate',
          fontSize: 18,
          bold: true,
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
                  margin:
                      EdgeInsets.only(top: 40, left: 5, right: 5, bottom: 30),
                  // to push the box half way below circle
                  decoration: BoxDecoration(
                    color: hexToColor('#F2FDF3'),
                    borderRadius: BorderRadius.circular(12),
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
                                text: 'Certificate No :',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text: authC.userDetail.value!
                                        .bachelorCertificateSerialNo ??
                                    'N/A',
                                bold: true,
                              ),
                              // child: Text(
                              //   authC.userDetail.value!.nidNo ?? 'N/A',
                              //   style: TextStyle(
                              //     decoration: TextDecoration.lineThrough,
                              //     fontFamily: 'Manrope',
                              //     fontSize: 15.0,
                              //     color: AppTheme.appBarTextColor,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
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
                                text: 'Subject: ',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text: authC.userDetail.value!
                                        .bachelorSubjectName ??
                                    'N/A',
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
                                text: 'University: ',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text: authC.userDetail.value!
                                        .bachelorUniversityName ??
                                    'N/A',
                                bold: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Expanded(
                      //       flex: 2,
                      //       child: Align(
                      //         alignment: Alignment.centerLeft,
                      //         child: KText(
                      //           text: 'Institution ',
                      //         ),
                      //       ),
                      //     ),
                      //     Expanded(
                      //       flex: 3,
                      //       child: Align(
                      //         alignment: Alignment.centerLeft,
                      //         child: KText(
                      //           text: 'MD. ARAFAT KABIR',
                      //           bold: true,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
                                text: 'Passomg Year: ',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text: authC.userDetail.value!
                                            .bachelorPassYear !=
                                        null
                                    ? authC.userDetail.value!.bachelorPassYear
                                        .toString()
                                    : 'N/A',
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
                                text: 'Result: ',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: KText(
                                text: 'No Data',
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
                            text: 'Attachment:',
                            fontSize: 13,
                            bold: true,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          updateProfileCreateC.bscImg.value != null &&
                                  updateProfileCreateC.bsc.value == null
                              ? Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: GestureDetector(
                                    onTap: updateProfileCreateC.bscImg.value !=
                                                null &&
                                            updateProfileCreateC.bsc.value ==
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
                                                        .bscImg.value!),
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
                                                      .bscImg.value!),
                                            ),
                                          ),
                                        )),
                                  ),
                                )
                              : updateProfileCreateC.bsc.value != null
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
                                                .bsc.value!.path),
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
                      //       text: 'Attachment:',
                      //       fontSize: 13,
                      //       bold: true,
                      //     ),
                      //     SizedBox(
                      //       width: 20,
                      //     ),
                      //     Container(
                      //       width: 200,
                      //       decoration: BoxDecoration(
                      //         color: Colors.white,
                      //       ),
                      //       child: GestureDetector(
                      //         onTap: () async {
                      //           // await showDialog(
                      //           //   context: context,
                      //           //   builder: (context) => SizedBox(
                      //           //     height: 200,
                      //           //     child: Column(
                      //           //       children: [
                      //           //         Icon(
                      //           //           Icons.close,
                      //           //         ),
                      //           //         PhotoView(
                      //           //             backgroundDecoration: BoxDecoration(
                      //           //                 borderRadius:
                      //           //                     BorderRadius.circular(10)),
                      //           //             imageProvider: AssetImage(
                      //           //                 '${Constants.imgPath}/bechelor.png')),
                      //           //       ],
                      //           //     ),
                      //           //   ),
                      //           // );
                      //           showDialog(
                      //               context: context,
                      //               builder: (BuildContext context) {
                      //                 return Dialog(
                      //                   backgroundColor: Colors.transparent,
                      //                   child: Center(
                      //                     //padding: const EdgeInsets.all(8.0),
                      //                     child: Column(
                      //                       children: [
                      //                         Align(
                      //                           alignment: Alignment.topRight,
                      //                           child: GestureDetector(
                      //                               onTap: () {
                      //                                 Get.back();
                      //                               },
                      //                               child: Icon(
                      //                                 Icons.close,
                      //                                 color: Colors.white,
                      //                                 size: 45,
                      //                               )),
                      //                         ),
                      //                         SizedBox(
                      //                           height: Get.height * .8,
                      //                           width: Get.width * .7,
                      //                           child:
                      //                               // GestureDetector(
                      //                               //     onTap: () {
                      //                               //       Get.back();
                      //                               //     },
                      //                               //     child: Icon(Icons.close)),
                      //                               PhotoView(
                      //                                   backgroundDecoration:
                      //                                       BoxDecoration(
                      //                                           borderRadius:
                      //                                               BorderRadius
                      //                                                   .circular(
                      //                                                       10)),
                      //                                   imageProvider: AssetImage(
                      //                                       '${Constants.imgPath}/bechelor.png')),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 );
                      //               });
                      //         },
                      //         child: Padding(
                      //           padding: EdgeInsets.all(1.0),
                      //           child: Image.asset(
                      //             '${Constants.imgPath}/bechelor.png',
                      //             fit: BoxFit.fill,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
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
                            width: 50,
                          ),
                          Container(
                            height: 30,
                            width: 95,
                            decoration: BoxDecoration(
                                color: hexToColor('#43A047'),
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  '${Constants.svgPath}/Vector.svg',
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Validated',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // SizedBox(
                      //   height: 35,
                      //   width: 100,
                      //   child: ElevatedButton(
                      //     onPressed: () {},
                      //     child: KText(
                      //       text: 'Validate',
                      //       color: Colors.white,
                      //       fontSize: 15,
                      //       bold: true,
                      //     ),
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: hexToColor('#78909C'),
                      //     ),
                      //   ),0;l
                      // ),
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
                    backgroundColor: hexToColor('#43A047'),
                    child: SvgPicture.asset(
                      '${Constants.svgPath}/bachelors_certificate_2.svg',
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
