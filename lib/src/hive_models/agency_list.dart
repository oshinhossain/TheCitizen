import 'package:hive/hive.dart';
import 'package:the_citizen_app/src/hive_models/agency.dart';

part 'agency_list.g.dart';

@HiveType(typeId: 2)
class AgencyList {
  @HiveField(0)
  List<Agency>? agencyList;

  AgencyList({this.agencyList});
}
