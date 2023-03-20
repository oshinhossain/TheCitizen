// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agencyRoleModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgencyRoleModel _$AgencyRoleModelFromJson(Map<String, dynamic> json) =>
    AgencyRoleModel(
      roleGroup: json['roleGroup'] as String?,
      roleGroupLevel: json['roleGroupLevel'] as int?,
      roleLevel: json['roleLevel'] as int?,
      roleName: json['roleName'] as String?,
      appCode: json['appCode'] as String?,
    );

Map<String, dynamic> _$AgencyRoleModelToJson(AgencyRoleModel instance) =>
    <String, dynamic>{
      'roleGroup': instance.roleGroup,
      'roleGroupLevel': instance.roleGroupLevel,
      'roleLevel': instance.roleLevel,
      'roleName': instance.roleName,
      'appCode': instance.appCode,
    };
