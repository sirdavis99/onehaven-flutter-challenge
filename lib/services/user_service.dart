import 'package:flutter/material.dart';
import 'package:ride_hailing/stores/user/model.dart';

class UserService extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void setUser(UserModel? user) {
    if (_user != user) {
      _user = user;
      notifyListeners();
    }
  }

  void clearType() => setUser(null);
}
