import 'package:hive_flutter/hive_flutter.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class UserHive {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? firstName;
  @HiveField(2)
  String? lastName;
  @HiveField(3)
  String? emailAddress;
  @HiveField(4)
  String? updatedAt;
  @HiveField(5)
  String? createdAt;
  @HiveField(6)
  String? middleName;
  @HiveField(7)
  String? phoneNumber;
  @HiveField(8)
  String? dob;
  @HiveField(9)
  String? gender;

  UserHive(
      {this.id,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.updatedAt,
      this.createdAt,
      this.middleName,
      this.phoneNumber, this.dob, this.gender});
}
