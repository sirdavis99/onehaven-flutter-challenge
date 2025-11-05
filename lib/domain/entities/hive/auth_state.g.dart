// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthStateHiveAdapter extends TypeAdapter<AuthStateHive> {
  @override
  final int typeId = 1;

  @override
  AuthStateHive read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AuthStateHive.unauthenticated;
      case 1:
        return AuthStateHive.authenticated;
      case 2:
        return AuthStateHive.tokenExpired;
      default:
        return AuthStateHive.unauthenticated;
    }
  }

  @override
  void write(BinaryWriter writer, AuthStateHive obj) {
    switch (obj) {
      case AuthStateHive.unauthenticated:
        writer.writeByte(0);
        break;
      case AuthStateHive.authenticated:
        writer.writeByte(1);
        break;
      case AuthStateHive.tokenExpired:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthStateHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
