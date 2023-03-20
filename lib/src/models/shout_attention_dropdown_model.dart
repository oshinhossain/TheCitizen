// shout_attention_dropdown_model.
import 'package:json_annotation/json_annotation.dart';
part 'shout_attention_dropdown_model.g.dart';

@JsonSerializable()
class ShoutAttentionDropdownModel {
  String? agencyId;
  String? agencyCode;
  String? agencyName;
  dynamic unitId;
  dynamic unitCode;
  dynamic unitName;
  dynamic locationId;
  dynamic locationCode;
  dynamic locationName;
  String? id;
  String? countryId;
  String? countryCode;
  String? countryName;
  String? categoryId;
  String? categoryCode;
  String? categoryName;
  String? subcategoryId;
  String? subcategoryCode;
  String? subcategoryName;
  num? transportFeeRatePkm;
  String? geoRoutingType;
  num? geoRoutingLevel;
  dynamic levelType;
  String? officerAssignmentType;
  num? lastSelectedOfficerSeq;
  String? assignedUsername;
  String? assignedFullname;
  String? assignedMobile;
  String? assignedEmail;
  dynamic masterViewModel;
  bool? geoRoutingEnabled;
  bool? transportOffered;
  bool? visitPromised;
  bool? copyReceiver;
  bool? acquiredByPartner;

  ShoutAttentionDropdownModel({
    this.agencyId,
    this.agencyCode,
    this.agencyName,
    this.unitId,
    this.unitCode,
    this.unitName,
    this.locationId,
    this.locationCode,
    this.locationName,
    this.id,
    this.countryId,
    this.countryCode,
    this.countryName,
    this.categoryId,
    this.categoryCode,
    this.categoryName,
    this.subcategoryId,
    this.subcategoryCode,
    this.subcategoryName,
    this.transportFeeRatePkm,
    this.geoRoutingType,
    this.geoRoutingLevel,
    this.levelType,
    this.officerAssignmentType,
    this.lastSelectedOfficerSeq,
    this.assignedUsername,
    this.assignedFullname,
    this.assignedMobile,
    this.assignedEmail,
    this.masterViewModel,
    this.geoRoutingEnabled,
    this.transportOffered,
    this.visitPromised,
    this.copyReceiver,
    this.acquiredByPartner,
  });

  factory ShoutAttentionDropdownModel.fromJson(Map<String, dynamic> json) =>
      _$ShoutAttentionDropdownModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShoutAttentionDropdownModelToJson(this);
}
