import 'package:the_citizen_app/src/config/api_endpoint.dart';
import 'package:the_citizen_app/src/controllers/agency_controller.dart';
import 'package:the_citizen_app/src/controllers/location_controller.dart';
import 'package:the_citizen_app/src/controllers/user_controller.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
import 'package:the_citizen_app/src/models/process_shout.dart';
import 'package:the_citizen_app/src/services/api_service.dart';
import 'package:get/get.dart';

class StartTaskController extends GetxController with ApiService {
  final startTaskList = RxList<ProcessShout>([]);

  getStartTask() async {
    final username = Get.put(UserController()).username;
    final selectedAgency = Get.put(AgencyController()).selectedAgency;
    final body = {
      'uiCodes': [122002],
      'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
      'shoutTypes': ['VERIFIED'],
      'appCode': 'SHOUT',
      'agencyIds': [selectedAgency!.agencyId],
      'username': username
    };
    kLog(body);
    final res = await postDynamic(path: ApiEndpoint.getShoutIncidentByUsernameUrl(), body: body);
    kLog(res.data);
    final startTaskData = res.data['data']
        .map((json) => ProcessShout.fromJson(json as Map<String, dynamic>))
        .toList()
        .cast<ProcessShout>() as List<ProcessShout>;

    startTaskList.clear();
    startTaskList.addAll(startTaskData);
    kLog(startTaskList.length);
  }

  startTask(String id) async {
    final username = Get.put(UserController()).username;
    final selectedAgency = Get.put(AgencyController()).selectedAgency;
    final locationC = Get.put(LocationController());
    final body = {
      'uiCodes': [122002],
      'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
      'fulfillmentStatus': ['ACCEPTED'],
      'appCode': 'SHOUT',
      'agencyIds': [selectedAgency!.agencyId],
      'ids': [id],
      'username': username,
      'latitude': locationC.currentLatLng!.latitude,
      'longitude': locationC.currentLatLng!.longitude,
    };
    kLog(body);
    final res = await postDynamic(path: ApiEndpoint.getUpdateFulfillmentStatusUrl(), body: body);
    kLog(res.data);
  }
}
