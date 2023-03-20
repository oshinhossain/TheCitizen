import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? personName;
  @HiveField(2)
  String? username;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? mobile;
  @HiveField(5)
  String? gender;
  @HiveField(6)
  String? token;
  @HiveField(7)
  String? birthDate;
  @HiveField(8)
  String? homeAddress;
  @HiveField(9)
  String? countryCode;
  @HiveField(10)
  String? countryTelcode;
  @HiveField(11)
  String? role;
  @HiveField(12)
  String? roleGroup;
  @HiveField(13)

  // List<int>? photo;

  // @JsonKey(fromJson: _fromJson, toJson: _toJson)
  // Uint8List? photo;

  // static Uint8List? _fromJson(List<int> x) => Uint8List.fromList(x);
  // static Uint8List? _toJson(Uint8List? photo) => photo;

  User({
    this.id,
    this.username,
    this.personName,
    this.email,
    this.mobile,
    this.gender,
    this.token,
    // this.photo,
    this.birthDate,
    this.homeAddress,
    this.countryCode,
    this.countryTelcode,
    this.role,
    this.roleGroup,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
