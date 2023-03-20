// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveBalanceModel _$LeaveBalanceModelFromJson(Map<String, dynamic> json) =>
    LeaveBalanceModel(
      leaveCode: json['leaveCode'] as String?,
      leaveType: json['leaveType'] as String?,
      totalBalane: json['totalBalane'] as int?,
      leaveRequest: (json['leaveRequest'] as num?)?.toDouble(),
      balanceAfterLeave: (json['balanceAfterLeave'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LeaveBalanceModelToJson(LeaveBalanceModel instance) =>
    <String, dynamic>{
      'leaveCode': instance.leaveCode,
      'leaveType': instance.leaveType,
      'totalBalane': instance.totalBalane,
      'leaveRequest': instance.leaveRequest,
      'balanceAfterLeave': instance.balanceAfterLeave,
    };
