// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shout_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoutCategories _$ShoutCategoriesFromJson(Map<String, dynamic> json) =>
    ShoutCategories(
      id: json['id'] as String?,
      seqNo: json['seqNo'] as int?,
      categoryCode: json['categoryCode'] as String?,
      categoryName: json['categoryName'] as String?,
      iconName: json['iconName'] as String?,
      themeColor: json['themeColor'] as String?,
      enabled: json['enabled'] as bool?,
      geographicallyRestricted: json['geographicallyRestricted'] as bool?,
      onlyForAgency: json['onlyForAgency'] as bool?,
      categoryImage: json['categoryImage'] as String?,
    )..totalSubcategoryCount = json['totalSubcategoryCount'] as int?;

Map<String, dynamic> _$ShoutCategoriesToJson(ShoutCategories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seqNo': instance.seqNo,
      'categoryCode': instance.categoryCode,
      'categoryName': instance.categoryName,
      'iconName': instance.iconName,
      'themeColor': instance.themeColor,
      'totalSubcategoryCount': instance.totalSubcategoryCount,
      'enabled': instance.enabled,
      'geographicallyRestricted': instance.geographicallyRestricted,
      'onlyForAgency': instance.onlyForAgency,
      'categoryImage': instance.categoryImage,
    };
