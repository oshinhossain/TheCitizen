import 'package:json_annotation/json_annotation.dart';

part 'location_dropdown.g.dart';

@JsonSerializable()
class LocationDropdown {
  String? id;
  String? countryId;
  String? countryCode;
  String? countryName;
  String? agencyId;
  String? agencyCode;
  String? agencyName;
  String? unitId;
  String? unitCode;
  String? unitName;
  String? locationCode;
  String? locationName;
  String? address;
  String? phone;
  String? email;
  double? officeLatitude;
  double? officeLongitude;
  double? geographyPoint;
  double? geographyPolygon;
  String? masterViewModel;

  LocationDropdown(
      {this.id,
      this.countryId,
      this.countryCode,
      this.countryName,
      this.agencyId,
      this.agencyCode,
      this.agencyName,
      this.unitId,
      this.unitCode,
      this.unitName,
      this.locationCode,
      this.locationName,
      this.address,
      this.phone,
      this.email,
      this.officeLatitude,
      this.officeLongitude,
      this.geographyPoint,
      this.geographyPolygon,
      this.masterViewModel});

  factory LocationDropdown.fromJson(Map<String, dynamic> json) => _$LocationDropdownFromJson(json);
  Map<String, dynamic> toJson() => _$LocationDropdownToJson(this);
}
