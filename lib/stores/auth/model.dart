import 'dart:convert';

class AuthModel {
  final int expires;
  final String token;
  // final UserModel user;

  AuthModel({
    // required this.user,
    required this.token,
    int expires = 2592000, // 30 days
    bool fromSaved = false,
  }) : expires = fromSaved
            ? expires
            : DateTime.now()
                .add(Duration(seconds: expires))
                .millisecondsSinceEpoch;

  factory AuthModel.fromMap(
    Map<String, dynamic> map, {
    bool fromSaved = false,
  }) =>
      AuthModel(
        token: map['token'],
        fromSaved: fromSaved,
        expires: map['expires'] ?? 2592000, // 30 days
        // user: UserModel.fromMap(map['user']),
      );

  factory AuthModel.fromJson(
    String json, {
    bool fromSaved = false,
  }) =>
      AuthModel.fromMap(
        jsonDecode(json),
        fromSaved: fromSaved,
      );

  Map<String, dynamic> toMap() => {
        'token': token,
        'expires': expires,
        // 'user': user.toMap(),
      };

  String toJson() => jsonEncode(toMap());

  // Copy method to create a new instance with updated properties
  AuthModel copyWith({
    String? token,
    int? expires,
    // UserModel? user,
  }) {
    return AuthModel(
      token: token ?? this.token,
      expires: expires ?? 2592000, // 30 days
      // user: user ?? this.user,
    );
  }
}
