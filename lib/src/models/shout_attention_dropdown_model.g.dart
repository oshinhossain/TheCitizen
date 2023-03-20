// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shout_attention_dropdown_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoutAttentionDropdownModel _$ShoutAttentionDropdownModelFromJson(
        Map<String, dynamic> json) =>
    ShoutAttentionDropdownModel(
      agencyId: json['agencyId'] as String?,
      agencyCode: json['agencyCode'] as String?,
      agencyName: json['agencyName'] as String?,
      unitId: json['unitId'],
      unitCode: json['unitCode'],
      unitName: json['unitName'],
      locationId: json['locationId'],
      locationCode: json['locationCode'],
      locationName: json['locationName'],
      id: json['id'] as String?,
      countryId: json['countryId'] as String?,
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
      categoryId: json['categoryId'] as String?,
      categoryCode: json['categoryCode'] as String?,
      categoryName: json['categoryName'] as String?,
      subcategoryId: json['subcategoryId'] as String?,
      subcategoryCode: json['subcategoryCode'] as String?,
      subcategoryName: json['subcategoryName'] as String?,
      transportFeeRatePkm: json['transportFeeRatePkm'] as num?,
      geoRoutingType: json['geoRoutingType'] as String?,
      geoRoutingLevel: json['geoRoutingLevel'] as num?,
      levelType: json['levelType'],
      officerAssignmentType: json['officerAssignmentType'] as String?,
      lastSelectedOfficerSeq: json['lastSelectedOfficerSeq'] as num?,
      assignedUsername: json['assignedUsername'] as String?,
      assignedFullname: json['assignedFullname'] as String?,
      assignedMobile: json['assignedMobile'] as String?,
      assignedEmail: json['assignedEmail'] as String?,
      masterViewModel: json['masterViewModel'],
      geoRoutingEnabled: json['geoRoutingEnabled'] as bool?,
      transportOffered: json['transportOffered'] as bool?,
      visitPromised: json['visitPromised'] as bool?,
      copyReceiver: json['copyReceiver'] as bool?,
      acquiredByPartner: json['acquiredByPartner'] as bool?,
    );

Map<String, dynamic> _$ShoutAttentionDropdownModelToJson(
        ShoutAttentionDropdownModel instance) =>
    <String, dynamic>{
      'agencyId': instance.agencyId,
      'agencyCode': instance.agencyCode,
      'agencyName': instance.agencyName,
      'unitId': instance.unitId,
      'unitCode': instance.unitCode,
      'unitName': instance.unitName,
      'locationId': instance.locationId,
      'locationCode': instance.locationCode,
      'locationName': instance.locationName,
      'id': instance.id,
      'countryId': instance.countryId,
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
      'categoryId': instance.categoryId,
      'categoryCode': instance.categoryCode,
      'categoryName': instance.categoryName,
      'subcategoryId': instance.subcategoryId,
      'subcategoryCode': instance.subcategoryCode,
      'subcategoryName': instance.subcategoryName,
      'transportFeeRatePkm': instance.transportFeeRatePkm,
      'geoRoutingType': instance.geoRoutingType,
      'geoRoutingLevel': instance.geoRoutingLevel,
      'levelType': instance.levelType,
      'officerAssignmentType': instance.officerAssignmentType,
      'lastSelectedOfficerSeq': instance.lastSelectedOfficerSeq,
      'assignedUsername': instance.assignedUsername,
      'assignedFullname': instance.assignedFullname,
      'assignedMobile': instance.assignedMobile,
      'assignedEmail': instance.assignedEmail,
      'masterViewModel': instance.masterViewModel,
      'geoRoutingEnabled': instance.geoRoutingEnabled,
      'transportOffered': instance.transportOffered,
      'visitPromised': instance.visitPromised,
      'copyReceiver': instance.copyReceiver,
      'acquiredByPartner': instance.acquiredByPartner,
    };
