// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_new_shout_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestNewShoutCategory _$RequestNewShoutCategoryFromJson(
        Map<String, dynamic> json) =>
    RequestNewShoutCategory(
      id: json['id'] as String?,
      categoryName: json['categoryName'] as String?,
      categoriesDescription: json['categoriesDescription'] as String?,
      requestDate: json['requestDate'] as String?,
      requesterFullname: json['requesterFullname'] as String?,
      requesterUsername: json['requesterUsername'] as String?,
      requesterEmail: json['requesterEmail'] as String?,
      requesterMobile: json['requesterMobile'] as String?,
      statusCode: json['statusCode'] as String?,
      status: json['status'] as String?,
      masterViewModel: json['masterViewModel'] as String?,
    );

Map<String, dynamic> _$RequestNewShoutCategoryToJson(
        RequestNewShoutCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryName': instance.categoryName,
      'categoriesDescription': instance.categoriesDescription,
      'requestDate': instance.requestDate,
      'requesterFullname': instance.requesterFullname,
      'requesterUsername': instance.requesterUsername,
      'requesterEmail': instance.requesterEmail,
      'requesterMobile': instance.requesterMobile,
      'statusCode': instance.statusCode,
      'status': instance.status,
      'masterViewModel': instance.masterViewModel,
    };
