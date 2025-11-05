import 'package:flutter/material.dart';
import 'package:onehaven_flutter_challenge/domain/auth/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService with ChangeNotifier {
  AuthModel? _auth;
  final String _authKey = 'auth';
  final SharedPreferences _sharedPreferences;

  AuthService(this._sharedPreferences) {
    var auth = _sharedPreferences.getString(_authKey);

    if (auth != null) {
      _auth = AuthModel.fromJson(auth, fromSaved: true);
    }
  }

  AuthModel? get auth => _auth;

  // UserModel? get user => _auth?.user;

  String? get token => _auth?.token;

  bool get isSignedIn => _auth != null;

  bool get isLoggedIn =>
      token != null && DateTime.now().millisecondsSinceEpoch < _auth!.expires;

  Future<void> setAuth(AuthModel? auth) async {
    _auth = auth;

    if (auth != null) {
      await _sharedPreferences.setString(_authKey, auth.toJson());
    } else {
      await _sharedPreferences.remove(_authKey);
    }

    notifyListeners();
  }

  Future<void> clearAuth() => setAuth(null);
}
