import 'package:json_annotation/json_annotation.dart';
part 'process_shout.g.dart';

@JsonSerializable()
class ProcessShout {
  String? id;
  String? reportDate;
  String? reportedByFullname;
  String? categoryName;
  String? subcategoryName;
  String? remarks;
  String? fulfillmentStatus;
  int? shoutAge;
  String? urgencyLevel;
  String? reportedAt;
  double? latitude;
  double? longitude;
  String? reportedByUsername;
  String? categoryCode;
  String? subcategoryCode;
  double? officerLatitude;
  double? officerLongitude;
  String? officerUsername;
  String? officerFullname;
  String? officerMobile;
  String? officerEmail;
  String? agencyName;
  bool? wasBroadcastAllowed;
  String? countryCode;
  String? comletedOrDroppedComment;
  bool? ratingDone;

  ProcessShout(
      {this.id,
      this.reportDate,
      this.reportedByFullname,
      this.categoryName,
      this.subcategoryName,
      this.remarks,
      this.fulfillmentStatus,
      this.shoutAge,
      this.urgencyLevel,
      this.reportedAt,
      this.latitude,
      this.longitude,
      this.reportedByUsername,
      this.categoryCode,
      this.subcategoryCode,
      this.officerLatitude,
      this.officerLongitude,
      this.officerUsername,
      this.officerFullname,
      this.officerMobile,
      this.officerEmail,
      this.agencyName,
      this.wasBroadcastAllowed,
      this.countryCode,
      this.comletedOrDroppedComment,
      this.ratingDone});

  factory ProcessShout.fromJson(Map<String, dynamic> json) => _$ProcessShoutFromJson(json);
  Map<String, dynamic> toJson() => _$ProcessShoutToJson(this);
}
