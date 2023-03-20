// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AgencyListAdapter extends TypeAdapter<AgencyList> {
  @override
  final int typeId = 2;

  @override
  AgencyList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AgencyList(
      agencyList: (fields[0] as List?)?.cast<Agency>(),
    );
  }

  @override
  void write(BinaryWriter writer, AgencyList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.agencyList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AgencyListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
