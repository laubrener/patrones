import 'package:get/get.dart';
import 'package:states/models/user.dart';

class UserController extends GetxController {
  var userExist = false.obs;
  var user = User().obs;

  int get professionsCount {
    return user.value.professions.length;
  }

  void setUser(User pUser) {
    userExist.value = true;
    user.value = pUser;
  }

  void setAge(int age) {
    user.update((val) {
      val!.age = age;
    });
  }

  void addProfession(String profession) {
    user.update((val) {
      val!.professions = [...val.professions, profession];
    });
  }
}
