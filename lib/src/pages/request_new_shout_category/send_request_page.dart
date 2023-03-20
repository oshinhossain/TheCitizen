import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/loading.dart';

class SendRequestTab extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KText(
                    text: 'New Category Name',
                    fontSize: 16,
                    color: hexToColor('#72778F'),
                  ),
                  Obx(
                    () => TextFormField(
                      initialValue: reqShoutCategoryC.categoryName.value,
                      decoration: InputDecoration(),
                      onChanged: reqShoutCategoryC.categoryName,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  KText(
                    text: 'Description',
                    fontSize: 16,
                    color: hexToColor('#72778F'),
                  ),
                  Obx(
                    () => TextFormField(
                      initialValue: reqShoutCategoryC.description.value,
                      decoration: InputDecoration(),
                      onChanged: reqShoutCategoryC.description,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        reqShoutCategoryC.addNewShout();
                      },
                      icon: Icon(
                        Icons.upload,
                        color: Colors.white,
                      ),
                      label: reqShoutCategoryC.isSubmit.value
                          ? Loading()
                          : KText(
                              text: "Submit",
                              fontSize: 20,
                              color: Colors.white,
                              bold: true,
                            ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                        backgroundColor: MaterialStateProperty.all<Color>(AppTheme.appFooterColor), //#78909C
                        fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(140)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
