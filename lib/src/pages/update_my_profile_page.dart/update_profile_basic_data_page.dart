import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';

import '../../config/app_theme.dart';
import '../../config/constants.dart';
import '../../controllers/profile_update_controller.dart';
import '../../enums/enums.dart';
import '../../helpers/hex_color.dart';
import '../../helpers/loading.dart';
import '../../helpers/render_svg.dart';
import '../../services/validation_service.dart';

class TabBasicData extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    updateProfileCreateC.getUserProfile();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
          // Obx(
          //   () =>
          ListView(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        children: <Widget>[
          Builder(builder: (context) {
            final item = authC.userDetail.value;
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      updateProfileCreateC.pickMultiImage('userImage', ImageSource.camera);
                    },
                    child: Obx(
                      () => Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppTheme.appbarColor,
                              radius: 50,
                              child: updateProfileCreateC.fileImage.value != null
                                  ? ClipOval(
                                      child: SizedBox.fromSize(
                                          size: Size.fromRadius(50),
                                          // Image radius
                                          child: updateProfileCreateC.userImage.value != null
                                              ? Image.file(updateProfileCreateC.userImage.value!, fit: BoxFit.cover)
                                              : Loading(
                                                  color: AppTheme.primaryColor,
                                                )),
                                    )
                                  : ClipOval(
                                      // borderRadius: BorderRadius.circular(50),
                                      child: SizedBox.fromSize(
                                        size: Size.fromRadius(50),
                                        child: Image.network(
                                          '${dotenv.env['BASE_URL_FSR']}/v2/user-attachment/get?latLng=23.90560,93.094535&apiKey=ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5&username=${userC.currentUser.value!.username}&appCode=KYC&fileCategory=photo&countryCode=BD',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppTheme.color4,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: SvgPicture.asset(
                                    '${Constants.svgPath}/cam.svg',
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  KText(
                    text: 'Basic Info',
                    fontSize: 15.0,
                    color: AppTheme.appBarTextColor,
                    bold: true,
                  ),
                  Row(
                    children: [
                      KText(
                        text: 'Full Name',
                        fontSize: 14,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: updateProfileCreateC.fullNameController.value,
                    onChanged: updateProfileCreateC.fullName,
                    // initialValue:
                    //     item!.username == null ? '' : '${item.username}',
                    decoration: InputDecoration(
                      enabled: false,
                      // labelText: 'Full Name will be here',
                      labelStyle: TextStyle(color: hexToColor('#D9D9D9'), fontSize: 14),
                    ),
                  ),
                  // KText(
                  //     text: updateProfileCreateC.userDetail.value!.email == null
                  //         ? ''
                  //         : '${updateProfileCreateC.userDetail.value!.email}'),
                  TextField(
                    controller: updateProfileCreateC.mobileNameController.value,
                    onChanged: updateProfileCreateC.mobileNumber,
                    decoration: InputDecoration(
                      errorText: ValidationService().validateUsername(updateProfileCreateC.mobileNumber.value),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          KText(
                            text: 'Mobile number',
                            color: AppTheme.textColor,
                            fontSize: 16,
                          ),
                        ],
                      ),
                      hintText: 'Enter your Mobile number',

                      // prefixIcon: Icon(
                      //   Icons.person_outline,
                      //   color: AppTheme.color3,
                      // ),
                    ),
                  ),
                  TextField(
                    controller: updateProfileCreateC.emailAddressController.value,
                    onChanged: authC.email,
                    decoration: InputDecoration(
                      enabled: false,

                      errorText: ValidationService().validateEmail(authC.email.value),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          KText(
                            text: 'Email',
                            color: AppTheme.textColor,
                            fontSize: 16,
                          ),
                        ],
                      ),
                      // hintText: 'Enter your email',

                      // prefixIcon: Icon(
                      //   Icons.person_outline,
                      //   color: AppTheme.color3,
                      // ),
                    ),
                  ),
                  TextField(
                    controller: updateProfileCreateC.addressNameController.value,
                    onChanged: updateProfileCreateC.address,
                    decoration: InputDecoration(
                      errorText: ValidationService().validateAddress(updateProfileCreateC.address.value),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          KText(
                            text: 'Address',
                            color: AppTheme.textColor,
                            fontSize: 16,
                          ),
                        ],
                      ),
                      hintText: 'Enter your address',

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
                        text: 'Select Your Country',
                        color: AppTheme.textColor,
                        fontSize: 16,
                      ),
                      Row(
                        children: [
                          KText(
                            text: 'Bangladesh',
                          ),
                          Spacer(),
                          IconButton(
                            constraints: BoxConstraints(),
                            padding: EdgeInsets.all(0),
                            onPressed: () async {},
                            icon: RenderSvg(
                              path: 'icon_top_bar_search',
                              width: 16,
                            ),
                          ),
                        ],
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      KText(
                        text: 'Select Your Area',
                        color: AppTheme.textColor,
                        fontSize: 16,
                      ),
                      Row(
                        children: [
                          KText(
                            text: 'Ward No 12',
                          ),
                          Spacer(),
                          IconButton(
                            constraints: BoxConstraints(),
                            padding: EdgeInsets.all(0),
                            onPressed: () async {},
                            icon: RenderSvg(
                              path: 'icon_top_bar_search',
                              width: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1.2,
                    color: hexToColor('#CFDEE3'),
                  ),
                  TextField(
                    controller: updateProfileCreateC.fatherNameController.value,
                    onChanged: updateProfileCreateC.fatherName,
                    decoration: InputDecoration(
                      // errorText:
                      //     ValidationService().validateEmail(authC.email.value),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          KText(
                            text: 'Father’s Name',
                            color: AppTheme.textColor,
                            fontSize: 16,
                          ),
                        ],
                      ),
                      hintText: 'Enter your Father’s',

                      // prefixIcon: Icon(
                      //   Icons.person_outline,
                      //   color: AppTheme.color3,
                      // ),
                    ),
                  ),
                  TextField(
                    controller: updateProfileCreateC.motherNameController.value,
                    onChanged: updateProfileCreateC.motherName,
                    decoration: InputDecoration(
                      // errorText:
                      //     ValidationService().validateEmail(authC.email.value),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          KText(
                            text: 'Mother’s Name',
                            color: AppTheme.textColor,
                            fontSize: 16,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                        ],
                      ),
                      hintText: 'Enter your Mother’s',

                      // prefixIcon: Icon(
                      //   Icons.person_outline,
                      //   color: AppTheme.color3,
                      // ),
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
                            text: 'Date of Birth',
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
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: KText(
                            text: updateProfileCreateC.selectBirthdate.value.isEmpty
                                ? updateProfileCreateC.selecteddob.value
                                : updateProfileCreateC.selectBirthdate.value,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () => updateProfileCreateC.selectDate(DateType.birthdate),
                          child: Icon(
                            EvaIcons.calendarOutline,
                            color: AppTheme.primaryColor.withOpacity(.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                        child: Divider(
                      color: hexToColor('#CFDEE3'),
                      thickness: 1,
                    )),
                    SizedBox(
                      width: 5,
                    ),
                    KText(
                      text: "Occupational Info ",
                      fontSize: 16,
                      color: AppTheme.appBarTextColor,
                    ),
                    // Text("Responding Party"),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Divider(
                      color: hexToColor('#CFDEE3'),
                      thickness: 1,
                    )),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KText(
                            text: 'Are You Employed? ',
                            fontSize: 16,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            GestureDetector(
                              onTap: () {
                                updateProfileCreateC.employeeccupation.value = Employee.Yes;
                              },
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 15.0,
                                    height: 15.0,
                                    child: Radio(
                                      value: Employee.Yes,
                                      groupValue: updateProfileCreateC.employeeccupation.value,
                                      // activeColor: Colors.green,
                                      onChanged: updateProfileCreateC.employeeccupation,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0, right: 15.0),
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontSize: 14.0,
                                          color: AppTheme.appBarTextColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                updateProfileCreateC.employeeccupation.value = Employee.No;
                              },
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 15.0,
                                    height: 15.0,
                                    child: Radio(
                                      value: Employee.No,
                                      groupValue: updateProfileCreateC.employeeccupation.value,
                                      // activeColor: Colors.green,
                                      onChanged: updateProfileCreateC.employeeccupation,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0, right: 15.0),
                                    child: Text(
                                      'No',
                                      style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontSize: 14.0,
                                          color: AppTheme.appBarTextColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.2,
                    color: hexToColor('#A3CCDC'),
                  ),
                  TextField(
                    controller: updateProfileCreateC.organizationNameController.value,
                    onChanged: updateProfileCreateC.organizationName,
                    decoration: InputDecoration(
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          KText(
                            text: 'Organization Name',
                            color: AppTheme.textColor,
                            fontSize: 16,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          KText(
                            text: '*',
                            color: Colors.redAccent,
                          ),
                        ],
                      ),
                      hintText: 'Enter your Organization Name',

                      // prefixIcon: Icon(
                      //   Icons.person_outline,
                      //   color: AppTheme.color3,
                      // ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KText(
                            text: 'Occupation ',
                            fontSize: 16,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            GestureDetector(
                              onTap: () {
                                updateProfileCreateC.projectenforcement.value = OccupationProject.Jobholder;
                              },
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 15.0,
                                    height: 15.0,
                                    child: Radio(
                                      value: OccupationProject.Jobholder,
                                      groupValue: updateProfileCreateC.projectenforcement.value,
                                      // activeColor: Colors.green,
                                      onChanged: updateProfileCreateC.projectenforcement,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0, right: 15.0),
                                    child: Text(
                                      'Jobholder',
                                      style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontSize: 14.0,
                                          color: AppTheme.appBarTextColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                updateProfileCreateC.projectenforcement.value = OccupationProject.Business;
                              },
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 15.0,
                                    height: 15.0,
                                    child: Radio(
                                      value: OccupationProject.Business,
                                      groupValue: updateProfileCreateC.projectenforcement.value,
                                      // activeColor: Colors.green,
                                      onChanged: updateProfileCreateC.projectenforcement,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0, right: 15.0),
                                    child: Text(
                                      'Business',
                                      style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontSize: 14.0,
                                          color: AppTheme.appBarTextColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: 1.2,
                            color: hexToColor('#A3CCDC'),
                          ),
                          TextField(
                            controller: updateProfileCreateC.designationNameController.value,
                            onChanged: updateProfileCreateC.designationName,
                            decoration: InputDecoration(
                              label: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  KText(
                                    text: 'Your Designation',
                                    color: AppTheme.textColor,
                                    fontSize: 16,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  KText(
                                    text: '',
                                    color: Colors.redAccent,
                                  ),
                                ],
                              ),
                              hintText: 'Enter your Your Designation Name',

                              // prefixIcon: Icon(
                              //   Icons.person_outline,
                              //   color: AppTheme.color3,
                              // ),
                            ),
                          ),
                          // TextField(
                          //   controller: updateProfileCreateC
                          //       .designationNameController.value,
                          //   onChanged: updateProfileCreateC.designationName,
                          //   decoration: InputDecoration(
                          //     label: Row(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       crossAxisAlignment: CrossAxisAlignment.center,
                          //       children: [
                          //         KText(
                          //           text: 'Your Designation',
                          //           color: AppTheme.textColor,
                          //           fontSize: 16,
                          //         ),
                          //         SizedBox(
                          //           width: 2,
                          //         ),
                          //       ],
                          //     ),
                          //     hintText: 'Enter your Your Designation Name',

                          //     // prefixIcon: Icon(
                          //     //   Icons.person_outline,
                          //     //   color: AppTheme.color3,
                          //     // ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: updateProfileCreateC.officeAddresssNameController.value,
                            onChanged: updateProfileCreateC.officeAddresss,
                            decoration: InputDecoration(
                              // errorText: ValidationService().validateEmail(
                              //     updateProfileCreateC.officeAddresss.value),
                              label: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  KText(
                                    text: 'Office Address',
                                    color: AppTheme.textColor,
                                    fontSize: 16,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  KText(
                                    text: '',
                                    color: Colors.redAccent,
                                  ),
                                ],
                              ),
                              hintText: 'Enter your Your Office Address',

                              // prefixIcon: Icon(
                              //   Icons.person_outline,
                              //   color: AppTheme.color3,
                              // ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Center(
                          //   child: ElevatedButton(
                          //     onPressed: () async {
                          //       showDialog(
                          //         context: context,
                          //         builder: (context) => AlertDialog(
                          //           content: CircularProgressIndicator(),
                          //         ),
                          //       );

                          //       await updateProfileCreateC.updateProfile();
                          //     },
                          //     child: KText(
                          //       text: 'Update',
                          //       fontSize: 16,
                          //       bold: true,
                          //       color: Colors.white,
                          //     ),
                          //     style: ElevatedButton.styleFrom(
                          //         backgroundColor: hexToColor('#78909C'),
                          //         fixedSize: Size(Get.width, 50),
                          //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
      // ),/
    );
  }
}
