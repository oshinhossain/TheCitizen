// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String?,
      username: fields[2] as String?,
      personName: fields[1] as String?,
      email: fields[3] as String?,
      mobile: fields[4] as String?,
      gender: fields[5] as String?,
      token: fields[6] as String?,
      birthDate: fields[7] as String?,
      homeAddress: fields[8] as String?,
      countryCode: fields[9] as String?,
      countryTelcode: fields[10] as String?,
      role: fields[11] as String?,
      roleGroup: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.personName)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.mobile)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.token)
      ..writeByte(7)
      ..write(obj.birthDate)
      ..writeByte(8)
      ..write(obj.homeAddress)
      ..writeByte(9)
      ..write(obj.countryCode)
      ..writeByte(10)
      ..write(obj.countryTelcode)
      ..writeByte(11)
      ..write(obj.role)
      ..writeByte(12)
      ..write(obj.roleGroup);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      username: json['username'] as String?,
      personName: json['personName'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      gender: json['gender'] as String?,
      token: json['token'] as String?,
      birthDate: json['birthDate'] as String?,
      homeAddress: json['homeAddress'] as String?,
      countryCode: json['countryCode'] as String?,
      countryTelcode: json['countryTelcode'] as String?,
      role: json['role'] as String?,
      roleGroup: json['roleGroup'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'personName': instance.personName,
      'username': instance.username,
      'email': instance.email,
      'mobile': instance.mobile,
      'gender': instance.gender,
      'token': instance.token,
      'birthDate': instance.birthDate,
      'homeAddress': instance.homeAddress,
      'countryCode': instance.countryCode,
      'countryTelcode': instance.countryTelcode,
      'role': instance.role,
      'roleGroup': instance.roleGroup,
    };
