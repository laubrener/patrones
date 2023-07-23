import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/models/user.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInit());

  void selectUser(User user) {
    emit(ActiveUser(user));
  }

  void setAge(int age) {
    final currentState = state;
    if (currentState is ActiveUser) {
      final newUser = currentState.user.copyWith(age: 31);
      emit(ActiveUser(newUser));
    }
  }

  void addProfesion() {
    final currentState = state;
    if (currentState is ActiveUser) {
      final newProfesions = [
        ...currentState.user.profesions,
        'Profesion ${currentState.user.profesions.length + 1}'
      ];
      final newUser = currentState.user.copyWith(profesions: newProfesions);
      emit(ActiveUser(newUser));
    }
  }

  void deleteUser() {
    emit(UserInit());
  }
}
