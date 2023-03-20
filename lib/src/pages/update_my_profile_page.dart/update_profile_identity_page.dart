import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/common_title.dart';
import 'package:the_citizen_app/src/helpers/custom_textfield_with_dropdown.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import '../../config/app_theme.dart';
import '../../config/constants.dart';
import '../../controllers/profile_update_controller.dart';
import '../../enums/enums.dart';
import '../../helpers/global_helper.dart';
import '../../helpers/hex_color.dart';
import '../../services/validation_service.dart';

class TabNationalIdentity extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    updateProfileCreateC.updateProfileImageGet('nidfront');
    updateProfileCreateC.updateProfileImageGet('nidback');
    updateProfileCreateC.updateProfileImageGet('passport');
    updateProfileCreateC.updateProfileImageGet('birth');
    updateProfileCreateC.updateProfileImageGet('tin');
    updateProfileCreateC.updateProfileImageGet('drilic');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => ListView(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10.0),
                  SizedBox(
                    height: 10,
                  ),
                  CommonTitle(
                    title: 'NID',
                  ),
                  TextFormField(
                    controller: updateProfileCreateC.nidNoController.value,
                    onChanged: updateProfileCreateC.nidNo,
                    decoration: InputDecoration(
                      errorText: ValidationService()
                          .validateFullName(updateProfileCreateC.nidNo.value),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          KText(
                            text: 'NID Number',
                            color: AppTheme.textColor,
                            fontSize: 16,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                        ],
                      ),
                      hintText: 'Enter your NID Number',

                      // prefixIcon: Icon(
                      //   Icons.person_outline,
                      //   color: AppTheme.color3,
                      // ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      KText(
                        text: 'NID Front Side',
                        color: AppTheme.textColor,
                        fontSize: 16,
                      ),
                      Row(
                        children: [
                          KText(
                            text: updateProfileCreateC.nidF.value != null
                                ? 'NID Front Side is Uploaded'
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
                                  'nidF', ImageSource.camera);
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
                                  'nidF', ImageSource.gallery);
                            },
                            icon: Icon(Icons.image),
                            // icon: RenderSvg(
                            //   path: 'icon_top_bar_search',
                            //   width: 16,
                            // ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  updateProfileCreateC.nidFImg.value != null &&
                          updateProfileCreateC.nidF.value == null
                      ? Container(
                          margin: EdgeInsets.only(right: 8),
                          height: 200,
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: hexToColor('#DFDFDF')),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: MemoryImage(
                                  updateProfileCreateC.nidFImg.value!),
                            ),
                          ),
                        )
                      : updateProfileCreateC.nidF.value != null
                          ? Stack(children: [
                              Container(
                                margin: EdgeInsets.only(right: 8),
                                height: 200,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: hexToColor('#DFDFDF')),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: FileImage(
                                      File(updateProfileCreateC
                                          .nidF.value!.path),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    updateProfileCreateC.nidF.value = null;
                                  },
                                ),
                              ),
                            ])
                          : KText(text: ''),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      KText(
                        text: 'NID Back Side',
                        color: AppTheme.textColor,
                        fontSize: 16,
                      ),
                      Row(
                        children: [
                          KText(
                            text: updateProfileCreateC.nidB.value != null
                                ? 'NID Back Side is Uploaded'
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
                                  'nidB', ImageSource.camera);
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
                                  'nidB', ImageSource.gallery);
                            },
                            icon: Icon(Icons.image),
                            // icon: RenderSvg(
                            //   path: 'icon_top_bar_search',
                            //   width: 16,
                            // ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  updateProfileCreateC.nidBImg.value != null &&
                          updateProfileCreateC.nidB.value == null
                      ? Container(
                          margin: EdgeInsets.only(right: 8),
                          height: 200,
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: hexToColor('#DFDFDF')),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: MemoryImage(
                                updateProfileCreateC.nidBImg.value!,
                              ),
                            ),
                          ),
                        )
                      : updateProfileCreateC.nidB.value != null
                          ? Stack(children: [
                              Container(
                                margin: EdgeInsets.only(right: 8),
                                height: 200,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: hexToColor('#DFDFDF')),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: FileImage(
                                      File(updateProfileCreateC
                                          .nidB.value!.path),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    updateProfileCreateC.nidB.value = null;
                                  },
                                ),
                              ),
                            ])
                          : KText(text: ''),
                  SizedBox(
                    height: 20,
                  ),
                  CommonTitle(
                    title: 'Passport',
                  ),
                  TextFormField(
                    controller: updateProfileCreateC.passNoController.value,
                    onChanged: updateProfileCreateC.passNo,
                    decoration: InputDecoration(
                      errorText: ValidationService()
                          .validateFullName(updateProfileCreateC.passNo.value),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          KText(
                            text: 'Passport No',
                            color: AppTheme.textColor,
                            fontSize: 16,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                        ],
                      ),
                      hintText: 'Enter your Passport No',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          KText(
                            text: 'Passport Issue Date',
                            fontSize: 14,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: KText(
                          text: updateProfileCreateC
                                  .scheduledStartDate.value.isEmpty
                              ? '--/--/--'
                              : formatDate(
                                  date: updateProfileCreateC
                                      .scheduledStartDate.value),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          EvaIcons.calendarOutline,
                          color: AppTheme.primaryColor.withOpacity(.7),
                        ),
                        onPressed: () {
                          updateProfileCreateC.selectDate(DateType.start);
                        },
                        // child: GestureDetector(
                        //   onTap: () {

                        //   },
                        //   child: Icon(
                        //     EvaIcons.calendarOutline,
                        //     color: AppTheme.primaryColor.withOpacity(.7),
                        //   ),
                        // ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1.2,
                    color: hexToColor('#BFCAD2'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          KText(
                            text: 'Passport Expire Date',
                            fontSize: 14,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: KText(
                          text: updateProfileCreateC
                                  .scheduledEndDate.value.isEmpty
                              ? '--/--/--'
                              : formatDate(
                                  date: updateProfileCreateC
                                      .scheduledEndDate.value),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          updateProfileCreateC.selectDate(DateType.end);
                        },
                        icon: Icon(
                          EvaIcons.calendarOutline,
                          color: AppTheme.primaryColor.withOpacity(.7),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1.2,
                    color: hexToColor('#BFCAD2'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      KText(
                        text: 'Passport Copy',
                        color: AppTheme.textColor,
                        fontSize: 16,
                      ),
                      Row(
                        children: [
                          KText(
                            text: updateProfileCreateC.pass.value != null
                                ? 'Passport is Uploaded'
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
                                  'pass', ImageSource.camera);
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
                                  'pass', ImageSource.gallery);
                            },
                            icon: Icon(Icons.image),
                            // icon: RenderSvg(
                            //   path: 'icon_top_bar_search',
                            //   width: 16,
                            // ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  updateProfileCreateC.passImg.value != null &&
                          updateProfileCreateC.pass.value == null
                      ? Container(
                          margin: EdgeInsets.only(right: 8),
                          height: 200,
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: hexToColor('#DFDFDF')),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: MemoryImage(
                                updateProfileCreateC.passImg.value!,
                              ),
                            ),
                          ),
                        )
                      : updateProfileCreateC.pass.value != null
                          ? Stack(children: [
                              Container(
                                margin: EdgeInsets.only(right: 8),
                                height: 200,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: hexToColor('#DFDFDF')),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: FileImage(
                                      File(updateProfileCreateC
                                          .pass.value!.path),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    updateProfileCreateC.pass.value = null;
                                  },
                                ),
                              ),
                            ])
                          : Container(),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CommonTitle(
                    title: 'Birth Certificate ',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: updateProfileCreateC.birthNoController.value,
                    onChanged: updateProfileCreateC.birthCNo,
                    decoration: InputDecoration(
                      errorText: ValidationService().validateFullName(
                          updateProfileCreateC.birthCNo.value),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          KText(
                            text: 'Birth Certificate Number',
                            color: AppTheme.textColor,
                            fontSize: 16,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                        ],
                      ),
                      hintText: 'Birth Certificate Number',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      KText(
                        text: 'Birth Certificate Copy',
                        color: AppTheme.textColor,
                        fontSize: 16,
                      ),
                      Row(
                        children: [
                          KText(
                            text: updateProfileCreateC.birthC.value != null
                                ? 'Birth Certificate is Uploaded'
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
                                  'birth', ImageSource.camera);
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
                                  'birth', ImageSource.gallery);
                            },
                            icon: Icon(Icons.image),
                            // icon: RenderSvg(
                            //   path: 'icon_top_bar_search',
                            //   width: 16,
                            // ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  updateProfileCreateC.birthImg.value != null &&
                          updateProfileCreateC.birthC.value == null
                      ? Container(
                          margin: EdgeInsets.only(right: 8),
                          height: 200,
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: hexToColor('#DFDFDF')),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: MemoryImage(
                                updateProfileCreateC.birthImg.value!,
                              ),
                            ),
                          ),
                        )
                      : updateProfileCreateC.birthC.value != null
                          ? Stack(children: [
                              Container(
                                margin: EdgeInsets.only(right: 8),
                                height: 200,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: hexToColor('#DFDFDF')),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: FileImage(
                                      File(updateProfileCreateC
                                          .birthC.value!.path),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    updateProfileCreateC.birthC.value = null;
                                  },
                                ),
                              ),
                            ])
                          : KText(text: ''),
                  SizedBox(
                    height: 20,
                  ),
                  CommonTitle(
                    title: 'Income Tax ',
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller:
                              updateProfileCreateC.tinNoController.value,
                          onChanged: updateProfileCreateC.taxId,
                          decoration: InputDecoration(
                            errorText: ValidationService().validateEmail(
                                updateProfileCreateC.taxId.value),
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                KText(
                                  text: 'Income Tax ID',
                                  color: AppTheme.textColor,
                                  fontSize: 16,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                              ],
                            ),
                            hintText: 'Income Tax ID',

                            // prefixIcon: Icon(
                            //   Icons.person_outline,
                            //   color: AppTheme.color3,
                            // ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        KText(
                          text: 'Tax Zone',
                          color: AppTheme.textColor,
                          fontSize: 16,
                        ),
                        CustomTextFieldWithDropdown(
                          suffix: DropdownButton(
                            value: updateProfileCreateC.selectedTaxZone.value,
                            underline: Container(),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: hexToColor('#80939D'),
                            ),
                            items: updateProfileCreateC.taxZone.map((item) {
                              return DropdownMenuItem(
                                onTap: () {
                                  updateProfileCreateC.selectedTaxZone.value =
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
                        SizedBox(
                          height: 10,
                        ),
                        KText(
                          text: 'Tax Circle',
                          color: AppTheme.textColor,
                          fontSize: 16,
                        ),
                        CustomTextFieldWithDropdown(
                          suffix: DropdownButton(
                            value: updateProfileCreateC.selectedTaxCircle.value,
                            underline: Container(),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: hexToColor('#80939D'),
                            ),
                            items: updateProfileCreateC.taxCircle.map((item) {
                              return DropdownMenuItem(
                                onTap: () {
                                  updateProfileCreateC.selectedTaxCircle.value =
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            KText(
                              text: 'Tax Certificate Copy',
                              color: AppTheme.textColor,
                              fontSize: 16,
                            ),
                            Row(
                              children: [
                                KText(
                                  text: updateProfileCreateC.taxC.value != null
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
                                        'tax', ImageSource.camera);
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
                                        'tax', ImageSource.gallery);
                                  },
                                  icon: Icon(Icons.image),
                                  // icon: RenderSvg(
                                  //   path: 'icon_top_bar_search',
                                  //   width: 16,
                                  // ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        updateProfileCreateC.taxImg.value != null &&
                                updateProfileCreateC.taxC.value == null
                            ? Container(
                                margin: EdgeInsets.only(right: 8),
                                height: 200,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: hexToColor('#DFDFDF')),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: MemoryImage(
                                      updateProfileCreateC.taxImg.value!,
                                    ),
                                  ),
                                ),
                              )
                            : updateProfileCreateC.taxC.value != null
                                ? Stack(children: [
                                    Container(
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
                                                .taxC.value!.path),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          updateProfileCreateC.taxC.value =
                                              null;
                                        },
                                      ),
                                    ),
                                  ])
                                : KText(text: ''),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CommonTitle(
                    title: 'Driving License ',
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller:
                              updateProfileCreateC.licenseNoController.value,
                          onChanged: updateProfileCreateC.licenseNo,
                          decoration: InputDecoration(
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                KText(
                                  text: 'Driving License No',
                                  color: AppTheme.textColor,
                                  fontSize: 16,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                              ],
                            ),
                            hintText: 'Driving License No',

                            // prefixIcon: Icon(
                            //   Icons.person_outline,
                            //   color: AppTheme.color3,
                            // ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller:
                              updateProfileCreateC.licenseTypeController.value,
                          onChanged: updateProfileCreateC.licenseType,
                          decoration: InputDecoration(
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                KText(
                                  text: 'Driving License Type',
                                  color: AppTheme.textColor,
                                  fontSize: 16,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                              ],
                            ),
                            hintText: 'Driving License Type',

                            // prefixIcon: Icon(
                            //   Icons.person_outline,
                            //   color: AppTheme.color3,
                            // ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: updateProfileCreateC
                              .licenseAllowedVehicleController.value,
                          onChanged: updateProfileCreateC.licenseAllowedVehicle,
                          decoration: InputDecoration(
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                KText(
                                  text: 'License Allowed Vehicle',
                                  color: AppTheme.textColor,
                                  fontSize: 16,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                              ],
                            ),
                            hintText: 'License Allowed Vehicle',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: updateProfileCreateC
                              .licenseAuthorityController.value,
                          onChanged: updateProfileCreateC.licenseAuthority,
                          decoration: InputDecoration(
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                KText(
                                  text: 'License Authority',
                                  color: AppTheme.textColor,
                                  fontSize: 16,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                              ],
                            ),
                            hintText: 'License Authority',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                KText(
                                  text: 'License Issue Date',
                                  fontSize: 16,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: KText(
                                text: updateProfileCreateC
                                        .licenseIssueDate.value.isEmpty
                                    ? '--/--/--'
                                    : formatDate(
                                        date: updateProfileCreateC
                                            .licenseIssueDate.value),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(
                                EvaIcons.calendarOutline,
                                color: AppTheme.primaryColor.withOpacity(.7),
                              ),
                              onPressed: () {
                                updateProfileCreateC
                                    .selectDate(DateType.issueDate);
                              },
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1.2,
                          color: hexToColor('#BFCAD2'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                KText(
                                  text: 'License Expire Date',
                                  fontSize: 16,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: KText(
                                text: updateProfileCreateC
                                        .licenseExpiredDate.value.isEmpty
                                    ? '--/--/--'
                                    : formatDate(
                                        date: updateProfileCreateC
                                            .licenseExpiredDate.value),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                updateProfileCreateC
                                    .selectDate(DateType.expDate);
                              },
                              icon: Icon(
                                EvaIcons.calendarOutline,
                                color: AppTheme.primaryColor.withOpacity(.7),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1.2,
                          color: hexToColor('#BFCAD2'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            KText(
                              text: 'License Copy',
                              color: AppTheme.textColor,
                              fontSize: 16,
                            ),
                            Row(
                              children: [
                                KText(
                                  text: updateProfileCreateC.licenseC.value !=
                                          null
                                      ? 'License is Uploaded'
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
                                        'dlc', ImageSource.camera);
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
                                        'dlc', ImageSource.gallery);
                                  },
                                  icon: Icon(Icons.image),
                                  // icon: RenderSvg(
                                  //   path: 'icon_top_bar_search',
                                  //   width: 16,
                                  // ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        updateProfileCreateC.drilicImg.value != null &&
                                updateProfileCreateC.licenseC.value == null
                            ? Container(
                                margin: EdgeInsets.only(right: 8),
                                height: 200,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: hexToColor('#DFDFDF')),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: MemoryImage(
                                      updateProfileCreateC.drilicImg.value!,
                                    ),
                                  ),
                                ),
                              )
                            : updateProfileCreateC.licenseC.value != null
                                ? Stack(children: [
                                    Container(
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
                                                .licenseC.value!.path),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          updateProfileCreateC.licenseC.value =
                                              null;
                                        },
                                      ),
                                    ),
                                  ])
                                : KText(text: ''),
                        SizedBox(
                          height: 10,
                        ),
                      ],
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
