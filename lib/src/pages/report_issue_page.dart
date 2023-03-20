import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/components/BottomNavigationBar.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/custom_dialog_helper.dart';
import 'package:the_citizen_app/src/models/shout_sub_categories.dart';
import 'package:toast/toast.dart';

import '../config/app_color.dart';
import '../config/app_theme.dart';
import '../helpers/k_log.dart';
import '../helpers/k_text.dart';
import '../helpers/route.dart';
import 'Search_location.dart';
import 'camerascreen/camera_screen.dart';

class ReportIssuePage extends StatefulWidget {
  final ShoutSubCategories? subCategory;

  ReportIssuePage({super.key, this.subCategory});

  @override
  State<ReportIssuePage> createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportIssuePage> with Base {
  @override
  void initState() {
    super.initState();
    shoutC.getAgencyBySubcategoryId(subcategoryId: widget.subCategory!.id!);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    shoutC.selectedLocation.value = null;
    shoutC.imagefiles.clear();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return SafeArea(
      child: OrientationBuilder(
        builder: (context, orientation) {
          return Scaffold(
            backgroundColor: AppTheme.backgroundColor,
            appBar: AppBar(
              backgroundColor: AppTheme.backgroundColor,
              title: Text(
                'Report an Issue',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 18.0,
                  color: AppTheme.appBarTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              iconTheme: IconThemeData(
                color: AppTheme.textColor6,
              ),
            ),
            body: Obx(
              () => Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                        // controller: controller,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: KText(
                                  text: '  ${widget.subCategory!.categoryName!} > ${widget.subCategory!.subcategoryName!}',
                                  bold: true,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              SizedBox(
                                width: Get.width,
                                height: Get.height / 4.0,
                                child: shoutC.imagefiles.isNotEmpty
                                    ? ListView.builder(
                                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        primary: false,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: shoutC.imagefiles.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          final item = shoutC.imagefiles[index];
                                          return InkWell(
                                            onTap: () {
                                              CustomDialogHelper.showDialogForDeleteImage(
                                                context: context,
                                                index: index,
                                                imageFile: File(item.path),
                                                onPress: () {
                                                  shoutC.imagefiles.remove(item);
                                                  back();
                                                },
                                              );
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(
                                                  color: Colors.red.shade300,
                                                  width: 2,
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Image.file(
                                                  File(item.path),
                                                  fit: BoxFit.cover,
                                                  width: MediaQuery.of(context).size.width - 28,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          side: BorderSide(color: AppTheme.appBarColor, width: 1),
                                        ),
                                        child: Container(
                                          child: AspectRatio(
                                            aspectRatio: 16 / 9,
                                            child: Image.asset(
                                              // 'assets/images/no_image.png',
                                              'assets/images/citizen-camera.png',
                                              fit: BoxFit.fill,
                                              // width: MediaQuery.of(context).size.width,
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                height: 35,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: shoutC.imagefiles.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.black26,
                                          child: Text(
                                            (index + 1).toString(),
                                            style: const TextStyle(color: Colors.white),
                                          ),
                                        );
                                      },
                                    ),
                                    OutlinedButton.icon(
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: AppTheme.textColor1,
                                        backgroundColor: AppTheme.appBarColor,
                                        side: BorderSide(color: AppTheme.appBarColor, width: 1),
                                        elevation: 5,
                                        //  minimumSize: Size(157, 35),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                      ),
                                      icon: Icon(Icons.camera_alt_rounded),
                                      label: Text(
                                        'Capture Image',
                                        style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontSize: 14.0,
                                          color: AppTheme.textColor1,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      onPressed: () async {
                                        if (shoutC.imagefiles.length <= 2) {
                                          push(CameraPage());
                                        } else {
                                          Toast.show(
                                            "You Cannot capture more than 3 image",
                                            duration: Toast.lengthLong,
                                            gravity: Toast.bottom,
                                            backgroundColor: Colors.black54,
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          if (shoutC.shoutAttentionDropdown.isNotEmpty)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  child: KText(
                                    text: 'Attention ',
                                    color: AppTheme.textColor4,
                                    fontSize: 16,
                                  ),
                                  onTap: () {},
                                ),
                                SizedBox(height: 5),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppTheme.textColor1, //remove color to make it transpatent
                                    border: Border.all(
                                      width: 1.5,
                                      style: BorderStyle.solid,
                                      color: AppTheme.textColor1,
                                    ),
                                  ),
                                  child: DropdownButton(
                                    isExpanded: true,
                                    iconSize: 24,
                                    elevation: 10,
                                    underline: Container(
                                      height: 0,
                                      color: AppTheme.textColor6,
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontSize: 14.0,
                                      color: AppTheme.textColor6,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    icon: Expanded(
                                      flex: 0,
                                      child: SizedBox(
                                        width: 25,
                                        height: 25,
                                        child: ImageIcon(
                                          AssetImage("assets/images/down_arrow.png"),
                                          color: AppTheme.textColor5,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    value: shoutC.selectedAttentionDropdown.value!.agencyName,
                                    items: shoutC.shoutAttentionDropdown
                                        .map((element) => DropdownMenuItem(
                                              value: element.agencyName,
                                              child: KText(text: element.agencyName),
                                              onTap: () {
                                                shoutC.selectedAttentionDropdown.value = element;
                                              },
                                            ))
                                        .toList(),
                                    onChanged: (newValue) {},
                                    hint: Container(
                                      child: Text('Not found'),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          SizedBox(height: 15),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 24.0,
                                      width: 24.0,
                                      child: Checkbox(
                                        activeColor: AppTheme.appBarColor,
                                        value: shoutC.knownLocation.value,
                                        onChanged: (value) {
                                          shoutC.knownLocation.value = value!;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        'Known Location',
                                        style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontSize: 16.0,
                                          color: AppTheme.textColor4,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                if (shoutC.knownLocation.value)
                                  Column(
                                    children: [
                                      SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          push(SearchLocation());
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 45,
                                          padding: EdgeInsets.only(
                                            left: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: AppTheme.textColor1, //remove color to make it transpatent
                                            border: Border.all(
                                              width: 1.0,
                                              style: BorderStyle.solid,
                                              color: AppTheme.textColor1,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: KText(
                                                  text: shoutC.selectedLocation.value != null
                                                      ? '${shoutC.selectedLocation.value!.address}'
                                                      : 'Search location...',
                                                  maxLines: 2,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              IconButton(
                                                onPressed: () => push(SearchLocation()),
                                                icon: Icon(
                                                  Icons.search,
                                                  color: Colors.grey.withOpacity(.7),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                // searchKnownLocation(),
                              ],
                            ),
                          ),
                          // SizedBox(height: 7),
                          // searchKnownLocation(),

                          // SizedBox(height: 10),
                          // _SelectIsKnowLocation(),
                          SizedBox(height: 15),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              KText(
                                text: 'Response Urgency ',
                                color: AppTheme.textColor4,
                                fontSize: 16,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                // width: double.infinity,
                                width: MediaQuery.of(context).size.width * .960,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppTheme.textColor1, //remove color to make it transpatent
                                  border: Border.all(
                                    width: 0.0,
                                    style: BorderStyle.solid,
                                    color: AppTheme.textColor1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Radio(
                                      fillColor: MaterialStateColor.resolveWith((states) => AppTheme.appBarColor),
                                      value: 'Immediate',
                                      groupValue: shoutC.urgencyLevel.value,
                                      onChanged: (value) {
                                        shoutC.urgencyLevel.value = value!;
                                      },
                                    ),
                                    Text(
                                      'Immediate',
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 14.0,
                                        color: AppTheme.textColor4,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Radio(
                                      fillColor: MaterialStateColor.resolveWith((states) => AppTheme.appBarColor),
                                      value: 'ASAP',
                                      groupValue: shoutC.urgencyLevel.value,
                                      onChanged: (value) {
                                        shoutC.urgencyLevel.value = value!;
                                      },
                                    ),
                                    Text(
                                      'ASAP',
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 14.0,
                                        color: AppTheme.textColor4,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 24.0,
                                  width: 24.0,
                                  child: new Checkbox(
                                    activeColor: AppTheme.appBarColor,
                                    value: shoutC.keepMeAnonymous.value,
                                    onChanged: (value) {
                                      shoutC.keepMeAnonymous.value = value!;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: InkWell(
                                    child: Text(
                                      "Keep me anonymous",
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 14.0,
                                        // color: textColor4,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onTap: () {
                                      // Toast.show(
                                      //   'If you want to hide your identity to the receiving organisation, you have to tick this checkbox.',
                                      //   context,
                                      //   gravity: Toast.CENTER,
                                      //   duration: Toast.LENGTH_LONG,
                                      // );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),

                          Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppTheme.textColor1,
                            ),
                            child: TextField(
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 14.0,
                                color: AppTheme.textColor4,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 10,
                              minLines: 3,
                              keyboardType: TextInputType.multiline,
                              onChanged: (value) {
                                shoutC.remarks.value = value;
                              },
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: "Enter your comment here...",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppTheme.textColor1, width: 0.0),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppTheme.textColor1, width: 0.0),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppTheme.textColor1, width: 0.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppTheme.textColor1, width: 0.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppTheme.textColor1, width: 0.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                  gapPadding: 10,
                                ),
                                labelText: 'Comment',
                                //errorText: state.comments.invalid ? 'Invalid Comments' : null,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              shoutC.isSubmitButtonValid() ? AppTheme.appBarColor : AppTheme.appBarColor.withOpacity(.1)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          visualDensity: VisualDensity(vertical: 2),
                        ),
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 16.0,
                            color: AppTheme.textColor1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onPressed: shoutC.isSubmitButtonValid()
                            ? () {
                                shoutC.addShout(
                                    subcategoryId: widget.subCategory!.id!, subcategoryName: widget.subCategory!.subcategoryName!);
                              }
                            : () {
                                kLog('Not Ok');
                              },
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            floatingActionButton: null,
            bottomNavigationBar: BottomNavigationComponent(),
          );
        },
      ),
    );
  }

  // showDialogForDeleteImage({
  //   required BuildContext context,
  //   required int index,
  //   required VoidCallback onPress,
  //   required File imageFile,
  // }) {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext dialogContext) {
  //       return AlertDialog(
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //         contentPadding: EdgeInsets.zero,
  //         content: SingleChildScrollView(
  //           physics: BouncingScrollPhysics(),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               ClipRRect(
  //                 borderRadius: const BorderRadius.only(
  //                   topLeft: Radius.circular(10),
  //                   topRight: Radius.circular(10),
  //                 ),
  //                 child: Image.file(
  //                   imageFile,
  //                   fit: BoxFit.cover,
  //                   width: Get.width,
  //                   height: Get.height / 2,
  //                 ),
  //               ),
  //               SizedBox(height: 10),
  //               Align(
  //                 alignment: Alignment.center,
  //                 child: KText(
  //                   text: 'Do you want to delete\nthis image ?',
  //                   textAlign: TextAlign.center,
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(
  //                   top: 20,
  //                   bottom: 20,
  //                   left: 20,
  //                   right: 20,
  //                 ),
  //                 child: Row(
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Expanded(
  //                       child: ElevatedButton(
  //                         style: ButtonStyle(
  //                           backgroundColor: MaterialStateProperty.all<Color>(
  //                             AppColors.appBarColor!,
  //                           ),
  //                         ),
  //                         onPressed: () => back(),
  //                         child: KText(
  //                           text: 'Cancel',
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(width: 40),
  //                     Expanded(
  //                       child: ElevatedButton(
  //                         style: ButtonStyle(
  //                           backgroundColor:
  //                               MaterialStateProperty.all<Color>(Colors.red),
  //                         ),
  //                         onPressed: onPress,
  //                         child: KText(
  //                           text: 'Delete',
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                     )
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
}

// ignore: unused_element
class _BottomNavigationSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: Get.width,
    );
    // return BlocBuilder<HomeBloc, HomeState>(
    //   builder: (BuildContext context, state) {
    //     return bottomNavigationForOtherPage(context: context, hasAgencies: state.agencies.isNotEmpty ? true : false);
    //   },
    // );
  }
}
