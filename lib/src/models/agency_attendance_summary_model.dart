import 'package:json_annotation/json_annotation.dart';
part 'agency_attendance_summary_model.g.dart';

@JsonSerializable()
class AgencyattendanceSummaryModel {
  String? attDate;
  int? presentEmpCounter;
  int? presentNowEmpCounter;
  int? absentEmpCounter;
  int? onTimeEmpCounter;
  int? lateEmpCounter;
  int? onLeaveEmpCounter;

  AgencyattendanceSummaryModel(
      {this.attDate,
      this.presentEmpCounter,
      this.presentNowEmpCounter,
      this.absentEmpCounter,
      this.onTimeEmpCounter,
      this.lateEmpCounter,
      this.onLeaveEmpCounter});

  factory AgencyattendanceSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$AgencyattendanceSummaryModelFromJson(json);
  Map<String, dynamic> toJson() => _$AgencyattendanceSummaryModelToJson(this);
}
