class UserEntity {
  bool? status;
  User? user;

  UserEntity({this.status, this.user});

  UserEntity.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? emailAddress;
  String? phoneNumber;
  String? gender;
  String? dateOfBirth;
  String? role;
  String? password;
  String? profileStatus;
  String? driverProfileStatus;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.emailAddress,
      this.phoneNumber,
      this.gender,
      this.dateOfBirth,
      this.role,
      this.password,
      this.profileStatus,
      this.driverProfileStatus,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    role = json['role'];
    password = json['password'];
    profileStatus = json['profileStatus'];
    driverProfileStatus = json['driverProfileStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['emailAddress'] = emailAddress;
    data['phoneNumber'] = phoneNumber;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    data['role'] = role;
    data['password'] = password;
    data['profileStatus'] = profileStatus;
    data['driverProfileStatus'] = driverProfileStatus;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
