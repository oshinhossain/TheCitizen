// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shout_sub_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoutSubCategories _$ShoutSubCategoriesFromJson(Map<String, dynamic> json) =>
    ShoutSubCategories(
      id: json['id'] as String?,
      categoryId: json['categoryId'] as String?,
      icategorySeqNod: json['icategorySeqNod'] as int?,
      categoryCode: json['categoryCode'] as String?,
      categoryName: json['categoryName'] as String?,
      seqNo: json['seqNo'] as int?,
      subcategoryCode: json['subcategoryCode'] as String?,
      subcategoryName: json['subcategoryName'] as String?,
      needsClosureByShouter: json['needsClosureByShouter'] as bool?,
      attentionSelectorType: json['attentionSelectorType'] as String?,
      canBeAnonymous: json['canBeAnonymous'] as bool?,
      defaultUrgency: json['defaultUrgency'] as String?,
      agenciesAssignedNo: json['agenciesAssignedNo'] as int?,
      geoRestrictionType: json['geoRestrictionType'] as String?,
      geoRestrictionLevel: json['geoRestrictionLevel'] as int?,
      geoRoutingLevel: json['geoRoutingLevel'] as int?,
      sucThemeColor: json['sucThemeColor'] as String?,
      subcategoryImage: json['subcategoryImage'] as String?,
    );

Map<String, dynamic> _$ShoutSubCategoriesToJson(ShoutSubCategories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'icategorySeqNod': instance.icategorySeqNod,
      'categoryCode': instance.categoryCode,
      'categoryName': instance.categoryName,
      'seqNo': instance.seqNo,
      'subcategoryCode': instance.subcategoryCode,
      'subcategoryName': instance.subcategoryName,
      'needsClosureByShouter': instance.needsClosureByShouter,
      'attentionSelectorType': instance.attentionSelectorType,
      'canBeAnonymous': instance.canBeAnonymous,
      'defaultUrgency': instance.defaultUrgency,
      'agenciesAssignedNo': instance.agenciesAssignedNo,
      'geoRestrictionType': instance.geoRestrictionType,
      'geoRestrictionLevel': instance.geoRestrictionLevel,
      'geoRoutingLevel': instance.geoRoutingLevel,
      'sucThemeColor': instance.sucThemeColor,
      'subcategoryImage': instance.subcategoryImage,
    };
