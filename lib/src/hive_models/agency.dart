import 'package:hive/hive.dart';
import 'local_agency_role_model.dart';
part 'agency.g.dart';

@HiveType(typeId: 1)
class Agency {
  @HiveField(0)
  String? empId;

  @HiveField(1)
  String? userId;

  @HiveField(2)
  String? username;

  @HiveField(3)
  String? fullname;

  @HiveField(4)
  String? email;

  @HiveField(5)
  String? mobile;

  @HiveField(6)
  String? reportingManagerUsername;

  @HiveField(7)
  String? reportingManagerFullname;

  @HiveField(8)
  String? reportingManagerEmail;

  @HiveField(9)
  String? reportingManagerMobile;

  @HiveField(10)
  String? agencyId;

  @HiveField(11)
  String? agencyCode;

  @HiveField(12)
  String? agencyName;

  @HiveField(13)
  String? countryId;

  @HiveField(14)
  String? countryCode;

  @HiveField(15)
  LocalAgencyRoleModel? roleModel;

  @HiveField(16)
  bool? isSelected;

  Agency({
    this.empId,
    this.userId,
    this.username,
    this.fullname,
    this.email,
    this.mobile,
    this.reportingManagerUsername,
    this.reportingManagerFullname,
    this.reportingManagerEmail,
    this.reportingManagerMobile,
    this.agencyId,
    this.agencyCode,
    this.agencyName,
    this.countryId,
    this.countryCode,
    this.roleModel,
    this.isSelected,
  });
}
