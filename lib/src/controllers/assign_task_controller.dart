import 'package:get/get.dart';
import 'package:the_citizen_app/src/services/api_service.dart';

class AssignTaskController extends GetxController with ApiService {
  final selectPerson = RxBool(false);
  final askEvedence = RxBool(false);
  final location = RxString('Known');
}
