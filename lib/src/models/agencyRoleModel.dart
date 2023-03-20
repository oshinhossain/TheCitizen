import 'package:json_annotation/json_annotation.dart';
part 'agencyRoleModel.g.dart';

@JsonSerializable()
class AgencyRoleModel {
  String? roleGroup;

  int? roleGroupLevel;

  int? roleLevel;

  String? roleName;

  String? appCode;

  AgencyRoleModel({
    this.roleGroup,
    this.roleGroupLevel,
    this.roleLevel,
    this.roleName,
    this.appCode,
  });

  factory AgencyRoleModel.fromJson(Map<String, dynamic> json) =>
      _$AgencyRoleModelFromJson(json);
  Map<String, dynamic> toJson() => _$AgencyRoleModelToJson(this);
}
