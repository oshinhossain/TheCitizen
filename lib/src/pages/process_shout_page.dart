import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/state_manager.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/global_helper.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/models/process_shout.dart';

class ProcessShoutPage extends StatelessWidget with Base {
  final ProcessShout? rateShoutClosure;
  String? title;
  ProcessShoutPage({this.rateShoutClosure, this.title});
  @override
  Widget build(BuildContext context) {
    // myReportsC.mapMyReportListImageFetched(userInfo: rateShoutClosure);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            KText(
              text: '${rateShoutClosure!.categoryName} > ',
              fontSize: 16.0,
              color: AppTheme.appBarTextColor,
              bold: true,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: KText(
                text: '${rateShoutClosure!.subcategoryName}',
                fontSize: 16.0,
                color: AppTheme.appBarTextColor,
              ),
            ),
          ],
        ),
        iconTheme: IconThemeData(
          color: AppTheme.textColor6,
        ),
      ),
      body: Obx(
        () => ListView(
            padding: EdgeInsets.only(top: 20.0, right: 15.0, bottom: 10.0, left: 15.0),
            physics: BouncingScrollPhysics(),
            children: [
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(text: 'Date'),
                      KText(
                        text: formatDate(date: rateShoutClosure!.reportDate!),
                        bold: true,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      KText(text: 'Urgency'),
                      KText(
                        text: rateShoutClosure!.urgencyLevel!,
                        bold: true,
                      )
                    ],
                  ),
                ],
              ),
              Divider(
                color: AppTheme.textColor22,
              ),
              KText(text: 'Remarks:'),
              KText(
                text: rateShoutClosure!.remarks,
                maxLines: 3,
              ),
              Divider(
                color: AppTheme.textColor22,
              ),
              Row(
                children: [
                  KText(text: 'Submitted by:'),
                  KText(
                    text: rateShoutClosure!.officerFullname,
                    bold: true,
                  )
                ],
              ),
              KText(text: 'Coordinates:'),
              KText(
                text: '${rateShoutClosure!.officerLatitude},${rateShoutClosure!.officerLongitude}',
                bold: true,
              ),
              KText(text: 'Probable Address:'),
              KText(text: ''),
              if (title == 'rateShout') KText(text: 'Status:'),
              if (title == 'rateShout')
                KText(
                  text: rateShoutClosure!.fulfillmentStatus,
                  bold: true,
                ),
              if (title == 'rateShout')
                rateShoutClosure != null
                    ? Card(
                        color: AppTheme.textColor26,
                        elevation: 2,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          //side: BorderSide(color: AppColors.appBarColor, width: 1.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Closed By',
                                  style: TextStyle(
                                    fontFamily: 'Manrope',
                                    fontSize: 15.0,
                                    color: AppTheme.textColor27,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.5),
                              child: Card(
                                elevation: 0,
                                color: AppTheme.textColor1,
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  //   side: BorderSide(color: AppColors.appBarColor, width: 1.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: CircleAvatar(
                                          radius: 30,
                                        ),
                                        flex: 0,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                KText(text: 'Officer:'),
                                                KText(
                                                  text: rateShoutClosure!.officerFullname,
                                                  bold: true,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                KText(text: 'Agency:'),
                                                KText(
                                                  text: rateShoutClosure!.agencyName,
                                                  bold: true,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                KText(text: 'Phone:'),
                                                KText(
                                                  text: rateShoutClosure!.officerMobile,
                                                  bold: true,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                KText(text: 'Email:'),
                                                KText(
                                                  text: rateShoutClosure!.officerEmail != null ? rateShoutClosure!.officerEmail : '',
                                                  bold: true,
                                                ),
                                              ],
                                            ),
                                            // createShoutDetailsDataRow(
                                            //     title: 'Officer:',
                                            //     correspondingValue:
                                            //         rateShoutClosureModel
                                            //                 .officerFullname ??
                                            //             ''),
                                            // createShoutDetailsDataRow(
                                            //     title: 'Agency:',
                                            //     correspondingValue:
                                            //         rateShoutClosureModel
                                            //                 .agencyName ??
                                            //             ''),
                                            // createShoutDetailsDataRow(
                                            //     title: 'Phone:',
                                            //     correspondingValue:
                                            //         rateShoutClosureModel
                                            //                 .officerMobile ??
                                            //             ''),
                                            // createShoutDetailsDataRow(
                                            //     title: 'Email:',
                                            //     correspondingValue:
                                            //         rateShoutClosureModel
                                            //                 .officerEmail ??
                                            //             ''),
                                          ],
                                        ),
                                        flex: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: AppTheme.appBarColor, width: 1.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0),
                          child: Center(
                            child: Column(
                              children: [
                                Icon(Icons.info),
                                KText(text: 'Closed by officers not found'),
                              ],
                            ),
                            // child: CenteredMessage(
                            //     icon: Icons.info,
                            //     message: "Closed by officers not found"),
                          ),
                        ),
                      ),
              if (title == 'rateShout')
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (newRating) {
                        rateShoutC.ratting.value = newRating.toInt();
                        kLog('value');
                        kLog(rateShoutC.ratting.value);
                        // context
                        //     .read<RatingShoutDialogBloc>()
                        //     .add(ShoutRatingChanged(newRating));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        rateShoutC.ratting.value == 5
                            ? 'Excellent'
                            : rateShoutC.ratting.value == 4
                                ? 'Satisfactory'
                                : rateShoutC.ratting.value == 3
                                    ? 'Just works'
                                    : rateShoutC.ratting.value == 2
                                        ? 'Poor'
                                        : rateShoutC.ratting.value == 1
                                            ? 'Very Bad'
                                            : 'Not Done',
                      ),
                    ),
                  ],
                ),
              if (title == 'rateShout') KText(text: 'Write comment:'),
              if (title == 'rateShout')
                TextFormField(
                  onChanged: rateShoutC.comment,
                ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (title == 'rateShout')
                      rateShoutC.rattingShout(
                          id: rateShoutClosure!.id, lat: rateShoutClosure!.officerLatitude, lang: rateShoutClosure!.officerLongitude);
                    // reqShoutCategoryC.addNewShout();
                    if (title == 'startTask') startTaskC.startTask(rateShoutClosure!.id!);
                  },
                  child:
                      //  reqShoutCategoryC.isSubmit.value
                      //     ? Loading()
                      //     :
                      KText(
                    text: title == 'rateShout' ? "Submit" : 'Start Work',
                    fontSize: 18,
                    color: Colors.white,
                    bold: true,
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                    backgroundColor: MaterialStateProperty.all<Color>(AppTheme.appFooterColor), //#78909C
                    fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(140)),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
