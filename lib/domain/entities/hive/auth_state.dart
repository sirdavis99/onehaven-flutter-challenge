


import 'package:hive_flutter/hive_flutter.dart';
part 'auth_state.g.dart';

@HiveType(typeId: 1)
enum AuthStateHive {
  @HiveField(0)
  unauthenticated,
  @HiveField(1)
  authenticated,
  @HiveField(2)
  tokenExpired
}
