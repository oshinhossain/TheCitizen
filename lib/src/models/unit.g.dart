// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
      id: json['id'] as String?,
      countryId: json['countryId'] as String?,
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
      agencyId: json['agencyId'] as String?,
      agencyCode: json['agencyCode'] as String?,
      agencyName: json['agencyName'] as String?,
      unitCode: json['unitCode'] as String?,
      unitName: json['unitName'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      officeLatitude: (json['officeLatitude'] as num?)?.toDouble(),
      officeLongitude: (json['officeLongitude'] as num?)?.toDouble(),
      unitLevelCode: json['unitLevelCode'] as int?,
      unitLevelName: json['unitLevelName'] as String?,
      parentUnitId: json['parentUnitId'] as String?,
      parentUnitCode: json['parentUnitCode'] as String?,
      parentUnitName: json['parentUnitName'] as String?,
      parentUnitLevelCode: json['parentUnitLevelCode'] as int?,
      parentUnitLevelName: json['parentUnitLevelName'] as String?,
      geographyPoint: json['geographyPoint'] as String?,
      geographyPolygon: json['geographyPolygon'] as String?,
      masterViewModel: json['masterViewModel'] as String?,
    );

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
      'id': instance.id,
      'countryId': instance.countryId,
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
      'agencyId': instance.agencyId,
      'agencyCode': instance.agencyCode,
      'agencyName': instance.agencyName,
      'unitCode': instance.unitCode,
      'unitName': instance.unitName,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'officeLatitude': instance.officeLatitude,
      'officeLongitude': instance.officeLongitude,
      'unitLevelCode': instance.unitLevelCode,
      'unitLevelName': instance.unitLevelName,
      'parentUnitId': instance.parentUnitId,
      'parentUnitCode': instance.parentUnitCode,
      'parentUnitName': instance.parentUnitName,
      'parentUnitLevelCode': instance.parentUnitLevelCode,
      'parentUnitLevelName': instance.parentUnitLevelName,
      'geographyPoint': instance.geographyPoint,
      'geographyPolygon': instance.geographyPolygon,
      'masterViewModel': instance.masterViewModel,
    };
