import 'package:hive/hive.dart';
part 'selected_agency_role_model.g.dart';

@HiveType(typeId: 6)
class SelectedAgencyRoleModel {
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

  SelectedAgencyRoleModel({
    this.roleGroup,
    this.roleGroupLevel,
    this.roleLevel,
    this.roleName,
    this.appCode,
  });
}
