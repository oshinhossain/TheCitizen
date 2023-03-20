// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_shout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcessShout _$ProcessShoutFromJson(Map<String, dynamic> json) => ProcessShout(
      id: json['id'] as String?,
      reportDate: json['reportDate'] as String?,
      reportedByFullname: json['reportedByFullname'] as String?,
      categoryName: json['categoryName'] as String?,
      subcategoryName: json['subcategoryName'] as String?,
      remarks: json['remarks'] as String?,
      fulfillmentStatus: json['fulfillmentStatus'] as String?,
      shoutAge: json['shoutAge'] as int?,
      urgencyLevel: json['urgencyLevel'] as String?,
      reportedAt: json['reportedAt'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      reportedByUsername: json['reportedByUsername'] as String?,
      categoryCode: json['categoryCode'] as String?,
      subcategoryCode: json['subcategoryCode'] as String?,
      officerLatitude: (json['officerLatitude'] as num?)?.toDouble(),
      officerLongitude: (json['officerLongitude'] as num?)?.toDouble(),
      officerUsername: json['officerUsername'] as String?,
      officerFullname: json['officerFullname'] as String?,
      officerMobile: json['officerMobile'] as String?,
      officerEmail: json['officerEmail'] as String?,
      agencyName: json['agencyName'] as String?,
      wasBroadcastAllowed: json['wasBroadcastAllowed'] as bool?,
      countryCode: json['countryCode'] as String?,
      comletedOrDroppedComment: json['comletedOrDroppedComment'] as String?,
      ratingDone: json['ratingDone'] as bool?,
    );

Map<String, dynamic> _$ProcessShoutToJson(ProcessShout instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reportDate': instance.reportDate,
      'reportedByFullname': instance.reportedByFullname,
      'categoryName': instance.categoryName,
      'subcategoryName': instance.subcategoryName,
      'remarks': instance.remarks,
      'fulfillmentStatus': instance.fulfillmentStatus,
      'shoutAge': instance.shoutAge,
      'urgencyLevel': instance.urgencyLevel,
      'reportedAt': instance.reportedAt,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'reportedByUsername': instance.reportedByUsername,
      'categoryCode': instance.categoryCode,
      'subcategoryCode': instance.subcategoryCode,
      'officerLatitude': instance.officerLatitude,
      'officerLongitude': instance.officerLongitude,
      'officerUsername': instance.officerUsername,
      'officerFullname': instance.officerFullname,
      'officerMobile': instance.officerMobile,
      'officerEmail': instance.officerEmail,
      'agencyName': instance.agencyName,
      'wasBroadcastAllowed': instance.wasBroadcastAllowed,
      'countryCode': instance.countryCode,
      'comletedOrDroppedComment': instance.comletedOrDroppedComment,
      'ratingDone': instance.ratingDone,
    };
