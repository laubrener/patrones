import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../services/user_service.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: userService.userExist
            ? Text('Nombre: ${userService.user!.name}')
            : const Text('Pagina 2'),
        centerTitle: true,
      ),
      body: const UserInformation(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'firstPage'),
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
    final userService = Provider.of<UserService>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              // dentro de un metodo no puede redibujar por eso va listen en false
              // final userService =
              //     Provider.of<UserService>(context, listen: false);
              final newUser = User(
                  name: 'Laura',
                  age: 30,
                  profesions: ['Fullstack Developer', 'Arteterapeuta']);

              userService.user = newUser;
            },
            color: Colors.blue,
            child: const Text('Establecer Usuario',
                style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            onPressed: () {
              userService.setAge(31);
            },
            color: Colors.blue,
            child: const Text('Cambiar edad',
                style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            onPressed: () {
              userService.addProfesion();
            },
            color: Colors.blue,
            child: const Text('Añadir profesion',
                style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
