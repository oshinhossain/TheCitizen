// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_agency_role_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectedAgencyRoleModelAdapter
    extends TypeAdapter<SelectedAgencyRoleModel> {
  @override
  final int typeId = 6;

  @override
  SelectedAgencyRoleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SelectedAgencyRoleModel(
      roleGroup: fields[0] as String?,
      roleGroupLevel: fields[1] as int?,
      roleLevel: fields[2] as int?,
      roleName: fields[3] as String?,
      appCode: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SelectedAgencyRoleModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.roleGroup)
      ..writeByte(1)
      ..write(obj.roleGroupLevel)
      ..writeByte(2)
      ..write(obj.roleLevel)
      ..writeByte(3)
      ..write(obj.roleName)
      ..writeByte(4)
      ..write(obj.appCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedAgencyRoleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
