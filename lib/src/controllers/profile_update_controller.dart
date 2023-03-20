import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:image_picker/image_picker.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';
import 'package:the_citizen_app/src/controllers/agency_controller.dart';
import 'package:the_citizen_app/src/controllers/auth_controller.dart';
import 'package:the_citizen_app/src/controllers/user_controller.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';

import '../config/api_endpoint.dart';
import '../config/app_theme.dart';
import '../enums/enums.dart';
import '../helpers/get_file_name.dart';
import '../helpers/hex_color.dart';
import '../helpers/image_compress.dart';
import '../helpers/k_text.dart';
import '../models/usermodel.dart';
import '../services/api_service.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;

enum PartyType { person, agency }

enum DateType { end, start, delivery, birthdate, issueDate, expDate }

class ProfileUpdateController extends GetxController with ApiService {
  final files = RxList<MultipartFile?>([]);
  final groupName = RxList([
    'Science',
    'Business Studies',
    'Humanities',
    'Others',
  ]);
  final selectedGroupName = RxString('Science');
  final selectedGroupNameHsc = RxString('Science');
  final taxZone = RxList([
    'Zone-1',
    'Zone-2',
    'Zone-3',
    'Zone-4',
    'Zone-5',
    'Zone-6',
    'Zone-7',
    'Zone-8',
    'Zone-9',
    'Zone-10',
  ]);
  final selectedTaxZone = RxString('Zone-1');
  final taxCircle = RxList([
    'Circle-140',
    'Circle-141',
    'Circle-142',
    'Circle-143',
    'Circle-144',
    'Circle-145',
    'Circle-146',
    'Circle-147',
    'Circle-148',
    'Circle-149',
    'Circle-150',
  ]);
  final selectedTaxCircle = RxString('Circle-140');
  final applyGeographywiseBudget = RxBool(false);

  final imagecount = RxInt(0);

  final selectBirthdate = RxString('');

  final ImagePicker imagePicker = ImagePicker();
  // final pickedImage = Rx<File?>(null);
  final scheduledEndDate = RxString('');
  final scheduledStartDate = RxString('');
  final licenseIssueDate = RxString('');
  final licenseExpiredDate = RxString('');
  final selecteddob = RxString('--/--/--');
//...........................................................
  final fileImage = Rx<File?>(null);
  final nidF = Rx<File?>(null);
  final nidB = Rx<File?>(null);
  final pass = Rx<File?>(null);
  final birthC = Rx<File?>(null);
  final taxC = Rx<File?>(null);
  final licenseC = Rx<File?>(null);
  final ssc = Rx<File?>(null);
  final hsc = Rx<File?>(null);
  final bsc = Rx<File?>(null);
  final msc = Rx<File?>(null);
  final userImage = Rx<File?>(null);
  DateTime? eTD;

  final searchUsers = RxList();

  final addUser = RxList();
  final searchAgency = RxList();
  final isLoading = RxBool(false);

  final areaLevel = RxString('');
//update profile

  final id = RxString('');

  // update user page start
  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> personNameController = TextEditingController().obs;
  Rx<TextEditingController> mobileNameController = TextEditingController().obs;
  Rx<TextEditingController> emailAddressController = TextEditingController().obs;
  Rx<TextEditingController> addressNameController = TextEditingController().obs;
  Rx<TextEditingController> genderNameController = TextEditingController().obs;
  Rx<TextEditingController> fatherNameController = TextEditingController().obs;
  Rx<TextEditingController> motherNameController = TextEditingController().obs;
  Rx<TextEditingController> organizationNameController = TextEditingController().obs;
  Rx<TextEditingController> occupationNameController = TextEditingController().obs;
  Rx<TextEditingController> designationNameController = TextEditingController().obs;
  Rx<TextEditingController> birthNoController = TextEditingController().obs;
  Rx<TextEditingController> nidNoController = TextEditingController().obs;
  Rx<TextEditingController> passNoController = TextEditingController().obs;
  Rx<TextEditingController> tinNoController = TextEditingController().obs;
  Rx<TextEditingController> officeAddresssNameController = TextEditingController().obs;

  Rx<TextEditingController> sscPassingYearController = TextEditingController().obs;
  Rx<TextEditingController> sscInstituteController = TextEditingController().obs;
  Rx<TextEditingController> sscCertificateController = TextEditingController().obs;
  Rx<TextEditingController> hscPassingYearController = TextEditingController().obs;
  Rx<TextEditingController> hscInstituteController = TextEditingController().obs;
  Rx<TextEditingController> hscCertificateController = TextEditingController().obs;
  Rx<TextEditingController> bscPassingYearController = TextEditingController().obs;
  Rx<TextEditingController> bscInstituteController = TextEditingController().obs;
  Rx<TextEditingController> bscSubController = TextEditingController().obs;
  Rx<TextEditingController> bscCertificateController = TextEditingController().obs;
  Rx<TextEditingController> mscPassingYearController = TextEditingController().obs;
  Rx<TextEditingController> mscInstituteController = TextEditingController().obs;
  Rx<TextEditingController> mscSubController = TextEditingController().obs;
  Rx<TextEditingController> mscCertificateController = TextEditingController().obs;
  Rx<TextEditingController> licenseTypeController = TextEditingController().obs;
  Rx<TextEditingController> licenseAllowedVehicleController = TextEditingController().obs;
  Rx<TextEditingController> licenseNoController = TextEditingController().obs;
  Rx<TextEditingController> licenseAuthorityController = TextEditingController().obs;

  final fullName = RxString('');
  final personName = RxString('');
  final mobileNumber = RxString('');
  final emailAddress = RxString('');
  final address = RxString('');
  final genderName = RxString('');
  final fatherName = RxString('');
  final motherName = RxString('');
  final organizationName = RxString('');
  final occupationName = RxString('');
  final designationName = RxString('');
  final birthDate = RxString('');
  final nidNo = RxString('');
  final passNo = RxString('');
  final birthCNo = RxString('');
  final taxId = RxString('');
  final sscPassingYear = RxString('0');
  final hscPassingYear = RxString('0');
  final bscPassingYear = RxString('0');
  final mscPassingYear = RxString('0');
  final uVNameSSC = RxString('');
  final uVNameHSC = RxString('');
  final uVNameBSC = RxString('');
  final uVNameMSC = RxString('');
  final subNameMSC = RxString('');
  final subNameBSC = RxString('');
  final certificateNoSSC = RxString('');
  final certificateNoHSC = RxString('');
  final certificateNoBSC = RxString('');
  final certificateNoMSC = RxString('');
  final officeAddresss = RxString('');
  final licenseType = RxString('');
  final licenseAllowedVehicle = RxString('');
  final licenseNo = RxString('');
  final licenseAuthority = RxString('');
  // final passportIssueDate = RxString('');
  // final passportExpiredDate = RxString('');
  final officeAddresssName = RxString('');
  final nidFImg = Rx<Uint8List?>(null);
  final nidBImg = Rx<Uint8List?>(null);
  final passImg = Rx<Uint8List?>(null);
  final birthImg = Rx<Uint8List?>(null);
  final taxImg = Rx<Uint8List?>(null);
  final drilicImg = Rx<Uint8List?>(null);
  final sscImg = Rx<Uint8List?>(null);
  final hscImg = Rx<Uint8List?>(null);
  final bscImg = Rx<Uint8List?>(null);
  final mscImg = Rx<Uint8List?>(null);
// update user page end
  //project dashboard drop down

  final projectenforcement = Rx<OccupationProject>(OccupationProject.Jobholder);
  final employeeccupation = Rx<Employee>(Employee.Yes);
  TextEditingController a = TextEditingController();

  Future<DateTime?> selectDate(DateType type) async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: type == DateType.expDate
            ? DateTime.parse(licenseIssueDate.value)
            : type == DateType.end
                ? DateTime.parse(scheduledStartDate.value)
                : DateTime(1900),
        //DateTime.now() - not to allow to choose before today.
        lastDate: type == DateType.birthdate ? DateTime.now() : DateTime(3000));

    if (pickedDate != null) {
      kLog(pickedDate);
      final date = DateFormat('yyyy-MM-dd').format(pickedDate).toString();
      kLog(date);
      switch (type) {
        case DateType.end:
          scheduledEndDate.value = date;
          break;
        case DateType.start:
          scheduledStartDate.value = date;
          break;
        case DateType.issueDate:
          licenseIssueDate.value = date;
          break;
        case DateType.expDate:
          licenseExpiredDate.value = date;
          break;

        case DateType.birthdate:
          // TODO: Handle this case.
          selectBirthdate.value = date;
          kLog(selectBirthdate.value);
          break;
        case DateType.delivery:
          // TODO: Handle this case.
          break;
      }
    }
    return null;
  }

//image pic
  Future<void> pickMultiImage(String? type, ImageSource? source) async {
    //  pickedImage.value = null;

    final image = await imagePicker.pickImage(
      source: source!,
    );

    if (image!.path.isNotEmpty) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: '',
              toolbarColor: AppTheme.appFooterColor,
              toolbarWidgetColor: hexToColor("#ffffff"),
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: '',
          ),
        ],
      );
      if (croppedFile != null) {
        fileImage.value = await compressFile(
          file: File(croppedFile.path),
        );
      }
      if (type == 'userImage') {
        userImage.value = fileImage.value;
        files.add(await MultipartFile.fromFile(fileImage.value!.path, filename: 'photo${getFileName(path: fileImage.value!.path)}'));
      }

      if (type == 'nidF') {
        nidF.value = fileImage.value;
        files
            .add(await MultipartFile.fromFile(fileImage.value!.path, filename: 'nidfront${getFileName(path: fileImage.value!.path)}'));
      }
      if (type == 'nidB') {
        nidB.value = fileImage.value;
        files.add(await MultipartFile.fromFile(fileImage.value!.path, filename: 'nidback${getFileName(path: fileImage.value!.path)}'));
      }
      if (type == 'pass') {
        pass.value = fileImage.value;
        files
            .add(await MultipartFile.fromFile(fileImage.value!.path, filename: 'passport${getFileName(path: fileImage.value!.path)}'));
      }
      if (type == 'birth') {
        birthC.value = fileImage.value;
        files.add(await MultipartFile.fromFile(fileImage.value!.path, filename: 'birth${getFileName(path: fileImage.value!.path)}'));
      }
      if (type == 'tax') {
        taxC.value = fileImage.value;
        files.add(await MultipartFile.fromFile(fileImage.value!.path, filename: 'tin${getFileName(path: fileImage.value!.path)}'));
      }
      if (type == 'dlc') {
        licenseC.value = fileImage.value;
        files.add(await MultipartFile.fromFile(fileImage.value!.path, filename: 'drilic${getFileName(path: fileImage.value!.path)}'));
      }
      if (type == 'ssc') {
        ssc.value = fileImage.value;
        files.add(await MultipartFile.fromFile(fileImage.value!.path, filename: 'ssc${getFileName(path: fileImage.value!.path)}'));
      }
      if (type == 'hsc') {
        hsc.value = fileImage.value;
        files.add(await MultipartFile.fromFile(fileImage.value!.path, filename: 'hsc${getFileName(path: fileImage.value!.path)}'));
      }
      if (type == 'bsc') {
        bsc.value = fileImage.value;
        files
            .add(await MultipartFile.fromFile(fileImage.value!.path, filename: 'bachelor${getFileName(path: fileImage.value!.path)}'));
      }
      if (type == 'msc') {
        msc.value = fileImage.value;
        files.add(await MultipartFile.fromFile(fileImage.value!.path, filename: 'masters${getFileName(path: fileImage.value!.path)}'));
      }
    }

    // pickedImage.value = File(croppedFile!.path);
    // File image
    //  fileImage.value = File(croppedFile!.path);
  }

  getUserProfile() async {
    try {
      final selectedAgency = Get.put(AgencyController()).selectedAgency;
      final username = Get.put(UserController()).username;
      final authC = Get.put(AuthController());
      isLoading.value = true;

      final body = {
        'apiKey': ApiEndpoint.KYC_API_KEY,
        "agencyIds": [selectedAgency!.agencyId],
        "username": username,
        'appCode': ApiEndpoint.WFC_APP_CODE,
        "uiCodes": ["0000"],
        "additionalUsernames": [username],
        "ignoreAgency": true
      };

      final res = await postDynamic(
        path: '${dotenv.env['BASE_URL_KYC']}/user_by_username',

        //  path: 'http://123.200.22.150:9001/user_by_username',
        // authentication: true,
        body: body,
      );

      if (res.data['status'] != null && res.data['status'].contains('successful') == true) {
        // final userData = ProfileUserModel.fromJson(res.data['data']);
        final userData = ProfileUserModel.fromJson(res.data['data'] as Map<String, dynamic>);
        kLog('hjhgghg');

        authC.userDetail.value = userData;

        fullName.value = authC.userDetail.value!.username ?? "";
        mobileNumber.value = authC.userDetail.value!.mobile ?? "";
        emailAddress.value = authC.userDetail.value!.email ?? "";
        address.value = authC.userDetail.value!.homeAddress ?? "";
        fatherName.value = authC.userDetail.value!.fatherName ?? "";
        motherName.value = authC.userDetail.value!.motherName ?? "";
        organizationName.value = authC.userDetail.value!.organizationName ?? "";
        designationName.value = authC.userDetail.value!.desig ?? "";
        officeAddresssName.value = authC.userDetail.value!.officeAddress ?? "";

        fullNameController.value.text = authC.userDetail.value!.username ?? "";
        emailAddressController.value.text = authC.userDetail.value!.email ?? "";
        addressNameController.value.text = authC.userDetail.value!.homeAddress ?? "";
        fatherNameController.value.text = authC.userDetail.value!.fatherName ?? "";
        motherNameController.value.text = authC.userDetail.value!.motherName ?? "";
        mobileNameController.value.text = authC.userDetail.value!.mobile ?? "";
        organizationNameController.value.text = authC.userDetail.value!.organizationName ?? "";
        designationNameController.value.text = authC.userDetail.value!.desig ?? "";
        officeAddresssNameController.value.text = authC.userDetail.value!.officeAddress ?? "";
        birthNoController.value.text = authC.userDetail.value!.birthCertNo ?? "";
        nidNoController.value.text = authC.userDetail.value!.nidNo ?? "";
        passNoController.value.text = authC.userDetail.value!.passportNo ?? "";
        tinNoController.value.text = authC.userDetail.value!.taxNo ?? "";

        sscPassingYearController.value.text = authC.userDetail.value!.sscPassYear.toString();
        sscInstituteController.value.text = authC.userDetail.value!.schoolName ?? "";
        sscCertificateController.value.text = authC.userDetail.value!.sscCertificateSerialNo ?? "";
        hscPassingYearController.value.text = authC.userDetail.value!.hscYear.toString();
        hscInstituteController.value.text = authC.userDetail.value!.collegeName ?? "";
        hscCertificateController.value.text = authC.userDetail.value!.hscCertificateSerialNo ?? "";
        bscPassingYearController.value.text = authC.userDetail.value!.bachelorPassYear.toString();
        bscInstituteController.value.text = authC.userDetail.value!.bachelorUniversityName ?? "";
        bscSubController.value.text = authC.userDetail.value!.bachelorSubjectName ?? "";
        bscCertificateController.value.text = authC.userDetail.value!.bachelorCertificateSerialNo ?? "";
        mscPassingYearController.value.text = authC.userDetail.value!.mastersPassYear.toString();
        mscInstituteController.value.text = authC.userDetail.value!.mastersUniversityName ?? "";
        mscSubController.value.text = authC.userDetail.value!.mastersSubjectName ?? "";
        mscCertificateController.value.text = authC.userDetail.value!.mastersCertificateSerialNo ?? "";
        licenseNoController.value.text = authC.userDetail.value!.licenseNo ?? "";
        licenseAllowedVehicleController.value.text = authC.userDetail.value!.licenseAllowedVehicle ?? "";
        licenseAuthorityController.value.text = authC.userDetail.value!.licenseAuthority ?? "";
        licenseTypeController.value.text = authC.userDetail.value!.levelType ?? "";
        selectedGroupName.value = authC.userDetail.value!.sscGroup ?? selectedGroupName.value;
        selectedGroupNameHsc.value = authC.userDetail.value!.hscGroup ?? selectedGroupNameHsc.value;
        selectedTaxCircle.value = authC.userDetail.value!.taxCircle ?? selectedTaxCircle.value;
        selectedTaxZone.value = authC.userDetail.value!.taxZone ?? selectedTaxZone.value;
        scheduledStartDate.value = authC.userDetail.value!.passportIssueDate!.toString();
        scheduledEndDate.value = authC.userDetail.value!.passportExpiredDate!.toString();
        licenseIssueDate.value = authC.userDetail.value!.licenseIssueDate!.toString();
        licenseExpiredDate.value = authC.userDetail.value!.licenseExpiredDate!.toString();
        selecteddob.value = authC.userDetail.value!.birthDate!.toString().split(' ')[0];
        kLog(res.data['data']);
      }
    } catch (e) {
      print(e);
    }
  }

  updateProfile() async {
    try {
      final username = Get.put(UserController());
      isLoading.value = true;
      final body = FormData.fromMap({
        'apiKey': ApiEndpoint.KYC_API_KEY,
        'appCode': ApiEndpoint.WFC_APP_CODE,
        'username': username.currentUser.value == null ? '' : username.currentUser.value!.username,
        'id': username.currentUser.value == null ? '' : username.currentUser.value!.id,
        'fullName': fullName.value,
        'personName': personName.value,
        'mobile': mobileNumber.value,
        'homeAddress': address.value,
        'countryId': '',
        'countryCode': 'BD',
        'countryName': 'Bangladesh',
        'geoLevel4Id': '',
        'geoLevel4Code': '',
        'geoLevel4Name': '',
        'gender': genderName.value,
        'fatherName': fatherName.value,
        'motherName': motherName.value,
        'employed': 'No',
        'organizationName': occupationName.value,
        'occupation': occupationName.value,
        'birthDate': selectBirthdate.value != '' ? selectBirthdate.value : selecteddob.value,
        'officeAddress': officeAddresss.value,
        'nidNo': nidNo.value,
        'passportNo': passNo.value,
        'passportIssueDate': DateFormat('yyyy-MM-dd').format(DateTime.parse(scheduledStartDate.value)),
        'passportExpiredDate': DateFormat('yyyy-MM-dd').format(DateTime.parse(scheduledEndDate.value)),
        'passportIssuePlace': '',
        'birthCertNo': birthCNo.value,
        'taxNo': taxId.value,
        'taxZone': selectedTaxZone.value,
        'taxCircle': selectedTaxCircle.value,
        'mastersPassYear': int.parse(mscPassingYear.value),
        'mastersUniversityName': uVNameMSC.value,
        'mastersSubjectName': subNameMSC.value,
        'mastersCertificateSerialNo': certificateNoMSC.value,
        'bachelorPassYear': int.parse(bscPassingYear.value),
        'bachelorUniversityName': uVNameBSC.value,
        'bachelorSubjectName': subNameBSC.value,
        'bachelorCertificateSerialNo': certificateNoBSC.value,
        'sscPassYear': int.parse(sscPassingYear.value),
        'schoolName': uVNameSSC.value,
        'sscGroup': selectedGroupName.value,
        'sscCertificateSerialNo': certificateNoSSC.value,
        'hscYear': int.parse(hscPassingYear.value),
        'collegeName': uVNameHSC.value,
        'hscGroup': selectedGroupNameHsc.value,
        'hscCertificateSerialNo': certificateNoHSC.value,
        'email': emailAddress.value,
        'licenseIssueDate': DateFormat('yyyy-MM-dd').format(DateTime.parse(licenseIssueDate.value)),
        'licenseExpiredDate': DateFormat('yyyy-MM-dd').format(DateTime.parse(licenseExpiredDate.value)),
        'licenseType': licenseType.value,
        'licenseAllowedVehicle': licenseAllowedVehicle.value,
        'licenseNo': licenseNo.value,
        'licenseAuthority': licenseAuthority.value,
        'files': files
      });

      //kLog('photo${getFileName(path: pickedImage.value!.path)}');
      kLog(files.length);
      //  kLog(jsonDecode(body));

      final res = await postDynamic(
        path: '${dotenv.env['BASE_URL_KYC']}/update_user_form',

        //  path: 'http://123.200.22.150:9001/user_by_username',
        authentication: true,
        body: body,
      );

      kLog(res.data);

      if (res.data['status'] != null && res.data['status'].contains('successful') == true) {
        isLoading.value = false;
        Get.back();
        Get.defaultDialog(
            barrierDismissible: false,
            onWillPop: () {
              return Future.value(false);
            },
            backgroundColor: Colors.white,
            title: '',
            content: Container(
              alignment: Alignment.center,
              height: 200,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.done,
                    color: Colors.green.withOpacity(.8),
                    size: 60,
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Center(
                    child: KText(
                      text: 'update successfully',
                      maxLines: 3,
                      fontSize: 14,
                      bold: false,
                      color: AppTheme.textColor,
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  SizedBox(
                    width: Get.width / 2,
                    child: TextButton(
                      onPressed: () {
                        // HomePage();
                        fileImage.value = null;
                        userImage.value = null;
                        nidF.value = null;
                        nidB.value = null;
                        pass.value = null;
                        birthC.value = null;
                        taxC.value = null;
                        licenseC.value = null;
                        ssc.value = null;
                        hsc.value = null;
                        bsc.value = null;
                        msc.value = null;
                        Get.back();
                      },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppTheme.primaryColor)),
                      child: KText(
                        text: 'OK',
                        bold: true,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ));
        await getUserProfile();
        //  offAll(ProjectDashboardv1());
      }
    } on DioError catch (e) {
      Get.back();

      print(e.message);
    }
  }

  updateProfileImageGet(String fileCategory) async {
    final username = Get.put(UserController()).username;
    final token = Get.put(UserController().getToken());

    final body = {
      'apiKey': ApiEndpoint.KYC_API_KEY,
      'username': username,

      'appCode': 'KYC',
      'fileCategory': fileCategory,
      //  'fileCategory': 'FILE_CATEGORY_PHOTO',
      'countryCode': 'BD'
    };
    kLog(jsonEncode(body));

    final res = await Dio().post(ApiEndpoint.getUserAttachmentByFileCategoryUrl(),
        options: Options(
          followRedirects: false,
          responseType: ResponseType.bytes,
          validateStatus: (status) => true,
          headers: {
            'Content-Type': 'application/json',
            'latLng': '${locationC.latLng.value.latitude},${locationC.latLng.value.longitude}',
            'Authorization': 'Bearer ${token}'
          },
        ),
        data: body);
    kLog(res.statusCode);
    if (res.statusCode == 200) {
      if (fileCategory == 'nidfront') nidFImg.value = res.data;
      if (fileCategory == 'nidback') nidBImg.value = res.data;
      if (fileCategory == 'passport') passImg.value = res.data;
      if (fileCategory == 'birth') birthImg.value = res.data;
      if (fileCategory == 'tin') taxImg.value = res.data;
      if (fileCategory == 'drilic') drilicImg.value = res.data;
      if (fileCategory == 'ssc') sscImg.value = res.data;
      if (fileCategory == 'hsc') hscImg.value = res.data;
      if (fileCategory == 'bachelor') bscImg.value = res.data;
      if (fileCategory == 'masters') mscImg.value = res.data;
    }

    kLog(res.data);
  }
}
