import 'dart:convert';

class UserModel {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String updatedAt;
  final String createdAt;
  final String middleName;
  final String phoneNumber;
  final String dob;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.updatedAt,
    required this.createdAt,
    required this.middleName,
    required this.phoneNumber,
    required this.dob,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        firstName: map['firstName'],
        lastName: map['lastName'],
        emailAddress: map['emailAddress'],
        updatedAt: map['updatedAt'],
        createdAt: map['createdAt'],
        middleName: map['middleName'],
        phoneNumber: map['phoneNumber'],
        dob: map['dob'],
      );

  factory UserModel.fromJson(
    String json, {
    bool fromSaved = false,
  }) =>
      UserModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        'firstName': firstName,
        'lastName': lastName,
        'emailAddress': emailAddress,
        'updatedAt': updatedAt,
        'createdAt': createdAt,
        'middleName': middleName,
        'phoneNumber': phoneNumber,
        'dob': dob,
      };

  String toJson() => jsonEncode(toMap());

  // Copy method to create a new instance with updated properties
  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? emailAddress,
    String? updatedAt,
    String? createdAt,
    String? middleName,
    String? phoneNumber,
    String? dob,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      emailAddress: emailAddress ?? this.emailAddress,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      middleName: middleName ?? this.middleName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dob: dob ?? this.dob,
    );
  }
}
