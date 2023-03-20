import 'package:json_annotation/json_annotation.dart';
part 'search_known_location_model.g.dart';

@JsonSerializable()
class SearchKnownLocationModel {
  String? id;
  String? agencyId;
  String? agencyCode;
  String? agencyName;
  String? locationName;
  String? address;
  String? businessTag;
  double? latitude;
  double? longitude;
  String? countryCode;
  String? countryName;
  String? geoLevel1Code;
  String? geoLevel1Name;
  String? geoLevel2Code;
  String? geoLevel2Name;
  String? geoLevel3Code;
  String? geoLevel3Name;
  dynamic geoLevel4Code;
  dynamic geoLevel4Name;
  dynamic createdByCode;
  String? createdByName;
  String? createdByUsername;
  String? createdByEmail;
  dynamic createdByCompanyCode;
  dynamic createdByCompanyName;
  dynamic createdAt;
  dynamic updatedByCode;
  dynamic updatedByName;
  dynamic updatedByUsername;
  dynamic updatedByEmail;
  dynamic updatedByCompanyCode;
  dynamic updatedByCompanyName;
  dynamic updatedAt;
  int? status;
  dynamic masterViewModel;

  SearchKnownLocationModel({
    this.id,
    this.agencyId,
    this.agencyCode,
    this.agencyName,
    this.locationName,
    this.address,
    this.businessTag,
    this.latitude,
    this.longitude,
    this.countryCode,
    this.countryName,
    this.geoLevel1Code,
    this.geoLevel1Name,
    this.geoLevel2Code,
    this.geoLevel2Name,
    this.geoLevel3Code,
    this.geoLevel3Name,
    this.geoLevel4Code,
    this.geoLevel4Name,
    this.createdByCode,
    this.createdByName,
    this.createdByUsername,
    this.createdByEmail,
    this.createdByCompanyCode,
    this.createdByCompanyName,
    this.createdAt,
    this.updatedByCode,
    this.updatedByName,
    this.updatedByUsername,
    this.updatedByEmail,
    this.updatedByCompanyCode,
    this.updatedByCompanyName,
    this.updatedAt,
    this.status,
    this.masterViewModel,
  });

  factory SearchKnownLocationModel.fromJson(Map<String, dynamic> json) =>
      _$SearchKnownLocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchKnownLocationModelToJson(this);
}
