import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/common_title.dart';
import 'package:the_citizen_app/src/helpers/custom_textfield_with_dropdown.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/services/validation_service.dart';

class TabAcademyInfo extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    updateProfileCreateC.updateProfileImageGet('ssc');
    updateProfileCreateC.updateProfileImageGet('hsc');
    updateProfileCreateC.updateProfileImageGet('bachelor');
    updateProfileCreateC.updateProfileImageGet('masters');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTitle(
                  title: 'SSC',
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller:
                      updateProfileCreateC.sscPassingYearController.value,
                  onChanged: updateProfileCreateC.sscPassingYear,
                  decoration: InputDecoration(
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        KText(
                          text: 'Passing Year',
                          color: AppTheme.textColor,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                    hintText: 'Passing Year',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: updateProfileCreateC.sscInstituteController.value,
                  onChanged: updateProfileCreateC.uVNameSSC,
                  decoration: InputDecoration(
                    // errorText: ValidationService().validateEmail(updateProfileCreateC.uVNameSSC.value),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        KText(
                          text: 'University / Institution',
                          color: AppTheme.textColor,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                    hintText: 'University / Institution',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                KText(
                  text: 'Group Name',
                  color: AppTheme.textColor,
                  fontSize: 16,
                ),
                CustomTextFieldWithDropdown(
                  suffix: DropdownButton(
                    value: updateProfileCreateC.selectedGroupName.value,
                    underline: Container(),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: hexToColor('#80939D'),
                    ),
                    items: updateProfileCreateC.groupName.map((item) {
                      return DropdownMenuItem(
                        onTap: () {
                          updateProfileCreateC.selectedGroupName.value = item;
                        },
                        value: item,
                        child: SizedBox(
                          width: Get.width - 44,
                          child: KText(
                            text: item,
                            fontSize: 13,
                            maxLines: 2,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (item) {},
                  ),
                ),
                TextFormField(
                  controller:
                      updateProfileCreateC.sscCertificateController.value,
                  onChanged: updateProfileCreateC.certificateNoSSC,
                  decoration: InputDecoration(
                    // errorText: ValidationService().validateEmail(updateProfileCreateC.certificateNoSSC.value),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        KText(
                          text: 'Certificate Number',
                          color: AppTheme.textColor,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                    hintText: 'Certificate Number',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                KText(
                  text: 'Certificate Copy',
                  color: AppTheme.textColor,
                  fontSize: 16,
                ),
                Row(
                  children: [
                    KText(
                      text: updateProfileCreateC.ssc.value != null
                          ? 'Tax Certificate is Uploaded'
                          : 'Capture or Upload ',
                      fontSize: 13,
                      bold: true,
                      color: hexToColor('#00A5EC'),
                    ),
                    Spacer(),
                    IconButton(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.all(0),
                      onPressed: () async {
                        await updateProfileCreateC.pickMultiImage(
                            'ssc', ImageSource.camera);
                      },
                      icon: Icon(Icons.camera_alt),
                      // icon: RenderSvg(
                      //   path: 'Icons.camera_alt',
                      //   width: 16,
                      // ),
                    ),
                    IconButton(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.all(0),
                      onPressed: () async {
                        await updateProfileCreateC.pickMultiImage(
                            'ssc', ImageSource.gallery);
                      },
                      icon: Icon(Icons.image),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                updateProfileCreateC.sscImg.value != null &&
                        updateProfileCreateC.ssc.value == null
                    ? Container(
                        margin: EdgeInsets.only(right: 8),
                        height: 200,
                        width: Get.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: hexToColor('#DFDFDF')),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                MemoryImage(updateProfileCreateC.sscImg.value!),
                          ),
                        ),
                      )
                    : updateProfileCreateC.ssc.value != null
                        ? Container(
                            margin: EdgeInsets.only(right: 8),
                            height: 200,
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: hexToColor('#DFDFDF')),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(
                                  File(updateProfileCreateC.ssc.value!.path),
                                ),
                              ),
                            ),
                          )
                        : KText(text: ''),
                SizedBox(
                  height: 20,
                ),
                CommonTitle(
                  title: 'HSC',
                ),
                TextFormField(
                  controller:
                      updateProfileCreateC.hscPassingYearController.value,
                  onChanged: updateProfileCreateC.hscPassingYear,
                  decoration: InputDecoration(
                    //   errorText: ValidationService().validateEmail(updateProfileCreateC.hscPassingYear.value),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        KText(
                          text: 'Passing Year',
                          color: AppTheme.textColor,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                    hintText: 'Passing Year',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: updateProfileCreateC.hscInstituteController.value,
                  onChanged: updateProfileCreateC.uVNameHSC,
                  decoration: InputDecoration(
                    errorText: ValidationService()
                        .validateEmail(updateProfileCreateC.uVNameHSC.value),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        KText(
                          text: 'University / Institution',
                          color: AppTheme.textColor,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                    hintText: 'University / Institution',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                KText(
                  text: 'Group Name',
                  color: AppTheme.textColor,
                  fontSize: 16,
                ),
                CustomTextFieldWithDropdown(
                  suffix: DropdownButton(
                    value: updateProfileCreateC.selectedGroupNameHsc.value,
                    underline: Container(),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: hexToColor('#80939D'),
                    ),
                    items: updateProfileCreateC.groupName.map((item) {
                      return DropdownMenuItem(
                        onTap: () {
                          updateProfileCreateC.selectedGroupNameHsc.value =
                              item;
                        },
                        value: item,
                        child: SizedBox(
                          width: Get.width - 44,
                          child: KText(
                            text: item,
                            fontSize: 13,
                            maxLines: 2,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (item) {},
                  ),
                ),
                TextFormField(
                  controller:
                      updateProfileCreateC.hscCertificateController.value,
                  onChanged: updateProfileCreateC.certificateNoHSC,
                  decoration: InputDecoration(
                    errorText: ValidationService().validateEmail(
                        updateProfileCreateC.certificateNoHSC.value),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        KText(
                          text: 'Certificate Number',
                          color: AppTheme.textColor,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                    hintText: 'Certificate Number',
                  ),
                ),
                KText(
                  text: 'Certificate Copy',
                  color: AppTheme.textColor,
                  fontSize: 16,
                ),
                Row(
                  children: [
                    KText(
                      text: updateProfileCreateC.hsc.value != null
                          ? 'Certificate Uploaded'
                          : 'Capture or Upload ',
                      fontSize: 13,
                      bold: true,
                      color: hexToColor('#00A5EC'),
                    ),
                    Spacer(),
                    IconButton(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.all(0),
                      onPressed: () async {
                        await updateProfileCreateC.pickMultiImage(
                            'hsc', ImageSource.camera);
                      },
                      icon: Icon(Icons.camera_alt),
                      // icon: RenderSvg(
                      //   path: 'Icons.camera_alt',
                      //   width: 16,
                      // ),
                    ),
                    IconButton(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.all(0),
                      onPressed: () async {
                        await updateProfileCreateC.pickMultiImage(
                            'hsc', ImageSource.gallery);
                      },
                      icon: Icon(Icons.image),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                updateProfileCreateC.hscImg.value != null &&
                        updateProfileCreateC.hsc.value == null
                    ? Container(
                        margin: EdgeInsets.only(right: 8),
                        height: 200,
                        width: Get.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: hexToColor('#DFDFDF')),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                MemoryImage(updateProfileCreateC.hscImg.value!),
                          ),
                        ),
                      )
                    : updateProfileCreateC.hsc.value != null
                        ? Container(
                            margin: EdgeInsets.only(right: 8),
                            height: 200,
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: hexToColor('#DFDFDF')),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(
                                  File(updateProfileCreateC.hsc.value!.path),
                                ),
                              ),
                            ),
                          )
                        : KText(text: ''),
                SizedBox(
                  height: 20,
                ),
                CommonTitle(
                  title: 'Bachelor',
                ),
                TextFormField(
                  controller:
                      updateProfileCreateC.bscPassingYearController.value,
                  onChanged: updateProfileCreateC.bscPassingYear,
                  decoration: InputDecoration(
                    // errorText: ValidationService().validateEmail(updateProfileCreateC.bscPassingYear.value),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        KText(
                          text: 'Passing Year',
                          color: AppTheme.textColor,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                    hintText: 'Passing Year',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: updateProfileCreateC.bscInstituteController.value,
                  onChanged: updateProfileCreateC.uVNameBSC,
                  decoration: InputDecoration(
                    errorText: ValidationService()
                        .validateEmail(updateProfileCreateC.uVNameBSC.value),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        KText(
                          text: 'University / Institution',
                          color: AppTheme.textColor,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                    hintText: 'University / Institution',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: updateProfileCreateC.bscSubController.value,
                  onChanged: updateProfileCreateC.subNameBSC,
                  decoration: InputDecoration(
                    errorText: ValidationService()
                        .validateEmail(updateProfileCreateC.subNameBSC.value),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        KText(
                          text: 'Subject Name',
                          color: AppTheme.textColor,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                    hintText: 'Subject Name',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller:
                      updateProfileCreateC.bscCertificateController.value,
                  onChanged: updateProfileCreateC.certificateNoBSC,
                  decoration: InputDecoration(
                    errorText: ValidationService().validateEmail(
                        updateProfileCreateC.certificateNoBSC.value),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        KText(
                          text: 'Certificate Number',
                          color: AppTheme.textColor,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                    hintText: 'Certificate Number',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                KText(
                  text: 'Certificate Copy',
                  color: AppTheme.textColor,
                  fontSize: 16,
                ),
                Row(
                  children: [
                    KText(
                      text: updateProfileCreateC.bsc.value != null
                          ? 'Certificate  Uploaded'
                          : 'Capture or Upload ',
                      fontSize: 13,
                      bold: true,
                      color: hexToColor('#00A5EC'),
                    ),
                    Spacer(),
                    IconButton(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.all(0),
                      onPressed: () async {
                        await updateProfileCreateC.pickMultiImage(
                            'bsc', ImageSource.camera);
                      },
                      icon: Icon(Icons.camera_alt),
                      // icon: RenderSvg(
                      //   path: 'Icons.camera_alt',
                      //   width: 16,
                      // ),
                    ),
                    IconButton(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.all(0),
                      onPressed: () async {
                        await updateProfileCreateC.pickMultiImage(
                            'bsc', ImageSource.gallery);
                      },
                      icon: Icon(Icons.image),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                updateProfileCreateC.bscImg.value != null &&
                        updateProfileCreateC.bsc.value == null
                    ? Container(
                        margin: EdgeInsets.only(right: 8),
                        height: 200,
                        width: Get.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: hexToColor('#DFDFDF')),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                MemoryImage(updateProfileCreateC.bscImg.value!),
                          ),
                        ),
                      )
                    : updateProfileCreateC.bsc.value != null
                        ? Container(
                            margin: EdgeInsets.only(right: 8),
                            height: 200,
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: hexToColor('#DFDFDF')),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(
                                  File(updateProfileCreateC.bsc.value!.path),
                                ),
                              ),
                            ),
                          )
                        : KText(text: ''),
                SizedBox(
                  height: 20,
                ),
                CommonTitle(
                  title: 'Masters',
                ),
                TextFormField(
                  controller:
                      updateProfileCreateC.mscPassingYearController.value,
                  onChanged: updateProfileCreateC.mscPassingYear,
                  decoration: InputDecoration(
                    // errorText: ValidationService().validateEmail(updateProfileCreateC.mscPassingYear.value),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        KText(
                          text: 'Passing Year',
                          color: AppTheme.textColor,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                    hintText: 'Passing Year',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: updateProfileCreateC.mscInstituteController.value,
                  onChanged: updateProfileCreateC.uVNameMSC,
                  decoration: InputDecoration(
                    errorText: ValidationService()
                        .validateEmail(updateProfileCreateC.uVNameMSC.value),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        KText(
                          text: 'University / Institution',
                          color: AppTheme.textColor,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                    hintText: 'University / Institution',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: updateProfileCreateC.mscSubController.value,
                  onChanged: updateProfileCreateC.subNameMSC,
                  decoration: InputDecoration(
                    errorText: ValidationService()
                        .validateEmail(updateProfileCreateC.subNameMSC.value),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        KText(
                          text: 'Subject Name',
                          color: AppTheme.textColor,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                    hintText: 'Subject Name',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller:
                      updateProfileCreateC.mscCertificateController.value,
                  onChanged: updateProfileCreateC.certificateNoMSC,
                  decoration: InputDecoration(
                    errorText: ValidationService().validateEmail(
                        updateProfileCreateC.certificateNoMSC.value),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        KText(
                          text: 'Certificate Number',
                          color: AppTheme.textColor,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                    hintText: 'Certificate Number',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                KText(
                  text: 'Certificate Copy',
                  color: AppTheme.textColor,
                  fontSize: 16,
                ),
                Row(
                  children: [
                    KText(
                      text: updateProfileCreateC.msc.value != null
                          ? 'Certificate Uploaded'
                          : 'Capture or Upload ',
                      fontSize: 13,
                      bold: true,
                      color: hexToColor('#00A5EC'),
                    ),
                    Spacer(),
                    IconButton(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.all(0),
                      onPressed: () async {
                        await updateProfileCreateC.pickMultiImage(
                            'msc', ImageSource.camera);
                      },
                      icon: Icon(Icons.camera_alt),
                      // icon: RenderSvg(
                      //   path: 'Icons.camera_alt',
                      //   width: 16,
                      // ),
                    ),
                    IconButton(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.all(0),
                      onPressed: () async {
                        await updateProfileCreateC.pickMultiImage(
                            'msc', ImageSource.gallery);
                      },
                      icon: Icon(Icons.image),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                updateProfileCreateC.mscImg.value != null &&
                        updateProfileCreateC.msc.value == null
                    ? Container(
                        margin: EdgeInsets.only(right: 8),
                        height: 200,
                        width: Get.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: hexToColor('#DFDFDF')),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                MemoryImage(updateProfileCreateC.mscImg.value!),
                          ),
                        ),
                      )
                    : updateProfileCreateC.msc.value != null
                        ? Container(
                            margin: EdgeInsets.only(right: 8),
                            height: 200,
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: hexToColor('#DFDFDF')),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(
                                  File(updateProfileCreateC.msc.value!.path),
                                ),
                              ),
                            ),
                          )
                        : KText(text: ''),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
