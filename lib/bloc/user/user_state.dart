part of 'user_cubit.dart';

abstract class UserState {}

class UserInit extends UserState {
  final userExists = false;

  @override
  String toString() {
    return 'UserInit: userExists: false';
  }
}

class ActiveUser extends UserState {
  final userExists = true;
  final User user;

  ActiveUser(this.user);
}
