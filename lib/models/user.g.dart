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
      userId: fields[0] as int,
      name: fields[1] as String,
      email: fields[2] as String,
      profilePictureUrl: fields[3] as String,
      pictures: (fields[4] as List).cast<String>(),
      createdAt: fields[5] as DateTime,
      updatedAt: fields[6] as DateTime,
      bio: fields[7] as String?,
      location: fields[8] as String?,
      phoneNumber: fields[9] as String?,
      preferences: (fields[10] as Map).cast<String, String>(),
      interests: (fields[11] as List).cast<String>(),
      deviceId: fields[12] as String,
      deviceType: fields[13] as String,
      eventIds: (fields[14] as List).cast<int>(),
      groupIds: (fields[15] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.profilePictureUrl)
      ..writeByte(4)
      ..write(obj.pictures)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.bio)
      ..writeByte(8)
      ..write(obj.location)
      ..writeByte(9)
      ..write(obj.phoneNumber)
      ..writeByte(10)
      ..write(obj.preferences)
      ..writeByte(11)
      ..write(obj.interests)
      ..writeByte(12)
      ..write(obj.deviceId)
      ..writeByte(13)
      ..write(obj.deviceType)
      ..writeByte(14)
      ..write(obj.eventIds)
      ..writeByte(15)
      ..write(obj.groupIds);
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
