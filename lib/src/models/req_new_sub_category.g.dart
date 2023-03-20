// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'req_new_sub_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReqNewSubCategory _$ReqNewSubCategoryFromJson(Map<String, dynamic> json) =>
    ReqNewSubCategory(
      id: json['id'] as String?,
      categoryId: json['categoryId'] as String?,
      categorySeqNo: json['categorySeqNo'] as int?,
      categoryCode: json['categoryCode'] as String?,
      categoryName: json['categoryName'] as String?,
      subcategoryName: json['subcategoryName'] as String?,
      subcategoryDescription: json['subcategoryDescription'] as String?,
      requestDate: json['requestDate'] as String?,
      requesterFullname: json['requesterFullname'] as String?,
      requesterUsername: json['requesterUsername'] as String?,
      requesterEmail: json['requesterEmail'] as String?,
      requesterMobile: json['requesterMobile'] as String?,
      statusCode: json['statusCode'] as String?,
      status: json['status'] as String?,
      masterViewModel: json['masterViewModel'] as String?,
    );

Map<String, dynamic> _$ReqNewSubCategoryToJson(ReqNewSubCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'categorySeqNo': instance.categorySeqNo,
      'categoryCode': instance.categoryCode,
      'categoryName': instance.categoryName,
      'subcategoryName': instance.subcategoryName,
      'subcategoryDescription': instance.subcategoryDescription,
      'requestDate': instance.requestDate,
      'requesterFullname': instance.requesterFullname,
      'requesterUsername': instance.requesterUsername,
      'requesterEmail': instance.requesterEmail,
      'requesterMobile': instance.requesterMobile,
      'statusCode': instance.statusCode,
      'status': instance.status,
      'masterViewModel': instance.masterViewModel,
    };
