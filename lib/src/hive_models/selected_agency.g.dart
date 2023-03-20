// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_agency.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectedAgencyAdapter extends TypeAdapter<SelectedAgency> {
  @override
  final int typeId = 7;

  @override
  SelectedAgency read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SelectedAgency(
      empId: fields[0] as String?,
      userId: fields[1] as String?,
      username: fields[2] as String?,
      fullname: fields[3] as String?,
      email: fields[4] as String?,
      mobile: fields[5] as String?,
      reportingManagerUsername: fields[6] as String?,
      reportingManagerFullname: fields[7] as String?,
      reportingManagerEmail: fields[8] as String?,
      reportingManagerMobile: fields[9] as String?,
      agencyId: fields[10] as String?,
      agencyCode: fields[11] as String?,
      agencyName: fields[12] as String?,
      countryId: fields[13] as String?,
      countryCode: fields[14] as String?,
      roleModel: fields[15] as SelectedAgencyRoleModel?,
    );
  }

  @override
  void write(BinaryWriter writer, SelectedAgency obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.empId)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.fullname)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.mobile)
      ..writeByte(6)
      ..write(obj.reportingManagerUsername)
      ..writeByte(7)
      ..write(obj.reportingManagerFullname)
      ..writeByte(8)
      ..write(obj.reportingManagerEmail)
      ..writeByte(9)
      ..write(obj.reportingManagerMobile)
      ..writeByte(10)
      ..write(obj.agencyId)
      ..writeByte(11)
      ..write(obj.agencyCode)
      ..writeByte(12)
      ..write(obj.agencyName)
      ..writeByte(13)
      ..write(obj.countryId)
      ..writeByte(14)
      ..write(obj.countryCode)
      ..writeByte(15)
      ..write(obj.roleModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedAgencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
