import 'package:json_annotation/json_annotation.dart';

part 'team_leave_type_model.g.dart';

@JsonSerializable()
class TeamLeaveTypeModel {
  String ?id;
  String ?leaveCode;
  String ?leaveName;
  int ?annualLeave;
  bool? carryForward;
  int? maximumCarryAllow;
  bool ?isMandatory;
  int? annualQuota;
  String? applicantTypeEmployeement;
  String ?applicantTypeGender;
  int ?attachmentDayExceed;
  String ?calculationCriteria;
  int? dayRate;
  bool ?isEncashable;
  String? leaveEncashmentType;
  int ?maxBackdaysAllow;
  int?maxReqDay;
  int ?maxTimeInLeave;
  int ?maxTimeInService;
  int ?minReqDay;
  int ?minServiceLengthEntitlement;
  dynamic applicantTypeReligion;
  dynamic isProrated;
  int ?numberOfPeriod;
  String? createdbyFullname;
  String? createdbyUsername;
  String? createdbyEmail;
  String? createdbyMobile;
  dynamic createdAt;
  String ?updatedbyFullname;
  String? updatedbyUsername;
  String? updatedbyEmail;
  String ?updatedbyMobile;
  dynamic updatedAt;

  TeamLeaveTypeModel(
      {required this.id,
      required this.leaveCode,
      required this.leaveName,
      required this.annualLeave,
      required this.carryForward,
      required this.maximumCarryAllow,
      required this.annualQuota,
      required this.applicantTypeEmployeement,
      required this.applicantTypeGender,
      required this.applicantTypeReligion,
      required this.attachmentDayExceed,
      required this.calculationCriteria,
      required this.createdAt,
      required this.createdbyEmail,
      required this.createdbyFullname,
      required this.createdbyMobile,
      required this.createdbyUsername,
      required this.dayRate,
      required this.isEncashable,
      required this.isMandatory,
      required this.isProrated,
      required this.leaveEncashmentType,
      required this.maxBackdaysAllow,
      required this.maxReqDay,
      required this.maxTimeInLeave,
      required this.maxTimeInService,
      required this.minReqDay,
      required this.minServiceLengthEntitlement,
      required this.numberOfPeriod,
      required this.updatedAt,
      required this.updatedbyEmail,
      required this.updatedbyFullname,
      required this.updatedbyMobile,
      required this.updatedbyUsername});

      factory TeamLeaveTypeModel.fromJson(Map<String, dynamic> json) =>
      _$TeamLeaveTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$TeamLeaveTypeModelToJson(this);
}
