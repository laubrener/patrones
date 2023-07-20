import 'package:flutter/material.dart';
import 'package:states/models/user.dart';

import '../services/user_service.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? Text('Nombre: ${snapshot.data.name}')
                : const Text('Pagina 2');
          },
        ),
        centerTitle: true,
      ),
      body: UserInformation(),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              final newUser = User(name: 'Laura', age: 30);

              userService.getUser(newUser);
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
            onPressed: () {},
            color: Colors.blue,
            child: const Text('Añadir profesion',
                style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
