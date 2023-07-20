import 'dart:async';

import '../models/user.dart';

class _UserService {
  User _user = User(name: '');

  StreamController<User> _userStreamController = StreamController.broadcast();

  Stream<User> get userStream => _userStreamController.stream;

  User get user => _user;

  bool get userExist => _user.name != '' ? true : false;

  void getUser(User user) {
    _user = user;
    _userStreamController.add(user);
  }

  void setAge(int age) {
    _user.age = age;
    _userStreamController.add(user);
  }

  dispose() {
    _userStreamController.close();
  }
}

final userService = _UserService();
