import 'package:json_annotation/json_annotation.dart';

part 'unit.g.dart';

@JsonSerializable()
class Unit {
  String? id;
  String? countryId;
  String? countryCode;
  String? countryName;
  String? agencyId;
  String? agencyCode;
  String? agencyName;

  String? unitCode;
  String? unitName;
  String? address;
  String? phone;
  String? email;
  double? officeLatitude;
  double? officeLongitude;
  int? unitLevelCode;

  String? unitLevelName;

  String? parentUnitId;
  String? parentUnitCode;
  String? parentUnitName;
  int? parentUnitLevelCode;
  String? parentUnitLevelName;
  String? geographyPoint;
  String? geographyPolygon;
  String? masterViewModel;

  Unit(
      {this.id,
      this.countryId,
      this.countryCode,
      this.countryName,
      this.agencyId,
      this.agencyCode,
      this.agencyName,
      this.unitCode,
      this.unitName,
      this.address,
      this.phone,
      this.email,
      this.officeLatitude,
      this.officeLongitude,
      this.unitLevelCode,
      this.unitLevelName,
      this.parentUnitId,
      this.parentUnitCode,
      this.parentUnitName,
      this.parentUnitLevelCode,
      this.parentUnitLevelName,
      this.geographyPoint,
      this.geographyPolygon,
      this.masterViewModel});

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
  Map<String, dynamic> toJson() => _$UnitToJson(this);
}
