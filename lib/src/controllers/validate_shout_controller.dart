import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/api_endpoint.dart';
import 'package:the_citizen_app/src/controllers/agency_controller.dart';
import 'package:the_citizen_app/src/controllers/user_controller.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
import 'package:the_citizen_app/src/models/location_dropdown.dart';
import 'package:the_citizen_app/src/models/process_shout.dart';
import 'package:the_citizen_app/src/models/unit.dart';
import 'package:the_citizen_app/src/services/api_service.dart';

class ValidateShoutController extends GetxController with ApiService {
  final validateShoutList = RxList<ProcessShout>([]);

  final selectedUnit = Rx<Unit?>(null);
  final selectedLocation = Rx<LocationDropdown?>(null);
  final unitList = RxList<Unit>([]);
  final locationList = RxList<LocationDropdown>([]);

  final isLoadding = RxBool(false);
  final isLoading = RxBool(false);

  getValidateShout() async {
    final username = Get.put(UserController()).username;
    final selectedAgency = Get.put(AgencyController()).selectedAgency;
    final body = {
      'uiCodes': [122009],
      'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
      'shoutTypes': ['VALIDATE'],
      'appCode': 'SHOUT',
      'agencyIds': [selectedAgency!.agencyId],
      'username': username,
      'unitIds': [selectedUnit.value!.id],
      'locationIds': [selectedLocation.value!.id],
    };

    kLog(body);
    final res = await postDynamic(path: ApiEndpoint.getShoutIncidentByAgencyAndUnitAndLocationUrl(), body: body);
    kLog(res.data);
    final shoutData = res.data['data'].map((json) => ProcessShout.fromJson(json as Map<String, dynamic>)).toList().cast<ProcessShout>()
        as List<ProcessShout>;

    validateShoutList.clear();
    validateShoutList.addAll(shoutData);
    //kLog(validateShoutList.length);
  }

  getUnitData() async {
    isLoadding.value = true;
    final username = Get.put(UserController()).username;
    final selectedAgency = Get.put(AgencyController()).selectedAgency;
    final body = {
      "agencyIds": [selectedAgency!.agencyId],
      "username": username,
      "additionalUsernames": [username],
      "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
      "appCode": "SHOUT",
      "uiCodes": ["0000"]
    };

    final res = await postDynamic(path: ApiEndpoint.getUnitsByUsernameUrl(), body: body);
    final unitData = res.data['data'].map((json) => Unit.fromJson(json as Map<String, dynamic>)).toList().cast<Unit>() as List<Unit>;

    if (unitData.isNotEmpty) {
      unitList.clear();
      unitList.addAll(unitData);
      selectedUnit.value = unitList[0];
      getLocationData();
      isLoadding.value = false;
    }
    isLoadding.value = false;
  }

  getLocationData() async {
    isLoading.value = true;
    final username = Get.put(UserController()).username;
    final selectedAgency = Get.put(AgencyController()).selectedAgency;
    final body = {
      "username": username,
      "additionalUsernames": [username],
      "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
      "agencyIds": [selectedAgency!.agencyId],
      "unitIds": [selectedUnit.value!.id],
      "appCode": "SHOUT"
    };

    final res = await postDynamic(path: ApiEndpoint.getLocationByUsernameUrl(), body: body, authentication: true);

    final LocationData = res.data['data']
        .map((json) => LocationDropdown.fromJson(json as Map<String, dynamic>))
        .toList()
        .cast<LocationDropdown>() as List<LocationDropdown>;

    if (LocationData.isNotEmpty) {
      isLoading.value = false;
      locationList.clear();
      locationList.addAll(LocationData);
      selectedLocation.value = locationList[0];
    }
    isLoading.value = false;
  }
}
