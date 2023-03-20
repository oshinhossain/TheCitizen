// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency_attendance_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgencyattendanceSummaryModel _$AgencyattendanceSummaryModelFromJson(
        Map<String, dynamic> json) =>
    AgencyattendanceSummaryModel(
      attDate: json['attDate'] as String?,
      presentEmpCounter: json['presentEmpCounter'] as int?,
      presentNowEmpCounter: json['presentNowEmpCounter'] as int?,
      absentEmpCounter: json['absentEmpCounter'] as int?,
      onTimeEmpCounter: json['onTimeEmpCounter'] as int?,
      lateEmpCounter: json['lateEmpCounter'] as int?,
      onLeaveEmpCounter: json['onLeaveEmpCounter'] as int?,
    );

Map<String, dynamic> _$AgencyattendanceSummaryModelToJson(
        AgencyattendanceSummaryModel instance) =>
    <String, dynamic>{
      'attDate': instance.attDate,
      'presentEmpCounter': instance.presentEmpCounter,
      'presentNowEmpCounter': instance.presentNowEmpCounter,
      'absentEmpCounter': instance.absentEmpCounter,
      'onTimeEmpCounter': instance.onTimeEmpCounter,
      'lateEmpCounter': instance.lateEmpCounter,
      'onLeaveEmpCounter': instance.onLeaveEmpCounter,
    };
