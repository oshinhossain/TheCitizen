// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_traces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationTraces _$LocationTracesFromJson(Map<String, dynamic> json) =>
    LocationTraces(
      id: json['id'] as String?,
      username: json['username'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      geographyPointJson: json['geographyPointJson'] as String?,
      afterVisitTime: json['afterVisitTime'] as String?,
    );

Map<String, dynamic> _$LocationTracesToJson(LocationTraces instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'geographyPointJson': instance.geographyPointJson,
      'afterVisitTime': instance.afterVisitTime,
    };
