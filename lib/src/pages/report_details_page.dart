import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/global_helper.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/models/process_shout.dart';

import '../config/app_theme.dart';
import '../helpers/route.dart';

class ReportDetailsPage extends StatelessWidget with Base {
  ProcessShout? myReport;
  ReportDetailsPage({this.myReport});
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
        title: Text(
          'Report Details',
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 18.0,
            color: AppTheme.appBarTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: Column(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          KText(
                            text: '${myReport!.categoryName} >',
                            fontSize: 15.0,
                            color: AppTheme.appBarTextColor,
                            bold: true,
                          ),
                          KText(
                            text: myReport!.subcategoryName,
                            fontSize: 15.0,
                            color: AppTheme.appBarTextColor,
                          )
                        ],
                      ),
                      Container(
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
                        child: Column(
                          children: [
                            SizedBox(
                              height: 200,
                              child: myReportsC.files.isNotEmpty
                                  ? Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: PhotoViewGallery.builder(
                                        itemCount: myReportsC.files.length,
                                        builder: (BuildContext context, int index) {
                                          return PhotoViewGalleryPageOptions(
                                            imageProvider: MemoryImage(myReportsC.files[index]!),
                                            // maxScale: PhotoViewComputedScale.covered,
                                            // minScale: PhotoViewComputedScale.covered,
                                            //  tightMode: true,
                                          );
                                        },
                                        scrollPhysics: BouncingScrollPhysics(),
                                        backgroundDecoration: BoxDecoration(
                                            color: Theme.of(context).canvasColor,
                                            // color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(5)),
                                        onPageChanged: (int index) {
                                          // setState(() {
                                          //   _currentIndex = index;
                                          // });
                                        },
                                      ),
                                    )
                                  : Container(
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
                              child: myReportsC.files.length != 0
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: myReportsC.files.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return Container(
                                              // padding: EdgeInsets.symmetric(horizontal: 5),
                                              padding: EdgeInsets.only(left: 5, right: 5),
                                              child: CircleAvatar(
                                                radius: 10,
                                                // backgroundColor:
                                                //     index == _currentIndex
                                                //         ? hexToColor('#F2BA14')
                                                //         : hexToColor('#C8E0EA'),
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
                                  : Center(
                                      child: Text(
                                        'No Image Available',
                                        style: TextStyle(
                                          fontFamily: 'Manrope',
                                          color: hexToColor('#000000'),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ])),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    KText(
                      text: 'Date',
                      fontSize: 15.0,
                      color: AppTheme.appBarTextColor,
                    ),
                    Spacer(),
                    KText(
                      text: 'Urgency',
                      fontSize: 15.0,
                      color: AppTheme.appBarTextColor,
                    )
                  ],
                ),
                Row(
                  children: [
                    KText(
                      text: formatDate(date: myReport!.reportDate!),
                      fontSize: 14,
                      color: AppTheme.appBarTextColor,
                      bold: true,
                    ),
                    Spacer(),
                    KText(
                      text: myReport!.urgencyLevel,
                      fontSize: 14,
                      color: AppTheme.appBarTextColor,
                      bold: true,
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 8,
                ),
                KText(
                  text: 'Remarks:',
                  fontSize: 14,
                  color: AppTheme.appBarTextColor,
                ),
                KText(
                  text: myReport!.remarks,
                  fontSize: 14,
                  bold: true,
                  color: AppTheme.appBarTextColor,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    KText(
                      text: 'Status: ',
                      fontSize: 14,
                      color: AppTheme.appBarTextColor,
                    ),
                    KText(
                      text: myReport!.fulfillmentStatus,
                      fontSize: 14,
                      color: AppTheme.appBarTextColor,
                      bold: true,
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(children: <Widget>[
                  Expanded(
                      child: Divider(
                    thickness: 1,
                  )),
                  SizedBox(
                    width: 5,
                  ),
                  KText(
                    text: "Responding Party",
                    fontSize: 14,
                    color: AppTheme.appBarTextColor,
                  ),
                  // Text("Responding Party"),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 1,
                  )),
                ]),
                SizedBox(
                  height: 8,
                ),
                KText(
                  text: 'Assigned Person: ',
                  fontSize: 14,
                  color: AppTheme.appBarTextColor,
                ),
                GestureDetector(
                  onTap: () {
                    myReportsC.userModal(userInfo: myReport);
                    teamLocationC.getUserImageFromAPI(myReport!.officerUsername!);
                  },
                  child: KText(
                    text: myReport!.officerFullname != null ? myReport!.officerFullname : '',
                    fontSize: 14,
                    bold: true,
                    color: AppTheme.appBarTextColor,
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 8,
                ),
                KText(
                  text: 'Agency Name:',
                  fontSize: 14,
                  color: AppTheme.appBarTextColor,
                ),
                KText(
                  text: myReport!.agencyName != null ? myReport!.agencyName : '',
                  fontSize: 14,
                  bold: true,
                  color: AppTheme.appBarTextColor,
                ),
                Divider(
                  thickness: 1,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      back();
                      // push(MainPage());
                    },
                    child: KText(
                      text: 'OK',
                      fontSize: 16,
                      bold: true,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: hexToColor('#78909C'),
                        fixedSize: Size(120, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
