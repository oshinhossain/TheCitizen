import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/app_color.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/render_svg.dart';
import 'package:the_citizen_app/src/helpers/route.dart';

class CustomDialogHelper {
  //show success Dialog
  static void successDialog({
    required String title,
    required String msg,
    required Color color,
    String? path,
    required void Function()? onPressed,
  }) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              color: hexToColor('#FFFFFF'),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              border: Border.all(color: hexToColor('#FFFFFF'), width: 1),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 12, bottom: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (path != null) RenderSvg(path: path),
                      if (path != null) SizedBox(width: 10),
                      Text(
                        title,
                        style: TextStyle(fontFamily: 'Manrope', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      KText(
                        text: msg,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size?>(Size(109, 35)),
                          backgroundColor: MaterialStateProperty.all<Color>(color),
                          visualDensity: VisualDensity(horizontal: 2),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              // side: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        onPressed: onPressed,
                        child: Text(
                          'Ok',
                          style: TextStyle(fontFamily: 'Manrope', fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void tableBottomSheet({
    //  BuildContext context,
    String? title,
    String? name,
    String? categoryName,
    String? shoutType,
    String? description,
    String? status,
  }) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: SizedBox(
        height: shoutType != null ? 400 : 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              child: Center(
                child: Text(
                  title!,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Manrope',
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                  color: AppTheme.bottmSheetHeader),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KText(
                      text: name,
                      fontSize: 16,
                    ),
                    KText(
                      text: categoryName,
                      //data.requestedCategory,
                      color: AppTheme.appTextColor2,
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    if (shoutType != null)
                      KText(
                        text: 'New Shout SubCategory',
                        fontSize: 16,
                      ),
                    if (shoutType != null)
                      KText(
                        text: shoutType,
                        color: AppTheme.appTextColor2,
                      ),
                    if (shoutType != null)
                      Divider(
                        thickness: 1.5,
                      ),
                    KText(
                      text: 'Description',
                      fontSize: 16,
                    ),
                    KText(
                      text: description,
                      color: AppTheme.appTextColor2,
                      maxLines: 3,
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    KText(
                      text: 'Status',
                      fontSize: 16,
                    ),
                    Container(
                      height: 28,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: status == "Approved"
                            ? Colors.green
                            : status == "Rejected"
                                ? Colors.red
                                : AppTheme.textColor5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          (status == "Rejected" || status == "Approved")
                              ? Icon(
                                  status == "Rejected" ? Icons.cancel_outlined : Icons.check_circle_outline,
                                  color: Colors.white,
                                  size: 20,
                                )
                              : Image.asset(
                                  "assets/icons/Pending_icon_new.png",
                                  height: 25,
                                  color: Colors.white,
                                ),
                          KText(
                            text: status,
                            color: Colors.white,
                            bold: true,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                  ],
                )),
            ElevatedButton(
              child: Text(
                "Ok",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Manrope',
                  color: Colors.white,
                ),
              ),
              onPressed: back,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(AppTheme.appFooterColor), //#78909C
                  fixedSize: MaterialStateProperty.all<Size>(
                      //Size.fromHeight(34.0),
                      Size.fromWidth(109.0)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
            ),
          ],
        ),
      ),
    ));
  }

  static void showDialogForDeleteImage({
    required BuildContext context,
    required int index,
    required VoidCallback onPress,
    required File imageFile,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.zero,
          content: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.file(
                    imageFile,
                    fit: BoxFit.cover,
                    width: Get.width,
                    height: Get.height / 2,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: KText(
                    text: 'Do you want to delete\nthis image ?',
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.appBarColor!,
                            ),
                          ),
                          onPressed: () => back(),
                          child: KText(
                            text: 'Cancel',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 40),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          onPressed: onPress,
                          child: KText(
                            text: 'Delete',
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
