import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/custom_dialog_helper.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import 'package:the_citizen_app/src/pages/Search_location.dart';
import 'package:the_citizen_app/src/pages/camerascreen/camera_screen.dart';
import 'package:toast/toast.dart';

import '../config/app_theme.dart';

class AssignTaskPage extends StatelessWidget with Base {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => AssignTaskPage());
  }

  final ScrollController controller = ScrollController();
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        appBar: new AppBar(
          backgroundColor: AppTheme.backgroundColor,
          leading: GestureDetector(
              onTap: () {
                shoutC.imagefiles.clear();
                shoutC.selectedLocation.value = null;
                back();
              },
              child: Icon(Icons.arrow_back)),
          title: Text(
            'Assign Task',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 16.0,
              color: AppTheme.textColor4,
              fontWeight: FontWeight.w400,
            ),
          ),
          iconTheme: IconThemeData(
            color: AppTheme.textColor6,
          ),
          // actions: [
          //   _SubmitButton(),
          // ],
        ),
        body: KeyboardVisibilityBuilder(
          builder: (BuildContext context, isKeyboardVisible) {
            return Obx(
              () => Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Agency :',
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontSize: 16.0,
                                      color: AppTheme.textColor4,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  flex: 0,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                    child: KText(
                                  text: agencyC.selectedAgency!.agencyName,
                                )),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Task Type',
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 16.0,
                                        color: AppTheme.textColor4,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '*',
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 16.0,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      //  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                                    ),
                                    const SizedBox(height: 5),
                                  ],
                                ),
                                InkWell(
                                  focusColor: AppTheme.textColor1,
                                  splashColor: AppTheme.textColor1,
                                  highlightColor: AppTheme.textColor1,
                                  borderRadius: BorderRadius.zero,
                                  onTap: () async {
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppTheme.textColor1, //remove color to make it transpatent
                                      border: Border.all(
                                        width: 0.0,
                                        style: BorderStyle.solid,
                                        color: AppTheme.textColor1,
                                      ),
                                    ),
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.center,
                                      enabled: false,
                                      readOnly: true,
                                      // controller: query,
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 14.0,
                                        color: AppTheme.textColor6,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(color: AppTheme.textColor1, width: 0.0),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: AppTheme.textColor1, width: 0.0),
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(5.0),
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
                                        ),
                                        hintText: 'Search Category...',
                                        suffixIcon: IconButton(
                                          padding: const EdgeInsets.all(0.0),
                                          icon: Icon(
                                            Icons.search,
                                            color: AppTheme.textColor9,
                                          ),
                                          onPressed: () async {
                                            // FocusScope.of(context).unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
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
                            SizedBox(height: 10.0),
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
                                maxLines: 2,
                                minLines: 2,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  labelText: "Description",
                                  hintText: 'Write description here',
                                  // errorText: state.taskDescription.invalid ? 'Description is empty' : null,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppTheme.textColor1, width: 0.0),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                  ),
                                  alignLabelWithHint: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppTheme.textColor1, width: 0.0),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(5.0),
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
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  activeColor: AppTheme.appBarColor,
                                  value: assignTaskC.selectPerson.value,
                                  onChanged: (value) {
                                    assignTaskC.selectPerson.value = value!;
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Select Person',
                                        style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontSize: 16.0,
                                          color: AppTheme.textColor4,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '*',
                                        style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontSize: 16.0,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        //  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                                      ),
                                      const SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                    activeColor: AppTheme.appBarColor,
                                    value: assignTaskC.askEvedence.value,
                                    onChanged: (value) {
                                      assignTaskC.askEvedence.value = value!;
                                    }),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Ask for evidence of completion',
                                        style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontSize: 16.0,
                                          color: AppTheme.textColor4,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Location',
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 16.0,
                                        color: AppTheme.textColor4,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '*',
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 16.0,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      //  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                                    ),
                                    const SizedBox(height: 5),
                                  ],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 32,
                                      child: Radio(
                                        fillColor: MaterialStateColor.resolveWith((states) => AppTheme.appBarColor),
                                        value: 'KnownLocation',
                                        groupValue: assignTaskC.location.value,
                                        onChanged: (value) {
                                          assignTaskC.location.value = value!;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      child: Text(
                                        'Known Location',
                                        style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontSize: 16.0,
                                          color: AppTheme.textColor4,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                                if (assignTaskC.location.value == 'KnownLocation')
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
                                            color: AppTheme.textColor1,
                                            //remove color to make it transpatent
                                            border:
                                                Border.all(width: 1.0, style: BorderStyle.solid, color: Colors.grey.withOpacity(.7)),
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
                                SizedBox(
                                  width: 15,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 32,
                                      child: Radio(
                                        fillColor: MaterialStateColor.resolveWith((states) => AppTheme.appBarColor),
                                        value: 'MapLocation',
                                        groupValue: assignTaskC.location.value,
                                        onChanged: (value) {
                                          assignTaskC.location.value = value!;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      child: Text(
                                        'Map Location',
                                        style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontSize: 16.0,
                                          color: AppTheme.textColor4,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7.0, bottom: 7.0, right: 7.0),
                    child: ElevatedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.textColor1,
                        backgroundColor: AppTheme.appBarColor,
                        side: BorderSide(color: AppTheme.appBarColor, width: 1),
                        elevation: 5,
                        //  minimumSize: Size(157, 35),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      icon: ImageIcon(
                        AssetImage('assets/images/submit-icon.png'),
                        color: AppTheme.textColor1,
                        size: 22,
                      ),
                      label: Text(
                        'Submit',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 20.0,
                          color: AppTheme.textColor1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        String buildMsg = 'Task type, person, location must be filled with valid data';
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(buildMsg),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
