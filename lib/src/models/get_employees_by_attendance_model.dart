import 'package:json_annotation/json_annotation.dart';
part 'get_employees_by_attendance_model.g.dart';
@JsonSerializable()
class GetEmployeesByAttendanceModel {
  String? id;
  String? agencyId;
  String? agencyCode;
  String? agencyName;
  String? officeTimeCode;
  String? officeTimeName;
  String? fullname;
  String? username;
  String? email;
  String? mobile;
  String? attDate;
  String? inTime;
  String? lastInTime;
  String? outTime;
  int? effectiveHours;
  String? effectiveHoursText;
   String? createdbyFullname;
   String? createdbyUsername;
   String? createdbyEmail;
   String? createdbyMobile;
   String? createdAt;
   String? updatedbyFullname;
   String? updatedbyUsername;
   String? updatedbyEmail;
   String? updatedbyMobile;
   String? updatedAt;
  String? status;
  bool? isAbsent;
  bool? isLate;
  bool? isVeryLate;
  int? numberOfEntry;
  String? dateToday;
  bool? isLeave;
  String? purpose;
  bool? late;
  bool? absent;

  GetEmployeesByAttendanceModel(
      {this.id,
      this.agencyId,
      this.agencyCode,
      this.agencyName,
      this.officeTimeCode,
      this.officeTimeName,
      this.fullname,
      this.username,
      this.email,
      this.mobile,
      this.attDate,
      this.inTime,
      this.lastInTime,
      this.outTime,
      this.effectiveHours,
      this.effectiveHoursText,
      this.createdbyFullname,
      this.createdbyUsername,
      this.createdbyEmail,
      this.createdbyMobile,
      this.createdAt,
      this.updatedbyFullname,
      this.updatedbyUsername,
      this.updatedbyEmail,
      this.updatedbyMobile,
      this.updatedAt,
      this.status,
      this.isAbsent,
      this.isLate,
      this.isVeryLate,
      this.numberOfEntry,
      this.dateToday,
      this.isLeave,
      this.purpose,
      this.late,
      this.absent});

  factory GetEmployeesByAttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$GetEmployeesByAttendanceModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetEmployeesByAttendanceModelToJson(this);
}
