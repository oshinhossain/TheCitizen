// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_employees_by_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEmployeesByAttendanceModel _$GetEmployeesByAttendanceModelFromJson(
        Map<String, dynamic> json) =>
    GetEmployeesByAttendanceModel(
      id: json['id'] as String?,
      agencyId: json['agencyId'] as String?,
      agencyCode: json['agencyCode'] as String?,
      agencyName: json['agencyName'] as String?,
      officeTimeCode: json['officeTimeCode'] as String?,
      officeTimeName: json['officeTimeName'] as String?,
      fullname: json['fullname'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      attDate: json['attDate'] as String?,
      inTime: json['inTime'] as String?,
      lastInTime: json['lastInTime'] as String?,
      outTime: json['outTime'] as String?,
      effectiveHours: json['effectiveHours'] as int?,
      effectiveHoursText: json['effectiveHoursText'] as String?,
      createdbyFullname: json['createdbyFullname'] as String?,
      createdbyUsername: json['createdbyUsername'] as String?,
      createdbyEmail: json['createdbyEmail'] as String?,
      createdbyMobile: json['createdbyMobile'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedbyFullname: json['updatedbyFullname'] as String?,
      updatedbyUsername: json['updatedbyUsername'] as String?,
      updatedbyEmail: json['updatedbyEmail'] as String?,
      updatedbyMobile: json['updatedbyMobile'] as String?,
      updatedAt: json['updatedAt'] as String?,
      status: json['status'] as String?,
      isAbsent: json['isAbsent'] as bool?,
      isLate: json['isLate'] as bool?,
      isVeryLate: json['isVeryLate'] as bool?,
      numberOfEntry: json['numberOfEntry'] as int?,
      dateToday: json['dateToday'] as String?,
      isLeave: json['isLeave'] as bool?,
      purpose: json['purpose'] as String?,
      late: json['late'] as bool?,
      absent: json['absent'] as bool?,
    );

Map<String, dynamic> _$GetEmployeesByAttendanceModelToJson(
        GetEmployeesByAttendanceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'agencyId': instance.agencyId,
      'agencyCode': instance.agencyCode,
      'agencyName': instance.agencyName,
      'officeTimeCode': instance.officeTimeCode,
      'officeTimeName': instance.officeTimeName,
      'fullname': instance.fullname,
      'username': instance.username,
      'email': instance.email,
      'mobile': instance.mobile,
      'attDate': instance.attDate,
      'inTime': instance.inTime,
      'lastInTime': instance.lastInTime,
      'outTime': instance.outTime,
      'effectiveHours': instance.effectiveHours,
      'effectiveHoursText': instance.effectiveHoursText,
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
      'status': instance.status,
      'isAbsent': instance.isAbsent,
      'isLate': instance.isLate,
      'isVeryLate': instance.isVeryLate,
      'numberOfEntry': instance.numberOfEntry,
      'dateToday': instance.dateToday,
      'isLeave': instance.isLeave,
      'purpose': instance.purpose,
      'late': instance.late,
      'absent': instance.absent,
    };
