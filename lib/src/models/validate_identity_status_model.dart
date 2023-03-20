import 'package:json_annotation/json_annotation.dart';
part 'validate_identity_status_model.g.dart';

@JsonSerializable()
class ValidateIdentityStatus {
  String? username;
  String? personName;
  String? email;
  String? mobile;
  String? nidStatusCode;
  String? nidStatusName;
  String? passportStatusCode;
  String? passportStatusName;
  String? birthCertificateStatusCode;
  String? birthCertificateStatusName;
  String? hscStatusCode;
  String? hscStatusName;
  String? sscStatusCode;
  String? sscStatusName;
  String? tinStatusCode;
  String? tinStatusName;
  String? bscStatusCode;
  String? bscStatusName;
  String? mscStatusCode;
  String? mscStatusName;
  String? dlStatusCode;
  String? dlStatusName;
  String? mobileStatusCode;
  String? mobileStatusName;

  ValidateIdentityStatus(
      {this.username,
      this.personName,
      this.email,
      this.mobile,
      this.nidStatusCode,
      this.nidStatusName,
      this.passportStatusCode,
      this.passportStatusName,
      this.birthCertificateStatusCode,
      this.birthCertificateStatusName,
      this.hscStatusCode,
      this.hscStatusName,
      this.sscStatusCode,
      this.sscStatusName,
      this.tinStatusCode,
      this.tinStatusName,
      this.bscStatusCode,
      this.bscStatusName,
      this.mscStatusCode,
      this.mscStatusName,
      this.dlStatusCode,
      this.dlStatusName,
      this.mobileStatusCode,
      this.mobileStatusName});

  factory ValidateIdentityStatus.fromJson(Map<String, dynamic> json) =>
      _$ValidateIdentityStatusFromJson(json);
  Map<String, dynamic> toJson() => _$ValidateIdentityStatusToJson(this);
}
