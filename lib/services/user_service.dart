import 'package:flutter/material.dart';
import 'package:states/models/user.dart';

class UserService with ChangeNotifier {
  User? _user;

  User? get user => _user;
  bool get userExist => (_user != null) ? true : false;

  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  void setAge(int age) {
    user?.age = age;
    notifyListeners();
  }

  void removeUser() {
    user = null;
    notifyListeners();
  }

  void addProfesion() {
    user?.profesions.add('Profesion ${user!.profesions.length + 1}');
    notifyListeners();
  }
}
