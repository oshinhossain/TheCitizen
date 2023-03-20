// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_leave_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamLeaveTypeModel _$TeamLeaveTypeModelFromJson(Map<String, dynamic> json) =>
    TeamLeaveTypeModel(
      id: json['id'] as String?,
      leaveCode: json['leaveCode'] as String?,
      leaveName: json['leaveName'] as String?,
      annualLeave: json['annualLeave'] as int?,
      carryForward: json['carryForward'] as bool?,
      maximumCarryAllow: json['maximumCarryAllow'] as int?,
      annualQuota: json['annualQuota'] as int?,
      applicantTypeEmployeement: json['applicantTypeEmployeement'] as String?,
      applicantTypeGender: json['applicantTypeGender'] as String?,
      applicantTypeReligion: json['applicantTypeReligion'],
      attachmentDayExceed: json['attachmentDayExceed'] as int?,
      calculationCriteria: json['calculationCriteria'] as String?,
      createdAt: json['createdAt'],
      createdbyEmail: json['createdbyEmail'] as String?,
      createdbyFullname: json['createdbyFullname'] as String?,
      createdbyMobile: json['createdbyMobile'] as String?,
      createdbyUsername: json['createdbyUsername'] as String?,
      dayRate: json['dayRate'] as int?,
      isEncashable: json['isEncashable'] as bool?,
      isMandatory: json['isMandatory'] as bool?,
      isProrated: json['isProrated'] ,
      leaveEncashmentType: json['leaveEncashmentType'] as String?,
      maxBackdaysAllow: json['maxBackdaysAllow'] as int?,
      maxReqDay: json['maxReqDay'] as int?,
      maxTimeInLeave: json['maxTimeInLeave'] as int?,
      maxTimeInService: json['maxTimeInService'] as int?,
      minReqDay: json['minReqDay'] as int?,
      minServiceLengthEntitlement: json['minServiceLengthEntitlement'] as int?,
      numberOfPeriod: json['numberOfPeriod'] as int?,
      updatedAt: json['updatedAt'],
      updatedbyEmail: json['updatedbyEmail'] as String?,
      updatedbyFullname: json['updatedbyFullname'] as String?,
      updatedbyMobile: json['updatedbyMobile'] as String?,
      updatedbyUsername: json['updatedbyUsername'] as String?,
    );

Map<String, dynamic> _$TeamLeaveTypeModelToJson(TeamLeaveTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'leaveCode': instance.leaveCode,
      'leaveName': instance.leaveName,
      'annualLeave': instance.annualLeave,
      'carryForward': instance.carryForward,
      'maximumCarryAllow': instance.maximumCarryAllow,
      'isMandatory': instance.isMandatory,
      'annualQuota': instance.annualQuota,
      'applicantTypeEmployeement': instance.applicantTypeEmployeement,
      'applicantTypeGender': instance.applicantTypeGender,
      'attachmentDayExceed': instance.attachmentDayExceed,
      'calculationCriteria': instance.calculationCriteria,
      'dayRate': instance.dayRate,
      'isEncashable': instance.isEncashable,
      'leaveEncashmentType': instance.leaveEncashmentType,
      'maxBackdaysAllow': instance.maxBackdaysAllow,
      'maxReqDay': instance.maxReqDay,
      'maxTimeInLeave': instance.maxTimeInLeave,
      'maxTimeInService': instance.maxTimeInService,
      'minReqDay': instance.minReqDay,
      'minServiceLengthEntitlement': instance.minServiceLengthEntitlement,
      'applicantTypeReligion': instance.applicantTypeReligion,
      'isProrated': instance.isProrated,
      'numberOfPeriod': instance.numberOfPeriod,
      'createdbyFullname': instance.createdbyFullname,
      'createdbyUsername': instance.createdbyUsername,
      'createdbyEmail': instance.createdbyEmail,
      'createdbyMobile': instance.createdbyMobile,
      'createdAt': instance.createdAt,
      'updatedbyFullname': instance.updatedbyFullname,
      'updatedbyUsername': instance.updatedbyUsername,
      'updatedbyEmail': instance.updatedbyEmail,
      'updatedbyMobile': instance.updatedbyMobile,
      'updatedAt': instance.updatedAt,
    };