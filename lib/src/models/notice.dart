import 'package:json_annotation/json_annotation.dart';
part 'notice.g.dart';

@JsonSerializable()
class Notice {
  String? createdByUsername;
  String? createdByFullname;
  String? createdByEmail;
  String? createdByMobile;
  String? createdOn;
  String? createdAt;

  String? approvedByUsername;
  String? approvedByFullname;
  String? approvedByEmail;
  String? approvedByMobile;
  String? approvedOn;
  String? approvedAt;
  String? id;
  String? subject;
  String? noticeDesc;

  String? status;
  String? countryId;
  String? countryCode;
  String? countryName;
  String? agencyId;
  String? agencyCode;
  String? agencyName;
  String? audienceOption;
  String? expiryDate;

  Notice({
    this.createdByUsername,
    this.createdByFullname,
    this.createdByEmail,
    this.createdByMobile,
    this.createdOn,
    this.createdAt,
    this.approvedByUsername,
    this.approvedByFullname,
    this.approvedByEmail,
    this.approvedByMobile,
    this.approvedOn,
    this.approvedAt,
    this.id,
    this.subject,
    this.noticeDesc,
    this.status,
    this.countryId,
    this.countryCode,
    this.countryName,
    this.agencyId,
    this.agencyCode,
    this.agencyName,
    this.audienceOption,
    this.expiryDate,
  });

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeToJson(this);
}
