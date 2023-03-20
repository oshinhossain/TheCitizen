import 'package:hive/hive.dart';
part 'local_agency_role_model.g.dart';

@HiveType(typeId: 5)
class LocalAgencyRoleModel {
  @HiveField(0)
  String? roleGroup;

  @HiveField(1)
  int? roleGroupLevel;

  @HiveField(2)
  int? roleLevel;

  @HiveField(3)
  String? roleName;

  @HiveField(4)
  String? appCode;

  LocalAgencyRoleModel({
    this.roleGroup,
    this.roleGroupLevel,
    this.roleLevel,
    this.roleName,
    this.appCode,
  });
}
