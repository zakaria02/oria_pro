// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as String,
      email: fields[1] as String,
      name: fields[2] as String?,
      role: fields[3] as UserRole,
      accessToken: fields[4] as String,
      accessTokenExpire: fields[5] as DateTime,
      refreshToken: fields[6] as String,
      refreshTokenExpire: fields[7] as DateTime,
      hasFinishedOnboarding: fields[8] as bool,
      birthDay: fields[9] as DateTime?,
      isEmailVerified: fields[10] as bool,
      profilePicture: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.role)
      ..writeByte(4)
      ..write(obj.accessToken)
      ..writeByte(5)
      ..write(obj.accessTokenExpire)
      ..writeByte(6)
      ..write(obj.refreshToken)
      ..writeByte(7)
      ..write(obj.refreshTokenExpire)
      ..writeByte(8)
      ..write(obj.hasFinishedOnboarding)
      ..writeByte(9)
      ..write(obj.birthDay)
      ..writeByte(10)
      ..write(obj.isEmailVerified)
      ..writeByte(11)
      ..write(obj.profilePicture);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserRoleAdapter extends TypeAdapter<UserRole> {
  @override
  final int typeId = 1;

  @override
  UserRole read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserRole.user;
      case 1:
        return UserRole.proUser;
      case 2:
        return UserRole.unknown;
      default:
        return UserRole.user;
    }
  }

  @override
  void write(BinaryWriter writer, UserRole obj) {
    switch (obj) {
      case UserRole.user:
        writer.writeByte(0);
        break;
      case UserRole.proUser:
        writer.writeByte(1);
        break;
      case UserRole.unknown:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRoleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
