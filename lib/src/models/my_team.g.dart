// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyTeam _$MyTeamFromJson(Map<String, dynamic> json) => MyTeam(
      empId: json['empId'] as String?,
      userId: json['userId'] as String?,
      username: json['username'] as String?,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      gender: json['gender'] as String?,
      reportingManagerUsername: json['reportingManagerUsername'] as String?,
      reportingManagerFullname: json['reportingManagerFullname'] as String?,
      reportingManagerEmail: json['reportingManagerEmail'] as String?,
      reportingManagerMobile: json['reportingManagerMobile'] as String?,
      agencyId: json['agencyId'] as String?,
      agencyCode: json['agencyCode'] as String?,
      agencyName: json['agencyName'] as String?,
      countryId: json['countryId'] as String?,
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      currentLocationUpdatedOn: json['currentLocationUpdatedOn'] as String?,
      currentLocationUpdatedAt: json['currentLocationUpdatedAt'] as String?,
      roleModel: json['roleModel'] == null
          ? null
          : AgencyRoleModel.fromJson(json['roleModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyTeamToJson(MyTeam instance) => <String, dynamic>{
      'empId': instance.empId,
      'userId': instance.userId,
      'username': instance.username,
      'fullname': instance.fullname,
      'email': instance.email,
      'mobile': instance.mobile,
      'gender': instance.gender,
      'reportingManagerUsername': instance.reportingManagerUsername,
      'reportingManagerFullname': instance.reportingManagerFullname,
      'reportingManagerEmail': instance.reportingManagerEmail,
      'reportingManagerMobile': instance.reportingManagerMobile,
      'agencyId': instance.agencyId,
      'agencyCode': instance.agencyCode,
      'agencyName': instance.agencyName,
      'countryId': instance.countryId,
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'currentLocationUpdatedOn': instance.currentLocationUpdatedOn,
      'currentLocationUpdatedAt': instance.currentLocationUpdatedAt,
      'roleModel': instance.roleModel,
    };
