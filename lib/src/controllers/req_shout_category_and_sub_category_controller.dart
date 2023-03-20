import 'package:the_citizen_app/src/config/api_endpoint.dart';

import 'package:the_citizen_app/src/controllers/user_controller.dart';
import 'package:the_citizen_app/src/helpers/custom_dialog_helper.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
import 'package:the_citizen_app/src/helpers/route.dart';

import 'package:the_citizen_app/src/models/req_shout_category_subcategory.dart';
import 'package:the_citizen_app/src/services/api_service.dart';
import 'package:get/get.dart';

class RequestNewShoutCatAndSubCategoryController extends GetxController with ApiService {
  final description = RxString('');
  final subCategoryName = RxString('');
  final isLoading = RxBool(false);
  final isSubmit = RxBool(false);
  final myCategoryList = RxList<RequesShoutCategorySubCategory?>([]);
  final mySubCategoryList = RxList<RequesShoutCategorySubCategory?>([]);

  myCatAndSubCatRequestGet(String type) async {
    isLoading.value = true;
    //  final selectedAgency = Get.put(AgencyController()).selectedAgency;
    final username = Get.put(UserController()).username;
    final params = {
      'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5',
      'appCode': 'SHOUT',
      // 'agencyIds': [selectedAgency!.agencyId],
      'username': username,
      'suggType': type,
      'status': 'all'
    };
    kLog('params');
    kLog(params);
    final res = await getDynamic(path: ApiEndpoint.getShoutCategorySubCategoryRequestUrl(), queryParameters: params);
    final myReqData = res.data['data']
        .map((json) => RequesShoutCategorySubCategory.fromJson(json as Map<String, dynamic>))
        .toList()
        .cast<RequesShoutCategorySubCategory>() as List<RequesShoutCategorySubCategory>;
    kLog(res.data);
    if (type == 'shoutCategory') {
      myCategoryList.clear();
      myCategoryList.addAll(myReqData);
      isLoading.value = false;
    }
    if (type == 'shoutType') {
      mySubCategoryList.clear();
      mySubCategoryList.addAll(myReqData);
      isLoading.value = false;
    }
  }


//   addNewShout(String type) async {
//     isSubmit.value = true;
//     final selectedAgency = Get.put(AgencyController()).selectedAgency;
//     final username = Get.put(UserController()).username;
//     final body = {
//     "shoutCategoryId": "c811a9e1-290b-4005-9e6b-e263d01c89f9",
//     "shoutCategoryName": "Sales Lead Generation",
//     "shoutTypeName": "Test Shout Type 4",
//     "description": "Test Shout Type 4 description",
//     "masterViewModel": {
//         "apiKey": "ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5",
//         "username": username,
//         "appCode": "SHOUT"
//     }
// };
//     kLog('body');
//     kLog(body);
//     final res = await postDynamic(path: ApiEndpoint.addShoutCategoryUrl(), body: body);
//     kLog(res.data);
//     if (res.data['status'] != null && res.data['status'].contains('successful') == true) {
//       isSubmit.value = false;
//       CustomDialogHelper.successDialog(
//         title: 'Success!',
//         msg: res.data['message'].toString(),
//         color: hexToColor('#00B485'),
//         path: 'success-circular',
//         onPressed: () {
//           categoryName.value = '';
//           description.value = '';
//           kLog(categoryName);
//           back();
//           // disposeData();
//         },
//       );
//     } else {
//       isSubmit.value = false;
//       CustomDialogHelper.successDialog(
//         title: 'Unsuccessful!',
//         msg: res.data['message'][0].toString(),
//         color: hexToColor('#FF3C3C'),
//         path: 'cancel_circle',
//         onPressed: () {
//           back();
//         },
//       );
//     }
//   }

}
