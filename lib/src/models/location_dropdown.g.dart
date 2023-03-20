// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dropdown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDropdown _$LocationDropdownFromJson(Map<String, dynamic> json) =>
    LocationDropdown(
      id: json['id'] as String?,
      countryId: json['countryId'] as String?,
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
      agencyId: json['agencyId'] as String?,
      agencyCode: json['agencyCode'] as String?,
      agencyName: json['agencyName'] as String?,
      unitId: json['unitId'] as String?,
      unitCode: json['unitCode'] as String?,
      unitName: json['unitName'] as String?,
      locationCode: json['locationCode'] as String?,
      locationName: json['locationName'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      officeLatitude: (json['officeLatitude'] as num?)?.toDouble(),
      officeLongitude: (json['officeLongitude'] as num?)?.toDouble(),
      geographyPoint: (json['geographyPoint'] as num?)?.toDouble(),
      geographyPolygon: (json['geographyPolygon'] as num?)?.toDouble(),
      masterViewModel: json['masterViewModel'] as String?,
    );

Map<String, dynamic> _$LocationDropdownToJson(LocationDropdown instance) =>
    <String, dynamic>{
      'id': instance.id,
      'countryId': instance.countryId,
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
      'agencyId': instance.agencyId,
      'agencyCode': instance.agencyCode,
      'agencyName': instance.agencyName,
      'unitId': instance.unitId,
      'unitCode': instance.unitCode,
      'unitName': instance.unitName,
      'locationCode': instance.locationCode,
      'locationName': instance.locationName,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'officeLatitude': instance.officeLatitude,
      'officeLongitude': instance.officeLongitude,
      'geographyPoint': instance.geographyPoint,
      'geographyPolygon': instance.geographyPolygon,
      'masterViewModel': instance.masterViewModel,
    };
