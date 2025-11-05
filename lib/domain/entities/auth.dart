import 'package:ride_hailing/domain/entities/user.dart';

class AuthEntity {
  bool? status;
  String? message;
  User? user;
  String? token;

  AuthEntity({this.status, this.message, this.user, this.token});

  AuthEntity.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

// class User {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? middleName;
//   String? phoneNumber;
//   String? emailAddress;
//   String? updatedAt;
//   String? createdAt;

//   User(
//       {this.id,
//       this.firstName,
//       this.lastName,
//       this.emailAddress,
//       this.updatedAt,
//       this.createdAt,
//       this.middleName,
//       this.phoneNumber});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//     emailAddress = json['emailAddress'];
//     middleName = json['middleName'];
//     phoneNumber = json['phoneNumber'];
//     updatedAt = json['updatedAt'];
//     createdAt = json['createdAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['firstName'] = firstName;
//     data['lastName'] = lastName;
//     data['emailAddress'] = emailAddress;
//     data['middleName'] = middleName;
//     data['phoneNumber'] = phoneNumber;
//     data['updatedAt'] = updatedAt;
//     data['createdAt'] = createdAt;
//     return data;
//   }
// }
