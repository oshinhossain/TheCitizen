import 'package:json_annotation/json_annotation.dart';
import 'package:the_citizen_app/src/models/agencyRoleModel.dart';
part 'my_team.g.dart';

@JsonSerializable()
class MyTeam {
  String? empId;
  String? userId;
  String? username;
  String? fullname;
  String? email;
  String? mobile;
  String? gender;
  String? reportingManagerUsername;
  String? reportingManagerFullname;
  String? reportingManagerEmail;
  String? reportingManagerMobile;
  String? agencyId;
  String? agencyCode;
  String? agencyName;
  String? countryId;
  String? countryCode;
  String? countryName;
  double? latitude;
  double? longitude;
  String? currentLocationUpdatedOn;
  String? currentLocationUpdatedAt;
  AgencyRoleModel? roleModel;

  MyTeam({
    this.empId,
    this.userId,
    this.username,
    this.fullname,
    this.email,
    this.mobile,
    this.gender,
    this.reportingManagerUsername,
    this.reportingManagerFullname,
    this.reportingManagerEmail,
    this.reportingManagerMobile,
    this.agencyId,
    this.agencyCode,
    this.agencyName,
    this.countryId,
    this.countryCode,
    this.countryName,
    this.latitude,
    this.longitude,
    this.currentLocationUpdatedOn,
    this.currentLocationUpdatedAt,
    this.roleModel,
  });

  factory MyTeam.fromJson(Map<String, dynamic> json) => _$MyTeamFromJson(json);
  Map<String, dynamic> toJson() => _$MyTeamToJson(this);
}
