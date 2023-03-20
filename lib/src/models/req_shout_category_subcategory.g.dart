// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'req_shout_category_subcategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequesShoutCategorySubCategory _$RequesShoutCategorySubCategoryFromJson(
        Map<String, dynamic> json) =>
    RequesShoutCategorySubCategory(
      id: json['id'] as String?,
      shoutCategoryId: json['shoutCategoryId'] as String?,
      shoutCategoryCode: json['shoutCategoryCode'] as String?,
      shoutCategoryName: json['shoutCategoryName'] as String?,
      shoutCategorySeqNo: json['shoutCategorySeqNo'] as String?,
      shoutTypeName: json['shoutTypeName'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      createdById: json['createdById'] as String?,
      createdAt: json['createdAt'] as String?,
      masterViewModel: json['masterViewModel'] as String?,
    );

Map<String, dynamic> _$RequesShoutCategorySubCategoryToJson(
        RequesShoutCategorySubCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shoutCategoryId': instance.shoutCategoryId,
      'shoutCategoryCode': instance.shoutCategoryCode,
      'shoutCategoryName': instance.shoutCategoryName,
      'shoutCategorySeqNo': instance.shoutCategorySeqNo,
      'shoutTypeName': instance.shoutTypeName,
      'description': instance.description,
      'status': instance.status,
      'createdById': instance.createdById,
      'createdAt': instance.createdAt,
      'masterViewModel': instance.masterViewModel,
    };
