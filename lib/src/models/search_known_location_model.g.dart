// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_known_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchKnownLocationModel _$SearchKnownLocationModelFromJson(
        Map<String, dynamic> json) =>
    SearchKnownLocationModel(
      id: json['id'] as String?,
      agencyId: json['agencyId'] as String?,
      agencyCode: json['agencyCode'] as String?,
      agencyName: json['agencyName'] as String?,
      locationName: json['locationName'] as String?,
      address: json['address'] as String?,
      businessTag: json['businessTag'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
      geoLevel1Code: json['geoLevel1Code'] as String?,
      geoLevel1Name: json['geoLevel1Name'] as String?,
      geoLevel2Code: json['geoLevel2Code'] as String?,
      geoLevel2Name: json['geoLevel2Name'] as String?,
      geoLevel3Code: json['geoLevel3Code'] as String?,
      geoLevel3Name: json['geoLevel3Name'] as String?,
      geoLevel4Code: json['geoLevel4Code'],
      geoLevel4Name: json['geoLevel4Name'],
      createdByCode: json['createdByCode'],
      createdByName: json['createdByName'] as String?,
      createdByUsername: json['createdByUsername'] as String?,
      createdByEmail: json['createdByEmail'] as String?,
      createdByCompanyCode: json['createdByCompanyCode'],
      createdByCompanyName: json['createdByCompanyName'],
      createdAt: json['createdAt'],
      updatedByCode: json['updatedByCode'],
      updatedByName: json['updatedByName'],
      updatedByUsername: json['updatedByUsername'],
      updatedByEmail: json['updatedByEmail'],
      updatedByCompanyCode: json['updatedByCompanyCode'],
      updatedByCompanyName: json['updatedByCompanyName'],
      updatedAt: json['updatedAt'],
      status: json['status'] as int?,
      masterViewModel: json['masterViewModel'],
    );

Map<String, dynamic> _$SearchKnownLocationModelToJson(
        SearchKnownLocationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'agencyId': instance.agencyId,
      'agencyCode': instance.agencyCode,
      'agencyName': instance.agencyName,
      'locationName': instance.locationName,
      'address': instance.address,
      'businessTag': instance.businessTag,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
      'geoLevel1Code': instance.geoLevel1Code,
      'geoLevel1Name': instance.geoLevel1Name,
      'geoLevel2Code': instance.geoLevel2Code,
      'geoLevel2Name': instance.geoLevel2Name,
      'geoLevel3Code': instance.geoLevel3Code,
      'geoLevel3Name': instance.geoLevel3Name,
      'geoLevel4Code': instance.geoLevel4Code,
      'geoLevel4Name': instance.geoLevel4Name,
      'createdByCode': instance.createdByCode,
      'createdByName': instance.createdByName,
      'createdByUsername': instance.createdByUsername,
      'createdByEmail': instance.createdByEmail,
      'createdByCompanyCode': instance.createdByCompanyCode,
      'createdByCompanyName': instance.createdByCompanyName,
      'createdAt': instance.createdAt,
      'updatedByCode': instance.updatedByCode,
      'updatedByName': instance.updatedByName,
      'updatedByUsername': instance.updatedByUsername,
      'updatedByEmail': instance.updatedByEmail,
      'updatedByCompanyCode': instance.updatedByCompanyCode,
      'updatedByCompanyName': instance.updatedByCompanyName,
      'updatedAt': instance.updatedAt,
      'status': instance.status,
      'masterViewModel': instance.masterViewModel,
    };
