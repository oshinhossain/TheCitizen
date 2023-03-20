import 'package:json_annotation/json_annotation.dart';
part 'usermodel.g.dart';

@JsonSerializable()
class ProfileUserModel {
  String? countryId;
  String? countryCode;
  String? countryName;
  String? countryTelcode;
  String? geoLevel0Type;
  String? geoLevel1Id;
  String? geoLevel1Code;
  String? geoLevel1Name;
  String? geoLevel1Type;
  String? geoLevel2Id;
  String? geoLevel2Code;
  String? geoLevel2Name;
  String? geoLevel2Type;
  String? geoLevel3Id;
  String? geoLevel3Code;
  String? geoLevel3Name;
  String? geoLevel3Type;
  String? geoLevel4Id;
  String? geoLevel4Code;
  String? geoLevel4Name;
  String? geoLevel4Type;
  String? geoLevel5Id;
  String? geoLevel5Code;
  String? geoLevel5Name;
  String? geoLevel5Type;
  String? geoLevel6Id;
  String? geoLevel6Code;
  String? geoLevel6Name;
  String? geoLevel6Type;
  String? geoLevel7Id;
  String? geoLevel7Code;
  String? geoLevel7Name;
  String? geoLevel7Type;
  String? geoLevel8Id;
  String? geoLevel8Code;
  String? geoLevel8Name;
  String? geoLevel8Type;
  String? geoLevel9Id;
  String? geoLevel9Code;
  String? geoLevel9Name;
  String? geoLevel9Type;
  int? highestLevelImplemented;
  String? geoLevelId;
  String? geoLevelCode;
  String? geoLevelName;
  String? levelType;
  String? areaLevelFullCode;
  String? id;
  String? username;
  String? personName;
  String? gender;
  String? email;
  String? mobile;
  String? fatherName;
  String? motherName;
  String? birthDate;
  String? birthPlace;
  String? signupDate;
  String? occupation;
  String? organizationName;
  String? desig;
  String? bloodGroup;
  double? homeLatitude;
  double? homeLongitude;
  String? homeAddress;
  String? permanentAddress;
  double? currentLatitude;
  double? currentLongitude;
  String? currentLocationUpdatedOn;
  String? currentLocationUpdatedAt;
  double? officeLatitude;
  double? officeLongitude;
  String? officeAddress;
  String? nidNo;
  String? nidNoVerifiedDate;
  String? nidNoVerificationResponse;
  String? passportNo;
  String? passportIssuePlace;
  String? nationality;
  String? passportIssueDate;
  String? passportExpiredDate;
  String? passportDocVerifiedDate;
  String? passportDocVerificationResponse;
  String? licenseNo;
  String? licenseAuthority;
  String? licenseIssueDate;
  String? licenseExpiredDate;
  String? licenseType;
  String? licenseAllowedVehicle;
  String? birthCertNo;
  String? birthCertDocVerifiedDate;
  String? birthCertDocVerificationResponse;
  String? taxNo;
  String? taxZone;
  String? taxCircle;
  String? taxDocVerifiedDate;
  String? taxDocVerificationResponse;
  int? sscPassYear;
  String? schoolName;
  String? sscGroup;
  String? sscCertificateSerialNo;
  String? sscCertVerifiedDate;
  String? sscCertVerificationResponse;
  int? hscYear;
  String? collegeName;
  String? hscGroup;
  String? hscCertificateSerialNo;
  String? hscCertVerifiedDate;
  String? hscCertVerificationResponse;
  int? bachelorPassYear;
  String? bachelorUniversityName;
  String? bachelorSubjectName;
  String? bachelorCertificateSerialNo;
  String? bachelorCertVerifiedDate;
  String? bachelorCertVerificationResponse;
  int? mastersPassYear;
  String? mastersUniversityName;
  String? mastersSubjectName;
  String? mastersCertificateSerialNo;
  String? mastersCertVerifiedDate;
  String? mastersCertVerificationResponse;
  String? spouseUsername;
  String? spouseName;
  String? spouseMobile;
  String? spouseEmail;
  String? spouseBirthDate;
  String? geographyType;
  String? dataDigest;
  int? authenticationLevel;
  String? surveyRole;
  String? surveyManagerUsername;
  String? otpValue;
  String? otpCreatedDate;
  String? otpCreatedAt;
  String? otpExpiredDate;
  String? otpExpiredAt;
  int? countOtpUse;
  String? fatherUsername;
  String? motherUsername;
  String? personNameLocalLang;
  String? fatherNameLocalLang;
  String? motherNameLocalLang;
  String? roles;
  String? roleGroup;
  int? roleGroupLevel;
  int? roleLevel;
  String? role;
  int? dirtyVersion;
  String? appToken;
  String? appTokenCreatedAt;
  String? appTokenCreatedOn;
  String? userImg;
  String? userHashInfo;
  String? userImgHash;
  int? nidStatus;
  int? passportStatus;
  int? mastersCertificateStatus;
  int? bachelorCertificateStatus;
  int? hscCertificateStatus;
  int? sscCertificateStatus;
  int? birthCertificateStatus;
  int? tinCertificateStatus;
  int? drivingLicenseStatus;
  String? pointOffice;
  String? pointResidence;
  String? pointHome;
  String? masterViewModel;
  String? employeeRole;
  bool? enabled;
  bool? active;
  bool? publicUser;
  bool? locationTraceEnabled;
  bool? nidDocUploaded;
  bool? taxDocUploaded;
  bool? passportDocUploaded;
  bool? sscCertUploaded;
  bool? hscCertUploaded;
  bool? bachelorCertUploaded;
  bool? mastersCertUploaded;
  bool? nidNoVerified;
  bool? passportNoVerified;
  bool? licenseDocUploaded;
  bool? licenseNoVerified;
  bool? birthCertDocUploaded;
  bool? birthCertNoVerified;
  bool? taxNoVerified;
  bool? sscCertVerified;
  bool? hscCertVerified;
  bool? bachelorCertVerified;
  bool? mastersCertVerified;
  bool? employed;
  bool? sscCompleted;
  bool? hscCompleted;
  bool? bachelorCompleted;
  bool? mastersCompleted;

  ProfileUserModel(
      {this.countryId,
      this.countryCode,
      this.countryName,
      this.countryTelcode,
      this.geoLevel0Type,
      this.geoLevel1Id,
      this.geoLevel1Code,
      this.geoLevel1Name,
      this.geoLevel1Type,
      this.geoLevel2Id,
      this.geoLevel2Code,
      this.geoLevel2Name,
      this.geoLevel2Type,
      this.geoLevel3Id,
      this.geoLevel3Code,
      this.geoLevel3Name,
      this.geoLevel3Type,
      this.geoLevel4Id,
      this.geoLevel4Code,
      this.geoLevel4Name,
      this.geoLevel4Type,
      this.geoLevel5Id,
      this.geoLevel5Code,
      this.geoLevel5Name,
      this.geoLevel5Type,
      this.geoLevel6Id,
      this.geoLevel6Code,
      this.geoLevel6Name,
      this.geoLevel6Type,
      this.geoLevel7Id,
      this.geoLevel7Code,
      this.geoLevel7Name,
      this.geoLevel7Type,
      this.geoLevel8Id,
      this.geoLevel8Code,
      this.geoLevel8Name,
      this.geoLevel8Type,
      this.geoLevel9Id,
      this.geoLevel9Code,
      this.geoLevel9Name,
      this.geoLevel9Type,
      this.highestLevelImplemented,
      this.geoLevelId,
      this.geoLevelCode,
      this.geoLevelName,
      this.levelType,
      this.areaLevelFullCode,
      this.id,
      this.username,
      this.personName,
      this.gender,
      this.email,
      this.mobile,
      this.fatherName,
      this.motherName,
      this.birthDate,
      this.birthPlace,
      this.signupDate,
      this.occupation,
      this.organizationName,
      this.desig,
      this.bloodGroup,
      this.homeLatitude,
      this.homeLongitude,
      this.homeAddress,
      this.permanentAddress,
      this.currentLatitude,
      this.currentLongitude,
      this.currentLocationUpdatedOn,
      this.currentLocationUpdatedAt,
      this.officeLatitude,
      this.officeLongitude,
      this.officeAddress,
      this.nidNo,
      this.nidNoVerifiedDate,
      this.nidNoVerificationResponse,
      this.passportNo,
      this.passportIssuePlace,
      this.nationality,
      this.passportIssueDate,
      this.passportExpiredDate,
      this.passportDocVerifiedDate,
      this.passportDocVerificationResponse,
      this.licenseNo,
      this.licenseAuthority,
      this.licenseIssueDate,
      this.licenseExpiredDate,
      this.licenseType,
      this.licenseAllowedVehicle,
      this.birthCertNo,
      this.birthCertDocVerifiedDate,
      this.birthCertDocVerificationResponse,
      this.taxNo,
      this.taxZone,
      this.taxCircle,
      this.taxDocVerifiedDate,
      this.taxDocVerificationResponse,
      this.sscPassYear,
      this.schoolName,
      this.sscGroup,
      this.sscCertificateSerialNo,
      this.sscCertVerifiedDate,
      this.sscCertVerificationResponse,
      this.hscYear,
      this.collegeName,
      this.hscGroup,
      this.hscCertificateSerialNo,
      this.hscCertVerifiedDate,
      this.hscCertVerificationResponse,
      this.bachelorPassYear,
      this.bachelorUniversityName,
      this.bachelorSubjectName,
      this.bachelorCertificateSerialNo,
      this.bachelorCertVerifiedDate,
      this.bachelorCertVerificationResponse,
      this.mastersPassYear,
      this.mastersUniversityName,
      this.mastersSubjectName,
      this.mastersCertificateSerialNo,
      this.mastersCertVerifiedDate,
      this.mastersCertVerificationResponse,
      this.spouseUsername,
      this.spouseName,
      this.spouseMobile,
      this.spouseEmail,
      this.spouseBirthDate,
      this.geographyType,
      this.dataDigest,
      this.authenticationLevel,
      this.surveyRole,
      this.surveyManagerUsername,
      this.otpValue,
      this.otpCreatedDate,
      this.otpCreatedAt,
      this.otpExpiredDate,
      this.otpExpiredAt,
      this.countOtpUse,
      this.fatherUsername,
      this.motherUsername,
      this.personNameLocalLang,
      this.fatherNameLocalLang,
      this.motherNameLocalLang,
      this.roles,
      this.roleGroup,
      this.roleGroupLevel,
      this.roleLevel,
      this.role,
      this.dirtyVersion,
      this.appToken,
      this.appTokenCreatedAt,
      this.appTokenCreatedOn,
      this.userImg,
      this.userHashInfo,
      this.userImgHash,
      this.nidStatus,
      this.passportStatus,
      this.mastersCertificateStatus,
      this.bachelorCertificateStatus,
      this.hscCertificateStatus,
      this.sscCertificateStatus,
      this.birthCertificateStatus,
      this.tinCertificateStatus,
      this.drivingLicenseStatus,
      this.pointOffice,
      this.pointResidence,
      this.pointHome,
      this.masterViewModel,
      this.employeeRole,
      this.enabled,
      this.active,
      this.publicUser,
      this.locationTraceEnabled,
      this.nidDocUploaded,
      this.taxDocUploaded,
      this.passportDocUploaded,
      this.sscCertUploaded,
      this.hscCertUploaded,
      this.bachelorCertUploaded,
      this.mastersCertUploaded,
      this.nidNoVerified,
      this.passportNoVerified,
      this.licenseDocUploaded,
      this.licenseNoVerified,
      this.birthCertDocUploaded,
      this.birthCertNoVerified,
      this.taxNoVerified,
      this.sscCertVerified,
      this.hscCertVerified,
      this.bachelorCertVerified,
      this.mastersCertVerified,
      this.employed,
      this.sscCompleted,
      this.hscCompleted,
      this.bachelorCompleted,
      this.mastersCompleted});

  factory ProfileUserModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileUserModelToJson(this);
}
