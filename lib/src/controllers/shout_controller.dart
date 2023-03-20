import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:the_citizen_app/src/controllers/agency_controller.dart';
import 'package:the_citizen_app/src/controllers/user_controller.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';

import '../helpers/dialogHelper.dart';
import '../helpers/get_file_name.dart';
import '../helpers/hex_color.dart';
import '../helpers/route.dart';
import '../helpers/uniqe_id.dart';
import '../models/search_known_location_model.dart';
import '../models/shout_attention_dropdown_model.dart';
import '../models/shout_categories.dart';
import '../models/shout_sub_categories.dart';
import '../services/api_service.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
// import 'package:collection/collection.dart' show IterableExtension;

class ShoutController extends GetxController with ApiService {
  final image = Rx<Uint8List?>(null);

  final userC = Get.put(UserController());

  // Shout Categorie and SubCategorie
  final shoutCategories = RxList<ShoutCategories>([]);
  final shoutSubCategories = RxList<ShoutSubCategories>([]);

  // Shout Attention Dropdown
  final shoutAttentionDropdown = RxList<ShoutAttentionDropdownModel>([]);
  final selectedAttentionDropdown = Rx<ShoutAttentionDropdownModel?>(null);

  // Shout Search Known Location
  final searchKnownLocation = RxList<SearchKnownLocationModel>([]);
  final selectedLocation = Rx<SearchKnownLocationModel?>(null);

  final isLoading = RxBool(false);

// Report Issue
//---------------------------------------
  final imagefiles = RxList<File>([]);

  final knownLocation = RxBool(false);
  final keepMeAnonymous = RxBool(false);
  final wasAnonymous = RxBool(false);
  final urgencyLevel = RxString('Immediate');
  final latitude = RxString('');
  final longitude = RxString('');
  final remarks = RxString('');

  final searchText = RxString('');
  final selectedCategory = Rx<ShoutCategories?>(null);
//---------------------------------------

  Future<void> getShoutCategory() async {
    try {
      await 2.delay();
      isLoading.value = true;
      final username = Get.put(UserController()).username;
      final body = {
        "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
        "uiCodes": ["0000"],
        "appCode": "SHOUT",
        "username": username,
        // "username": "habib2200",
        "imageNeeded": true
      };
      kLog(body);
      final res = await postDynamic(
        path: '${dotenv.env['BASE_URL_SHOUT']}/get_shout_categories',
        body: body,
        authentication: true,
      );

      if (res.data['status'] != null && res.data['status'].contains('successful') == true) {
        isLoading.value = false;
        final shoutCategoriData =
            res.data['data'].map((json) => ShoutCategories.fromJson(json)).toList().cast<ShoutCategories>() as List<ShoutCategories>;

        if (shoutCategoriData.isNotEmpty) {
          isLoading.value = false;
          shoutCategories.clear();
          shoutCategories.addAll(shoutCategoriData);
          selectedCategory.value = shoutCategories[0];
        }
      }
      isLoading.value = false;
    } on DioError catch (e) {
      log(e.message);
    }
  }

  // Get shout sub category
  Future<void> getShoutSubCategory(String categoryCode) async {
    try {
      isLoading.value = true;
      final body = {
        "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
        "uiCodes": ["1200"],
        "appCode": "SHOUT",
        "categoryCode": categoryCode,
        "imageNeeded": true
      };

      // {
      //   "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
      //   "uiCodes": ["0000"],
      //   "appCode": "SHOUT",
      //   "imageNeeded": true
      // };
      final res = await postDynamic(
        path: '${dotenv.env['BASE_URL_SHOUT']}/get_shout_subcategories_by_category_code',
        body: body,
        authentication: true,
      );
      kLog('res.data');
      kLog(res.data);
      if (res.data['status'] != null && res.data['status'].contains('successful') == true) {
        isLoading.value = false;
        final shoutSubCategoriData = res.data['data']
            .map((json) => ShoutSubCategories.fromJson(json))
            .toList()
            .cast<ShoutSubCategories>() as List<ShoutSubCategories>;

        if (shoutSubCategoriData.isNotEmpty) {
          shoutSubCategories.clear();
          shoutSubCategories.addAll(shoutSubCategoriData);
        }
      }
      isLoading.value = false;
    } on DioError catch (e) {
      kLog(e.message);
    }
  }

  //---------------------------
  List<ShoutSubCategories> getShoutSubCategoryById({required String code}) {
    return shoutSubCategories.where((x) => x.categoryCode == code).toList();
  }

  check() async {
    final ByteData bytes = await rootBundle.load('assets/images/abdur_rahim_min.png');
    final list = bytes.buffer.asUint8List();

    image.value = list;
  }

  //=============================================================
  // **** Shout Section Start ****
  //=============================================================

  // Shout add
  Future<void> getAgencyBySubcategoryId({
    required String subcategoryId,
  }) async {
    try {
      final username = Get.put(UserController()).username;
      final selectedAgency = Get.put(AgencyController()).selectedAgency;
      kLog(subcategoryId);
      final body = {
        "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
        "subcategoryId": subcategoryId,
        "uiCodes": ["2100"],
        "appCode": "SHOUT",
      };

      final res = await postDynamic(
        path: '${dotenv.env['BASE_URL_SHOUT']}/get_agency_by_subcategory_id',
        body: body,
        // authentication: true,
      );

      kLog(res.data);
      if (res.data['status'] != null && res.data['status'].contains('successful') == true) {
        kLog(jsonEncode(res.data));

        final shoutAttention = res.data['data']
            .map((json) => ShoutAttentionDropdownModel.fromJson(json as Map<String, dynamic>))
            .toList()
            .cast<ShoutAttentionDropdownModel>() as List<ShoutAttentionDropdownModel>;
        if (shoutAttention.isNotEmpty) {
          shoutAttentionDropdown.clear();
          shoutAttentionDropdown.addAll(shoutAttention);

          selectedAttentionDropdown.value = shoutAttentionDropdown[0];
          // maintainTestTypeCreateC
          //     .getMaintainTestType(selectedProject.value!.id!);
        }

        isLoading.value = false;
      }
    } on DioError catch (e) {
      log(e.message);
    }
  }

  // SSearch Location
  Future<void> getUserDefinedLocation() async {
    try {
      isLoading.value = true;
      final username = Get.put(UserController()).username;
      final selectedAgency = Get.put(AgencyController()).selectedAgency;

      final body = {
        "username": username,
        "agencyIds": [selectedAgency!.agencyId],
        "searchText": searchText.value,
        "uiCodes": ["122011"],
        "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
        "appCode": "SHOUT"
      };

      final res = await postDynamic(
        path: '${dotenv.env['BASE_URL_GIS']}/search_user_defined_location',
        body: body,
        // authentication: true,
      );

      if (res.data['status'] != null && res.data['status'].contains('successful') == true) {
        isLoading.value = false;
        final locationData = res.data['data']
            .map((json) => SearchKnownLocationModel.fromJson(json as Map<String, dynamic>))
            .toList()
            .cast<SearchKnownLocationModel>() as List<SearchKnownLocationModel>;
        if (locationData.isNotEmpty) {
          isLoading.value = false;
          searchKnownLocation.clear();
          searchKnownLocation.addAll(locationData);
        }
      }
      isLoading.value = false;
    } on DioError catch (e) {
      log(e.message);
    }
  }

  // Shout add
  Future<void> addShout({
    required String subcategoryId,
    required String subcategoryName,
  }) async {
    try {
      isLoading.value = true;
      final username = Get.put(UserController()).username;
      final selectedAgency = Get.put(AgencyController()).selectedAgency;

      var attachments = [];
      for (var img in imagefiles) {
        final fileName = getFileName(path: img.path);

        attachments.add(await MultipartFile.fromFile(
          img.path,
          filename: '${getUniqeId()}$fileName',
        ));

        kLog('attachment length: ${attachments.length}');
      }
      final body = FormData.fromMap({
        "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
        "appCode": "SHOUT",
        "subcategoryIds": subcategoryId,
        "subcategoryName": subcategoryName,
        "broadcastAllowed": "false",
        "agencyIds": selectedAgency!.agencyId,
        "countryCode": "BD",
        "username": username,
        "latitude": selectedLocation.value != null ? selectedLocation.value!.latitude : "0.0",
        "longitude": selectedLocation.value != null ? selectedLocation.value!.longitude : "0.0",
        "urgencyLevel": urgencyLevel.value.isEmpty ? "Immediate" : urgencyLevel.value,
        "remarks": remarks.value.isEmpty ? "" : remarks.value,
        "uiCodes": ["000000"],
        "wasAnonymous": "false",
        "files": attachments,
      });

      final res = await postDynamic(
        path: '${dotenv.env['BASE_URL_SHOUT']}/add_shout_incident_form',
        body: body,
        authentication: true,
      );

      kLog(res.data);
      if (res.data['status'] != null && res.data['status'].contains('successful') == true) {
        isLoading.value = false;
        DialogHelper.successDialog(
          title: 'Success!',
          msg: res.data['message'][0].toString(),
          color: hexToColor('#00B485'),
          path: 'success-circular',
          onPressed: () {
            back();
            back();
          },
        );
        await 6.delay();

        back();
        back();
        imagefiles.clear();
        // selectedAttentionDropdown.value = null;
        selectedLocation.value = null;
        knownLocation.value = false;
      } else {
        isLoading.value = false;
        DialogHelper.successDialog(
          title: 'Unsuccessful!',
          msg: res.data['message'][0].toString(),
          color: hexToColor('#FF3C3C'),
          path: 'cancel_circle',
          onPressed: () {
            back();
          },
        );
        await 6.delay();
        back();
      }
      isLoading.value = false;
    } on DioError catch (e) {
      log(e.message);
    }
  }

  bool knownLocationIsTrue() {
    if (knownLocation.value && selectedLocation.value != null) {
      return true;
    } else {
      return false;
    }
  }

  bool isSubmitButtonValid() {
    if (imagefiles.isNotEmpty && urgencyLevel.value.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
