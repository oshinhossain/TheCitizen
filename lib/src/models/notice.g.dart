// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notice _$NoticeFromJson(Map<String, dynamic> json) => Notice(
      createdByUsername: json['createdByUsername'] as String?,
      createdByFullname: json['createdByFullname'] as String?,
      createdByEmail: json['createdByEmail'] as String?,
      createdByMobile: json['createdByMobile'] as String?,
      createdOn: json['createdOn'] as String?,
      createdAt: json['createdAt'] as String?,
      approvedByUsername: json['approvedByUsername'] as String?,
      approvedByFullname: json['approvedByFullname'] as String?,
      approvedByEmail: json['approvedByEmail'] as String?,
      approvedByMobile: json['approvedByMobile'] as String?,
      approvedOn: json['approvedOn'] as String?,
      approvedAt: json['approvedAt'] as String?,
      id: json['id'] as String?,
      subject: json['subject'] as String?,
      noticeDesc: json['noticeDesc'] as String?,
      status: json['status'] as String?,
      countryId: json['countryId'] as String?,
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
      agencyId: json['agencyId'] as String?,
      agencyCode: json['agencyCode'] as String?,
      agencyName: json['agencyName'] as String?,
      audienceOption: json['audienceOption'] as String?,
      expiryDate: json['expiryDate'] as String?,
    );

Map<String, dynamic> _$NoticeToJson(Notice instance) => <String, dynamic>{
      'createdByUsername': instance.createdByUsername,
      'createdByFullname': instance.createdByFullname,
      'createdByEmail': instance.createdByEmail,
      'createdByMobile': instance.createdByMobile,
      'createdOn': instance.createdOn,
      'createdAt': instance.createdAt,
      'approvedByUsername': instance.approvedByUsername,
      'approvedByFullname': instance.approvedByFullname,
      'approvedByEmail': instance.approvedByEmail,
      'approvedByMobile': instance.approvedByMobile,
      'approvedOn': instance.approvedOn,
      'approvedAt': instance.approvedAt,
      'id': instance.id,
      'subject': instance.subject,
      'noticeDesc': instance.noticeDesc,
      'status': instance.status,
      'countryId': instance.countryId,
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
      'agencyId': instance.agencyId,
      'agencyCode': instance.agencyCode,
      'agencyName': instance.agencyName,
      'audienceOption': instance.audienceOption,
      'expiryDate': instance.expiryDate,
    };
