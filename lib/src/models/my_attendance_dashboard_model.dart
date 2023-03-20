import 'package:json_annotation/json_annotation.dart';
part 'my_attendance_dashboard_model.g.dart';

@JsonSerializable()
class MyAttendanceDashboardModel {
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
  int? numberOfEntry;
  bool? isVeryLate;
  String? dateToday;
  String? remarks;
  bool? isLeave;
  String? purpose;
  String? masterViewModel;
  bool? late;
  bool? absent;

  MyAttendanceDashboardModel(
      {this.id,
      this.agencyId,
      this.isVeryLate,
      this.remarks,
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
      this.numberOfEntry,
      this.dateToday,
      this.isLeave,
      this.purpose,
      this.masterViewModel,
      this.late,
      this.absent});

  factory MyAttendanceDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$MyAttendanceDashboardModelFromJson(json);
  Map<String, dynamic> toJson() => _$MyAttendanceDashboardModelToJson(this);
}
