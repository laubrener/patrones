import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states/models/user.dart';

import '../controllers/user_controller.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // para mandar argumentos
    // print(Get.arguments);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
        centerTitle: true,
      ),
      body: const UserInformation(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Get.toNamed('firstPage'),
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userCntrl = Get.find<UserController>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              userCntrl.setUser(User(name: 'Laura', age: 30));
              Get.snackbar(
                  'Usuario establecido', 'Laura es el nombre del usuario',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    const BoxShadow(color: Colors.black38, blurRadius: 10)
                  ]);
            },
            color: Colors.blue,
            child: const Text('Establecer Usuario',
                style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            onPressed: () {
              userCntrl.setAge(31);
            },
            color: Colors.blue,
            child: const Text('Cambiar edad',
                style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            onPressed: () {
              userCntrl.addProfession(
                  'profesion #${userCntrl.professionsCount + 1}');
            },
            color: Colors.blue,
            child: const Text('Añadir profesion',
                style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            color: Colors.blue,
            child: const Text('cambiar tema',
                style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
